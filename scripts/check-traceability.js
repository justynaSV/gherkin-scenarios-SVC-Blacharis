const fs = require('fs');
const path = require('path');

const featuresDir = path.join(process.cwd(), 'features');
const traceabilityPath = path.join(process.cwd(), 'docs', 'traceability.md');
const baselinePath = path.join(__dirname, 'traceability-baseline.json');
const scenarioPattern = /^\s*Scenario(?: Outline)?:\s+(.+)\s*$/;

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

if (!fs.existsSync(traceabilityPath)) {
  console.error('Traceability matrix is missing: docs/traceability.md');
  process.exit(1);
}

const traceability = fs.readFileSync(traceabilityPath, 'utf8');

// Scenarios written before traceability enforcement was introduced are grandfathered in here so
// that pre-existing debt doesn't block unrelated PRs. New/changed scenarios still must be traced -
// see docs/traceability.md.
/** @type {Set<string>} */
const baseline = fs.existsSync(baselinePath) ? new Set(JSON.parse(fs.readFileSync(baselinePath, 'utf8'))) : new Set();

/** @type {string[]} */
const missing = [];
let grandfatheredCount = 0;

for (const featurePath of walk(featuresDir)) {
  const relativePath = path.relative(process.cwd(), featurePath).split(path.sep).join('/');
  const content = fs.readFileSync(featurePath, 'utf8');

  for (const line of content.split(/\r?\n/)) {
    const match = line.match(scenarioPattern);

    if (!match) {
      continue;
    }

    const scenarioName = match[1].trim();
    const key = `${relativePath} -> ${scenarioName}`;

    if (!traceability.includes(relativePath) || !traceability.includes(scenarioName)) {
      if (baseline.has(key)) {
        grandfatheredCount += 1;
      } else {
        missing.push(key);
      }
    }
  }
}

if (missing.length > 0) {
  console.error('Traceability matrix is missing scenario coverage for new/changed scenarios:');
  missing.forEach((entry) => console.error(`- ${entry}`));
  console.error('\nAdd an entry to docs/traceability.md for each scenario above.');
  process.exit(1);
}

if (grandfatheredCount > 0) {
  console.log(
    `Traceability matrix check passed (${grandfatheredCount} pre-existing scenario(s) grandfathered via scripts/traceability-baseline.json).`
  );
} else {
  console.log('Traceability matrix covers all feature scenarios.');
}
