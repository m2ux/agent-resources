# Test Documentation Generation Prompt

Generate comprehensive test suite documentation (`test/README.md`) with hyperlinks, parameters, pass/fail criteria, and purpose descriptions.

**Output Location:** `test/README.md`

---

## Step 1: Discover Test Files

Search for all test files in the project:

```bash
# E2E tests
find src/__tests__/e2e -name "*.test.ts"

# Integration tests
find src/__tests__/integration -name "*.test.ts"

# Unit tests (excluding e2e and integration)
find src -path "*/__tests__/*.test.ts" -not -path "*/e2e/*" -not -path "*/integration/*"

# Property tests
find src -name "*.property.test.ts"
```

---

## Step 2: Extract Test Information

For each test file, read and extract:

| Field | Description |
|-------|-------------|
| Test file path | Full relative path from project root |
| Test names | The string in `it('...')` or `test('...')` |
| Line numbers | Line number where each test starts |
| Test parameters | Input values, configurations, mocks used |
| Pass/fail criteria | What the test asserts (expect statements) |
| Purpose | What behavior or invariant the test validates |

**Example extraction:**

```typescript
// Line 29
it('should limit concurrent operations and queue overflow properly', async () => {
  // Parameters: maxConcurrent: 5, maxQueue: 10, 20 operations
  // Pass/Fail: 15 successful, 5 rejected
  // Purpose: Verify concurrency limits are enforced
});
```

---

## Step 3: Document Structure

Create `test/README.md` with this structure:

### Header

```markdown
# Test Suite Documentation

This document provides a comprehensive reference for all tests in the project.

## Running Tests

\`\`\`bash
npm test                                    # Run all tests
npm test -- src/__tests__/e2e/             # E2E tests only
npm test -- src/__tests__/integration/     # Integration tests only
npm test -- --grep "property"              # Property tests only
npm test -- --coverage                     # With coverage
\`\`\`
```

### Table of Contents

```markdown
## Table of Contents

1. [E2E Tests](#e2e-tests)
2. [Integration Tests](#integration-tests)
3. [Unit Tests](#unit-tests)
   - [Tool Operations](#tool-operations)
   - [Infrastructure: Resilience](#infrastructure-resilience)
   - [Infrastructure: Cache](#infrastructure-cache)
   - [Concepts Module](#concepts-module)
4. [Property Tests](#property-tests)
```

### Test Section Template

```markdown
## E2E Tests

End-to-end tests validate complete system behavior under realistic conditions.

**Location**: `src/__tests__/e2e/`

### Test Suite Name ([filename.e2e.test.ts](../path/to/file.e2e.test.ts))

Brief description of what this test suite validates.

| Test | Parameters | Pass/Fail Criteria | Purpose |
|------|------------|-------------------|---------|
| [`test name here`](../path/to/file.e2e.test.ts#L29) | param1: value | assertion | description |
```

### Test Helpers Section

```markdown
## Test Helpers

**Location**: [`src/__tests__/test-helpers/`](../src/__tests__/test-helpers/)

- [`test-data.ts`](../src/__tests__/test-helpers/test-data.ts) - Test data builders
- [`mock-repositories.ts`](../src/__tests__/test-helpers/mock-repositories.ts) - Fake repositories
- [`mock-services.ts`](../src/__tests__/test-helpers/mock-services.ts) - Fake services
```

---

## Step 4: Hyperlinking Rules

### File Links in Headers

```markdown
### Test Suite ([filename.test.ts](../relative/path/to/filename.test.ts))
```

### Test Function Links

Use `#L<line>` anchors to link to specific tests:

```markdown
| [`should do something`](../path/to/file.test.ts#L29) | ... |
```

### Directory Links

```markdown
**Location**: [`src/__tests__/test-helpers/`](../src/__tests__/test-helpers/)
```

### Path Format

Use relative paths from `test/README.md` (start with `../`)

> **Note:** `#L<line>` anchors work in GitHub and most code browsers. Some IDEs may not support navigation via line anchors, but the links remain valid references.

---

## Step 5: Table Formatting

For each test, create a table row:

| Column | Content |
|--------|---------|
| Test | Hyperlinked test name in backticks |
| Parameters | Key inputs, configs, mock values |
| Pass/Fail Criteria | What assertions must pass |
| Purpose | One-line description of what's validated |

**Example:**

```markdown
| [`should limit concurrent operations`](../src/__tests__/e2e/bulkhead.test.ts#L29) | maxConcurrent: 5, 20 ops | 15 success, 5 rejected | Verify concurrency limits |
```

---

## Step 6: Categorization

Organize tests by:

1. **Test type:** E2E → Integration → Unit → Property
2. **Module/component:** Group unit tests by source module
3. **Functionality:** Within each module, group related tests

### Categories for This Project

| Category | Description |
|----------|-------------|
| E2E | System-level behavior tests |
| Integration | Cross-component workflow tests |
| Unit/Tool Operations | MCP tool tests |
| Unit/Infrastructure-Resilience | Circuit breaker, bulkhead, timeout |
| Unit/Infrastructure-Cache | LRU, embedding, search result caches |
| Unit/Concepts | Query expansion, concept matching, enrichment |
| Property | Mathematical invariant tests |

---

## Step 7: Final Checklist

Before completing documentation:

- [ ] All test files discovered and documented
- [ ] Each test has hyperlink to source file with line number
- [ ] Test file names in section headers are hyperlinked
- [ ] Parameters column captures key inputs
- [ ] Pass/fail criteria reflect actual assertions
- [ ] Purpose describes what behavior is validated
- [ ] Test helpers section included with hyperlinks
- [ ] Running tests section has correct commands
- [ ] Table of contents links to all sections
- [ ] Reference added to main README.md

---

## Maintenance

### When Tests Are Added or Modified

1. Re-run test discovery (Step 1)
2. Update affected test tables
3. Verify line numbers are still accurate
4. Update test counts if applicable

### When Line Numbers Change (Refactoring)

1. Use grep to find new line numbers for test names
2. Update `#L<line>` anchors in documentation

