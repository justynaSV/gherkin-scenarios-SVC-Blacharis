const fs = require('fs');
const path = require('path');

const featuresDir = path.join(process.cwd(), 'features');
const traceabilityPath = path.join(process.cwd(), 'docs', 'traceability.md');
const isCheckMode = process.argv.includes('--check');

const STORY_ID_PATTERN = /\b([A-Z][A-Z0-9]+-\d+)\b/;
const AC_COMMENT_PATTERN = /^\s*#\s*(?:AC\s*(\d+)?|Acceptance criterion)\s*:?\s*(.*)$/i;
const TAG_LINE_PATTERN = /^\s*(@\S+(?:\s+@\S+)*)\s*$/;
const SCENARIO_PATTERN = /^\s*(Scenario(?: Outline)?):\s+(.+?)\s*$/;
const FEATURE_LINE_PATTERN = /^\s*Feature:/;

/**
 * Recursively find every .feature file under a directory.
 * @param {string} directory
 * @returns {string[]}
 */
const walk = (directory) => {
  if (!fs.existsSync(directory)) return [];

  return fs.readdirSync(directory, { withFileTypes: true }).flatMap((entry) => {
    const fullPath = path.join(directory, entry.name);
    if (entry.isDirectory()) return walk(fullPath);
    return entry.isFile() && entry.name.endsWith('.feature') ? [fullPath] : [];
  });
};

/**
 * Escape a value for safe use inside a Markdown table cell.
 * @param {string} value
 * @returns {string}
 */
const escapeCell = (value) => value.replace(/\|/g, '\\|').trim();

/**
 * Parse a single .feature file into traceability rows.
 * @param {string} filePath
 * @returns {{ storyId: string, ac: string, featurePath: string, scenario: string, tags: string }[]}
 */
const parseFeatureFile = (filePath) => {
  const relativePath = path.relative(process.cwd(), filePath).split(path.sep).join('/');
  const lines = fs.readFileSync(filePath, 'utf8').split(/\r?\n/);

  // Story ID: first ticket-shaped reference anywhere before the Feature: line
  // (e.g. "# Zadanie QA: SVCLOUD-5585 ..."). Falls back to blank if none found.
  let storyId = '';
  for (const line of lines) {
    if (FEATURE_LINE_PATTERN.test(line)) break;
    const match = line.match(STORY_ID_PATTERN);
    if (match) {
      storyId = match[1];
      break;
    }
  }

  /** @type {{ storyId: string, ac: string, featurePath: string, scenario: string, tags: string }[]} */
  const rows = [];
  /** @type {string[]} */
  let pendingAcComments = [];
  let pendingTags = '';
  let featureTags = '';
  let seenFeatureLine = false;

  for (const line of lines) {
    const acMatch = line.match(AC_COMMENT_PATTERN);
    if (acMatch) {
      const [, acNumber, acText] = acMatch;
      pendingAcComments.push(acNumber ? `AC${acNumber}${acText ? `: ${acText}` : ''}` : acText || 'AC');
      continue;
    }

    if (FEATURE_LINE_PATTERN.test(line)) {
      seenFeatureLine = true;
      continue;
    }

    const tagMatch = line.match(TAG_LINE_PATTERN);
    if (tagMatch) {
      if (!seenFeatureLine) {
        // Tag line directly above "Feature:" applies to every scenario in the file.
        featureTags = tagMatch[1].trim();
      } else {
        pendingTags = tagMatch[1].trim();
      }
      continue;
    }

    const scenarioMatch = line.match(SCENARIO_PATTERN);
    if (scenarioMatch) {
      const combinedTags = [featureTags, pendingTags].filter(Boolean).join(' ');
      rows.push({
        storyId: storyId || '—',
        ac: pendingAcComments.length > 0 ? pendingAcComments.join('; ') : '—',
        featurePath: relativePath,
        scenario: scenarioMatch[2].trim(),
        tags: combinedTags || '—',
      });
      pendingAcComments = [];
      pendingTags = '';
    }
  }

  return rows;
};

const allRows = walk(featuresDir)
  .sort()
  .flatMap(parseFeatureFile);

const header = `# Traceability Matrix

This file is generated from the \`.feature\` files by \`npm run trace:generate\`.
Do not edit the table by hand — edit the \`# Zadanie\`/\`# AC\` comments and tags in the
feature files instead, then regenerate. \`npm run validate\` fails if this file is stale.

| Story ID | Acceptance criterion | Feature file | Scenario name | Tags |
| --- | --- | --- | --- | --- |
`;

const tableRows = allRows
  .map((row) => `| ${escapeCell(row.storyId)} | ${escapeCell(row.ac)} | \`${escapeCell(row.featurePath)}\` | \`${escapeCell(row.scenario)}\` | \`${escapeCell(row.tags)}\` |`)
  .join('\n');

const generatedContent = `${header}${tableRows}\n`;

if (isCheckMode) {
  const existing = fs.existsSync(traceabilityPath) ? fs.readFileSync(traceabilityPath, 'utf8') : '';

  if (existing !== generatedContent) {
    console.error('docs/traceability.md is out of date.');
    console.error('Run: npm run trace:generate');
    process.exit(1);
  }

  console.log(`Traceability matrix is up to date (${allRows.length} scenario(s)).`);
  process.exit(0);
}

fs.mkdirSync(path.dirname(traceabilityPath), { recursive: true });
fs.writeFileSync(traceabilityPath, generatedContent);
console.log(`docs/traceability.md regenerated (${allRows.length} scenario(s)).`);