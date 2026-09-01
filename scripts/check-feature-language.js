const fs = require('fs');
const path = require('path');

const featuresDir = path.join(process.cwd(), 'features');
const stepPattern = /^\s*(Given|When|Then|And|But)\s+(.+)\s*$/;
const blockTitlePattern = /^\s*(?:Feature|Background|Scenario(?: Outline)?):\s*(.*)\s*$/;
const polishCharacterPattern = /[ąćęłńóśźż]/i;
// Words shorter than 3 characters are excluded: they collide across languages
// (e.g. English "i"/"a"/"do" vs. Polish "i"/"a"/"do") and produce false positives.
const polishWords = new Set([
  'aby',
  'automatycznie',
  'brak',
  'części',
  'czesci',
  'dla',
  'gdy',
  'ikona',
  'ikonę',
  'ikone',
  'jest',
  'jako',
  'jeśli',
  'jesli',
  'kalendarz',
  'kalendarzu',
  'nazwa',
  'nazwy',
  'naprawa',
  'naprawie',
  'nie',
  'oraz',
  'potwierdzone',
  'potwierdzenia',
  'przegląda',
  'przeglada',
  'system',
  'ukrycie',
  'użytkownik',
  'uzytkownik',
  'wartość',
  'wartosc',
  'weryfikuje',
  'widoczna',
  'widok',
  'wyświetlenie',
  'wyswietlenie',
  'zadanie',
  'zadaniu',
  'zaktualizowany',
  'zostaje',
  'zostały',
  'zostaly'
]);
const englishWords = new Set([
  'able',
  'access',
  'account',
  'action',
  'administrator',
  'after',
  'and',
  'api',
  'authentication',
  'billing',
  'button',
  'can',
  'cannot',
  'completed',
  'credentials',
  'direct',
  'email',
  'empty',
  'enter',
  'error',
  'fields',
  'form',
  'github',
  'has',
  'invalid',
  'link',
  'login',
  'member',
  'not',
  'organization',
  'page',
  'password',
  'permissions',
  'registered',
  'request',
  'reset',
  'role',
  'see',
  'settings',
  'should',
  'sign',
  'successful',
  'sensitive',
  'actions',
  'are',
  'protected',
  'that',
  'the',
  'token',
  'unknown',
  'user',
  'valid',
  'with'
]);

/**
 * @param {string} directory
 * @returns {string[]}
 */
const walk = (directory) => {
  if (!fs.existsSync(directory)) {
    return [];
  }

  return fs.readdirSync(directory, { withFileTypes: true }).flatMap((entry) => {
    const fullPath = path.join(directory, entry.name);

    if (entry.isDirectory()) {
      return walk(fullPath);
    }

    return entry.isFile() && entry.name.endsWith('.feature') ? [fullPath] : [];
  });
};

/**
 * @param {string} text
 * @returns {{ pl: number, en: number }}
 */
const scoreLanguages = (text) => {
  const normalized = text
    .replace(/<[^>]+>/g, ' ')
    .replace(/"[^"]*"/g, ' ')
    .toLowerCase();

  const words = normalized.match(/[a-ząćęłńóśźż]+/gi) || [];
  const score = { pl: 0, en: 0 };

  words.forEach((word) => {
    if (polishCharacterPattern.test(word)) {
      score.pl += 2;
    }

    if (polishWords.has(word)) {
      score.pl += 1;
    }

    if (englishWords.has(word)) {
      score.en += 1;
    }
  });

  return score;
};

/**
 * Collects every human-readable line (titles + steps), skipping tags, tables, comments and blank lines.
 * @param {string} content
 * @returns {{ line: number, text: string }[]}
 */
const extractTexts = (content) => {
  /** @type {{ line: number, text: string }[] } */
  const texts = [];
  let isInExamples = false;

  content.split(/\r?\n/).forEach((line, index) => {
    const lineNumber = index + 1;
    const trimmed = line.trim();

    if (trimmed === '' || trimmed.startsWith('#') || trimmed.startsWith('@')) {
      return;
    }

    if (/^Examples:\s*$/i.test(trimmed)) {
      isInExamples = true;
      return;
    }

    if (isInExamples || trimmed.startsWith('|')) {
      return;
    }

    const stepMatch = line.match(stepPattern);

    if (stepMatch) {
      texts.push({ line: lineNumber, text: stepMatch[2].trim() });
      return;
    }

    const titleMatch = line.match(blockTitlePattern);
    const text = titleMatch ? titleMatch[1].trim() : trimmed;

    if (text) {
      texts.push({ line: lineNumber, text });
    }
  });

  return texts;
};

/** @type {string[]} */
const errors = [];

for (const featurePath of walk(featuresDir)) {
  const relativePath = path.relative(process.cwd(), featurePath).split(path.sep).join('/');
  const content = fs.readFileSync(featurePath, 'utf8');
  const texts = extractTexts(content);

  if (texts.length === 0) {
    continue;
  }

  // Determine the file's dominant language from its overall vocabulary, instead of
  // per-block, so short lines with no vocabulary signal of their own aren't judged in isolation.
  const total = texts.reduce(
    (languages, entry) => {
      const lineScore = scoreLanguages(entry.text);
      languages.pl += lineScore.pl;
      languages.en += lineScore.en;
      return languages;
    },
    { pl: 0, en: 0 }
  );

  // No signal at all (e.g. only numbers/quoted values) - nothing to validate against, skip.
  if (total.pl === 0 && total.en === 0) {
    continue;
  }

  if (total.pl === total.en) {
    errors.push(`${relativePath}: ambiguous dominant language (equal PL/EN signal) - please check manually.`);
    continue;
  }

  const expectedLanguage = total.pl > total.en ? 'pl' : 'en';
  const otherLanguage = expectedLanguage === 'pl' ? 'en' : 'pl';

  texts.forEach((entry) => {
    const lineScore = scoreLanguages(entry.text);

    // Only flag lines with actual signal for the other language and none for the expected
    // one - a line with no vocabulary signal at all is ambiguous, not wrong, so it's not an error.
    if (lineScore[otherLanguage] > 0 && lineScore[expectedLanguage] === 0) {
      errors.push(
        `${relativePath}:${entry.line}: expected ${expectedLanguage.toUpperCase()} text, found ${otherLanguage.toUpperCase()} signal only: ${entry.text}`
      );
    }
  });
}

if (errors.length > 0) {
  console.error('Feature language validation failed:');
  errors.forEach((error) => console.error(`- ${error}`));
  process.exit(1);
}

console.log('Feature language validation passed.');