const fs = require('fs');
const path = require('path');
const { walkFeatureFiles, toRelativePath } = require('./lib/feature-files');

const traceabilityPath = path.join(process.cwd(), 'docs', 'traceability.md');

const STORY_ID_PATTERN = /\b([A-Z][A-Z0-9]+-\d+)\b/;
// Traceability comments: "# AC: ...", "# AC1: ...", "# AC2, AC5: ...",
// "# AC6/AC7: ...", "# AC1 (dawne T10 - SVCLOUD-5613): ...". Group 1 is the
// AC reference (or comma/slash-separated list of them); group 2 is the rest of
// the line. The \b after the reference list is what stops ordinary comments
// ("# Action: ...", "# Account ...", "# Acceptance criterion: ...") from being
// mistaken for acceptance criteria — without it, the leading "Ac" matched.
const AC_COMMENT_PATTERN = /^\s*#\s*(AC\s*\d*(?:\s*[,/]\s*AC\s*\d*)*)\b\s*(.*)$/i;
const TAG_LINE_PATTERN = /^\s*(@\S+(?:\s+@\S+)*)\s*$/;
const SCENARIO_PATTERN = /^\s*(Scenario(?: Outline)?):\s+(.+?)\s*$/;
const FEATURE_LINE_PATTERN = /^\s*Feature:/;

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
  const relativePath = toRelativePath(filePath);
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
      const acRefs = acMatch[1].replace(/\s+/g, '').replace(/,/g, ', ');
      const acText = acMatch[2].replace(/^:\s*/, '').trim();
      const bareAc = /^AC$/i.test(acRefs);
      // A bare "# AC:" carries no number, so the description stands on its own;
      // anything numbered keeps its "AC1: " / "AC2, AC5: " prefix.
      pendingAcComments.push(bareAc ? acText || 'AC' : acText ? `${acRefs}: ${acText}` : acRefs);
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

/**
 * Build the full `docs/traceability.md` content from the current `.feature` files.
 * @returns {{ content: string, count: number }}
 */
const buildTraceabilityContent = () => {
  const allRows = walkFeatureFiles()
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

  return { content: `${header}${tableRows}\n`, count: allRows.length };
};

/**
 * In `check` mode, report whether `docs/traceability.md` is up to date without
 * touching it. Otherwise (re)write the file. Returns a result for `lib/report`.
 * @param {{ check?: boolean }} [options]
 */
const generateTraceability = ({ check = false } = {}) => {
  const { content, count } = buildTraceabilityContent();

  if (check) {
    const existing = fs.existsSync(traceabilityPath) ? fs.readFileSync(traceabilityPath, 'utf8') : '';

    // Compare line-ending-agnostically: the file is generated with \n, but a
    // Windows checkout with core.autocrlf=true stores it as \r\n, which would
    // otherwise make this check fail on a freshly generated file.
    const normalise = (/** @type {string} */ text) => text.replace(/\r\n/g, '\n');

    if (normalise(existing) !== normalise(content)) {
      return {
        label: 'Traceability matrix',
        failHeader: null,
        errorLines: ['docs/traceability.md is out of date.', 'Run: npm run trace:generate']
      };
    }

    return {
      label: 'Traceability matrix',
      passMessage: `Traceability matrix is up to date (${count} scenario(s)).`
    };
  }

  fs.mkdirSync(path.dirname(traceabilityPath), { recursive: true });
  fs.writeFileSync(traceabilityPath, content);

  return {
    label: 'Traceability matrix',
    passMessage: `docs/traceability.md regenerated (${count} scenario(s)).`
  };
};

module.exports = { generateTraceability, buildTraceabilityContent };

if (require.main === module) {
  const { reportResult } = require('./lib/report');
  const result = generateTraceability({ check: process.argv.includes('--check') });
  process.exit(reportResult(result) ? 0 : 1);
}