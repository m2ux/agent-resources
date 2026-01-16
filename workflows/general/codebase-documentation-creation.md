# Codebase Documentation Creation Guide

A comprehensive guide for AI agents creating markdown documentation for existing codebases. This guide captures best practices, templates, and workflows derived from successful documentation projects.

---

## Overview

This guide covers the end-to-end process of documenting an existing codebase, including:
- README files for packages/modules
- Architecture overview documents
- Glossaries of domain-specific terms
- Technical deep-dive documents with references
- Central index documents

## Core Principles

1. **Read Before Writing** - Always explore and understand code before documenting it
2. **Verify Against Source** - All claims must be traceable to source code or official docs
3. **Flag Uncertainty** - Clearly mark inferred or assumed content for user review
4. **Maintain Consistency** - Use templates and follow established patterns
5. **Enable Navigation** - Use hyperlinks, cross-references, and indexes

---

## Phase 1: Planning

### 1.1 Create Work Package Plan

Create a planning document in `.engineering/artifacts/planning/{date}-{description}/`:

```markdown
# Work Package: {Description}

**Date:** {YYYY-MM-DD}
**Type:** Documentation
**Status:** Planning

## Scope

**In Scope:**
- {List what will be documented}

**Out of Scope:**
- {List exclusions}

## Current State Analysis

| Package/Module | Documentation Status | Action |
|----------------|---------------------|--------|
| `{name}` | Missing/Minimal/Good | Create/Update/Skip |

## Approach

### Grouping Strategy
{Group related packages for efficient context management}

### Implementation Order
1. {Group 1} - {Rationale}
2. {Group 2} - {Rationale}
```

### 1.2 Create Documentation Template

Store templates in the planning folder for reference during implementation.

**README Template Structure:**

```markdown
# {Package Name}

{One-line description}

## Overview
{2-4 sentences on purpose and architecture fit}

## API Specification
{Tables for types, traits, functions, features}

## Architecture
{ASCII diagrams for complex packages}

## Integration
{Dependencies and dependents}

## Testing
{How to run tests}

## See Also
{Links to related packages}
```

**See**: `.engineering/artifacts/planning/2025-12-01-cargo-package-readme-documentation/README-TEMPLATE.md` for a complete example.

---

## Phase 2: Content Creation

### 2.1 Understanding Code Before Documenting

**Required exploration before writing any README:**

```
1. Read Cargo.toml / package.json / equivalent
   - Package name, description, version
   - Dependencies and their roles
   - Feature flags

2. Read main entry point (lib.rs, index.ts, etc.)
   - Public exports
   - Module structure
   - Core types and traits

3. Identify key modules
   - Use semantic search for patterns
   - Look for design patterns mentioned in rustdoc/JSDoc

4. Check for existing documentation
   - Inline doc comments
   - README files
   - ADRs or design docs
```

### 2.2 ASCII Art Guidelines

**CRITICAL**: Use ASCII characters only for diagrams to ensure alignment.

**Allowed Characters:**
- `+` for corners
- `-` for horizontal lines
- `|` for vertical lines
- `>`, `<`, `^`, `v` for arrows
- Standard ASCII text for content

**Correct Example:**
```
+---------------+      +---------------+
| Component A   | ---> | Component B   |
+---------------+      +---------------+
        |
        v
+---------------+
| Component C   |
+---------------+
```

**AVOID Unicode box-drawing:**
```
┌───────────────┐      ┌───────────────┐
│ Component A   │ ───▶ │ Component B   │
└───────────────┘      └───────────────┘
```

**Why**: Unicode box-drawing characters render with inconsistent widths across fonts and editors, causing misalignment.

**For hierarchies, prefer indented lists:**
```
Runtime
├── System Pallets: System, Timestamp, Sudo
├── Consensus: Aura, Grandpa, Beefy
└── Custom: YourPallet, YourSystem
```

### 2.3 Inference Flagging

When content cannot be directly verified from source:

**Flag with warning notes BELOW the referenced section:**

```markdown
### Proving Time

| Operation | Typical Duration |
|-----------|------------------|
| Deploy | 10-30 seconds |

> ⚠️ Duration estimates are approximate. Verify against benchmarks.
```

**NOT above:**
```markdown
> ⚠️ This section contains estimates.

### Proving Time
...
```

---

## Phase 3: Reference System

### 3.1 Hyperlinked References

Use academic-style numbered references with hyperlinks. **Inline references link directly to external URLs.** The references table at document end is maintained as an index/lookup.

**In document body (links directly to external URL):**
```markdown
The compiler transforms source code [[1]](https://docs.example.com) into artifacts [[2]](https://github.com/org/repo/blob/branch/src/compiler/mod.rs#L15-L42).
```

**In references table (at document end, for lookup/index):**
```markdown
## References

| # | Source | Path/URL |
|---|--------|----------|
| <a id="ref-1"></a>[1] | Official Documentation | [https://docs.example.com](https://docs.example.com) |
| <a id="ref-2"></a>[2] | Compiler Source | [`src/compiler/mod.rs#L15-L42`](https://github.com/org/repo/blob/branch/src/compiler/mod.rs#L15-L42) |
| <a id="ref-3"></a>[3] | Transaction Handler | [`src/tx.rs#L42-L58`](https://github.com/org/repo/blob/branch/src/tx.rs#L42-L58) |
```

**Key principle:** The `[[N]](url)` syntax links directly to the external URL, not to `#ref-N` anchors. This ensures one-click navigation to the source.

### 3.2 Reference Path Formats

**Code references must use GitHub URLs** to ensure links work regardless of where the documentation is viewed (GitHub, local clone, documentation sites).

| Reference Type | Format | Example |
|---------------|--------|---------|
| External URL | `[url](url)` | `[https://docs.example.com](https://docs.example.com)` |
| GitHub with single line | `` [`path#LN`](github-url#LN) `` | `` [`src/lib.rs#L170`](https://github.com/org/repo/blob/branch/src/lib.rs#L170) `` |
| GitHub with line range | `` [`path#LX-LY`](github-url#LX-LY) `` | `` [`src/lib.rs#L42-L58`](https://github.com/org/repo/blob/branch/src/lib.rs#L42-L58) `` |
| Cross-repo GitHub | `` [`path#LN`](github-url#LN) `` | `` [`other/src/lib.rs#L10`](https://github.com/org/other-repo/blob/main/src/lib.rs#L10) `` |

**GitHub URL format:**
```
https://github.com/{org}/{repo}/blob/{branch}/{path}#L{line}
https://github.com/{org}/{repo}/blob/{branch}/{path}#L{start}-L{end}
```

**Key rules:**
- **All source code references MUST include exact line numbers** using `#L` notation
- The path in backticks is for display (always include `#LN` or `#LX-LY` suffix)
- The URL in parentheses is the full GitHub link with line numbers
- Use `#L170` for single line references
- Use `#L42-L58` for line range references (note: both numbers prefixed with `L`)

### 3.3 Cardinal Reference Rule

**CRITICAL**: References must point to actual source code, not documentation about code.

**Cardinal references** point directly to the source file and line where the referenced content originates:

| ❌ Avoid | ✅ Prefer |
|----------|-----------|
| `README.md#section-name` | `src/module.rs#L42` |
| `docs/guide.md#example` | `src/example.rs#L15-L30` |
| `util/toolkit/README.md#custom-contracts` | `util/toolkit/src/builder/contract_custom.rs#L35` |

**Rationale:** README sections describe code but may become stale. Linking to actual source ensures readers see the authoritative implementation.

**When to use README links:**
- Linking to conceptual documentation (architecture overviews, glossaries)
- Cross-referencing other documentation files
- External documentation sites

**When to use source code links:**
- Referencing specific implementations
- Citing code examples
- Documenting behavior derived from code

### 3.4 Evidential Validity Rule

**CRITICAL**: Each reference must provide **evidential basis** for the claim it supports.

The referenced code must **directly demonstrate** what the documentation claims. A reference is invalid if:

1. **The code doesn't support the claim** - The referenced lines show unrelated functionality
2. **The code is tangential** - The code exists in the same file but doesn't prove the specific point
3. **The reference is too broad** - Pointing to an entire file when only specific lines are relevant
4. **The reference is structural only** - Pointing to a struct definition when the claim is about behavior

**Examples of Invalid References:**

| Claim | Invalid Reference | Problem |
|-------|-------------------|---------|
| "Proving generates SNARK proofs" | `SendIntentArgs` struct definition | Struct defines CLI args, not proving logic |
| "Deployment and call flows are distinct" | `CustomContractBuilder` struct | Shows one builder, not flow distinction |
| "PLONK-based proof system" | Module re-exports (`pub use`, `mod`) | Module structure, not PLONK implementation |
| "Verifier keys for on-chain verification" | `contract-info.json` | Circuit metadata, not verifier keys |

**Examples of Valid References:**

| Claim | Valid Reference | Why It Works |
|-------|-----------------|--------------|
| "Proving generates SNARK proofs" | `tx_info.prove().await` call site | Shows actual proving invocation |
| "Deployment and call flows are distinct" | `Builder` enum with Deploy/Call variants | Explicitly shows both flow types |
| "PLONK-based proof system" | `proofs/src/plonk/prover.rs` | Actual PLONK prover implementation |
| "Supports RAYON_NUM_THREADS" | README documenting the env var | Explicit documentation of the feature |

**Validation Question:** For each reference, ask: *"If a reader clicks this link, will they see code that directly demonstrates my claim?"*

### 3.5 Reference Building Script

Save this script for generating reference tables:

```bash
#!/bin/bash
# generate-references.sh
# Extracts referenced files and generates a reference table skeleton

DOC_FILE="$1"
OUTPUT_FILE="${2:-references.md}"

if [ -z "$DOC_FILE" ]; then
    echo "Usage: $0 <document.md> [output.md]"
    exit 1
fi

echo "## References" > "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "| # | Source | Path/URL |" >> "$OUTPUT_FILE"
echo "|---|--------|----------|" >> "$OUTPUT_FILE"

# Extract file paths mentioned in the document
grep -oE '\`[a-zA-Z0-9_/.-]+\.(rs|ts|js|md|toml|json)\`' "$DOC_FILE" | \
    sort -u | \
    nl -n ln | \
    while read num path; do
        clean_path=$(echo "$path" | tr -d '`')
        echo "| <a id=\"ref-$num\"></a>[$num] | Source File | \`$clean_path\` |" >> "$OUTPUT_FILE"
    done

echo ""
echo "Reference skeleton generated in: $OUTPUT_FILE"
echo "Review and add descriptions for each reference."
```

**Usage:**
```bash
chmod +x generate-references.sh
./generate-references.sh docs/my-document.md
```

---

## Phase 4: Supporting Documents

### 4.1 Architecture Index (ARCHITECTURE.md)

Create a central index document in the project root:

```markdown
# Architecture Overview

Brief description of the project architecture.

## Visual Overview

```
+------------------+
|      Node        |
+------------------+
         |
+--------+--------+
|     Runtime     |
+-----------------+
```

## Components

### Category 1
| Package | Description | README |
|---------|-------------|--------|
| `pkg-a` | Does X | [README](pkg-a/README.md) |

### Category 2
...

## Complete Package Index

| Package | Path | Description |
|---------|------|-------------|
| `pkg-a` | `path/to/pkg-a` | Brief description |
```

### 4.2 Glossary (GLOSSARY.md)

Extract domain-specific terms and define them:

```markdown
# Glossary

Definitions for key terms used in this project.

## Terms

### Term Name
{Definition based on official documentation}

**Source**: [Official Docs](https://...)

### Another Term
{Definition}
```

**Term extraction script:**

```bash
#!/bin/bash
# extract-terms.sh
# Extracts potential glossary terms from README files

find . -name "README.md" -exec cat {} \; | \
    grep -oE '\*\*[A-Z][a-zA-Z]+\*\*|\[([A-Z][a-zA-Z]+)\]' | \
    sed 's/\*\*//g; s/\[//g; s/\]//g' | \
    sort -u > potential-terms.txt

echo "Potential terms extracted to: potential-terms.txt"
echo "Review and research definitions for each term."
```

---

## Phase 5: Verification

### 5.1 Pre-Commit Checklist

Before finalizing documentation:

- [ ] All code references verified against actual source files
- [ ] All source code references include exact line numbers (`#L` notation)
- [ ] References point to source files, not README sections (cardinal references)
- [ ] **Each reference provides evidential basis for its claim** (see 3.4)
- [ ] Inline references link directly to external URLs (not `#ref-N` anchors)
- [ ] All external links tested
- [ ] ASCII art renders correctly (check in plain text editor)
- [ ] Tables are properly formatted
- [ ] Inferred content is flagged with ⚠️ warning notes
- [ ] References table is complete with anchor IDs
- [ ] Cross-links to other README files are correct

### 5.2 Evidential Validity Review

**MANDATORY**: Before finalizing any document with references, perform this review:

**Step 1: Extract all references**
```bash
grep -oE '\[\[[0-9]+\]\]' document.md | sort -u
```

**Step 2: For each reference, verify evidential basis**

For each `[[N]]` reference:
1. Read the claim/sentence containing the reference
2. Open the referenced URL
3. Verify the code at that location **directly supports** the claim
4. If not, find correct source or flag as unverifiable

**Step 3: Document review findings**

```markdown
## Reference Validity Review

| Ref | Claim | Code at Reference | Valid? | Action |
|-----|-------|-------------------|--------|--------|
| [1] | "Intent contains actions" | `IntentInfo` struct with `actions` field | ✅ | None |
| [2] | "Compiler transforms code" | `CustomContractBuilder` struct | ❌ | Find compiler source |
| [3] | "Uses PLONK proofs" | Module re-exports | ❌ | Point to prover.rs |
```

**Step 4: Fix invalid references**

For each ❌ reference:
- Search codebase for actual implementation
- Update reference to point to correct source with line numbers
- Re-verify the new reference

**Common Invalid Reference Patterns:**

| Pattern | Example | Fix |
|---------|---------|-----|
| Struct definition for behavior claim | `SendIntentArgs` for "proving" | Find `.prove()` call site |
| Module exports for implementation | `lib.rs` re-exports | Find actual implementation file |
| Config/metadata for code feature | `Cargo.toml` for parallelism | Find usage in source or README |
| Generic builder for specific flow | One builder for "distinct flows" | Find enum showing all variants |

### 5.3 Verification Script

```bash
#!/bin/bash
# verify-docs.sh
# Verifies documentation references

DOC_DIR="${1:-.}"
ERRORS=0

echo "Verifying documentation in: $DOC_DIR"
echo "=================================="

# Check for broken internal links
echo ""
echo "Checking internal links..."
find "$DOC_DIR" -name "*.md" -exec grep -l '\[.*\](\.\./' {} \; | while read file; do
    grep -oE '\[.*\]\(\.\./[^)]+\)' "$file" | while read link; do
        target=$(echo "$link" | sed 's/.*(\(.*\))/\1/')
        dir=$(dirname "$file")
        full_path="$dir/$target"
        if [ ! -f "$full_path" ] && [ ! -d "${full_path%/*}" ]; then
            echo "  BROKEN: $file -> $target"
            ((ERRORS++))
        fi
    done
done

# Check for Unicode box-drawing characters
echo ""
echo "Checking for Unicode box-drawing characters..."
find "$DOC_DIR" -name "*.md" -exec grep -l '[┌┐└┘│─├┤┬┴┼]' {} \; | while read file; do
    echo "  WARNING: Unicode box chars in: $file"
    ((ERRORS++))
done

# Check for missing reference anchors
echo ""
echo "Checking reference anchors..."
find "$DOC_DIR" -name "*.md" -exec grep -l '\[\[.*\]\](#ref-' {} \; | while read file; do
    refs=$(grep -oE '\[\[[0-9]+\]\]' "$file" | tr -d '[]' | sort -u)
    for ref in $refs; do
        if ! grep -q "id=\"ref-$ref\"" "$file"; then
            echo "  MISSING ANCHOR: $file ref-$ref"
            ((ERRORS++))
        fi
    done
done

echo ""
echo "=================================="
echo "Verification complete. Errors: $ERRORS"
exit $ERRORS
```

---

## Phase 6: User Review Checkpoints

### 6.1 Checkpoint Schedule

🛑 **Stop and request user review** at these points:

1. **After planning** - Confirm scope and approach
2. **After first document** - Validate template application
3. **After each group** - Batch review for efficiency
4. **Before final commit** - Review complete documentation set

### 6.2 Review Request Format

```markdown
## Documentation Review Request

**Completed:**
- `package-a/README.md` - Created
- `package-b/README.md` - Updated

**Items for Review:**
1. ASCII diagram in package-a - verify alignment
2. API table completeness for package-b

**Flagged Inferences:**
- Section X contains estimated values (marked with ⚠️)

**Next Steps (pending approval):**
- Document package-c
- Document package-d

Shall I proceed?
```

---

## Quick Reference

### Document Types and Purposes

| Document | Location | Purpose |
|----------|----------|---------|
| README.md | Each package | Package documentation |
| ARCHITECTURE.md | Project root | Central index and overview |
| GLOSSARY.md | Project root | Term definitions |
| Technical guides | `docs/` folder | Deep-dive documentation |

### Markdown Formatting Quick Reference

| Element | Syntax |
|---------|--------|
| Internal link | `[text](relative/path.md)` |
| Glossary link | `[Term](../GLOSSARY.md#term-name)` |
| Reference citation (direct link) | `[[1]](https://github.com/org/repo/blob/branch/path/file.rs#L42)` |
| Reference anchor (in table) | `<a id="ref-1"></a>[1]` |
| Reference with line (required) | `` [`path/file.rs#L170`](https://github.com/org/repo/blob/branch/path/file.rs#L170) `` |
| Reference with range | `` [`path/file.rs#L42-L58`](https://github.com/org/repo/blob/branch/path/file.rs#L42-L58) `` |
| External URL | `[https://url](https://url)` |
| Inference flag | `> ⚠️ explanation` |
| Code reference | `` `path/to/file.rs` `` |

### Common Mistakes to Avoid

| Mistake | Correction |
|---------|------------|
| Unicode box characters | Use ASCII: `+`, `-`, `|` |
| Inference notes above section | Place BELOW the section |
| Missing reference anchors | Add `<a id="ref-N"></a>` to table |
| Relative paths for code references | Use full GitHub URLs: `https://github.com/org/repo/blob/branch/path` |
| Source references without line numbers | **Always** include `#L` line numbers for source code |
| Line numbers without `L` prefix | Use `#L170` or `#L42-L58` format |
| References to README sections | Use cardinal references to actual source files |
| `[[N]](#ref-N)` anchor links | Use direct URL links: `[[N]](https://github.com/.../file.rs#L42)` |
| **References that don't support the claim** | Verify code at reference directly demonstrates the claim (Section 3.4) |
| Struct definitions for behavior claims | Point to actual behavior/call sites |
| Module re-exports for implementations | Point to actual implementation files |
| Undocumented assumptions | Flag with ⚠️ warning notes |
| Broken relative links | Test all internal links |

---

## Scripts Directory

Store reusable scripts in `.engineering/agent/scripts/docs/`:

```
.engineering/agent/scripts/docs/
├── generate-references.sh    # Build reference table skeleton
├── extract-terms.sh          # Extract glossary terms
├── verify-docs.sh            # Verify documentation quality
└── README.md                 # Script documentation
```

---

## See Also

- [README Template](../planning/2025-12-01-cargo-package-readme-documentation/README-TEMPLATE.md)
- [Work Package Implementation Workflow](work-package/_workflow.md)
- [AGENTS.md](../AGENTS.md) - Core agent guidelines

---

## Changelog

| Date | Change |
|------|--------|
| 2025-12-02 | Added evidential validity rule and review process (Section 3.4, 5.2) |
| 2025-12-02 | Added cardinal reference rule (source files over README sections) |
| 2025-12-02 | Required exact line numbers for all source code references |
| 2025-12-02 | Changed inline references to link directly to URLs (not `#ref-N` anchors) |
| 2025-12-01 | Initial version |

