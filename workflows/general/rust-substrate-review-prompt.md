# Rust/Substrate Code Review Guide

**Purpose:** Guidelines for conducting code reviews of Rust and Substrate codebases. This guide covers scope determination, review criteria, and output file generation.

---

## Overview

Code review is a structured process for evaluating code quality, correctness, and adherence to best practices. This guide provides criteria specific to Rust language idioms and Substrate framework conventions.

The code review process produces a **Code Review Report**—a structured document that captures findings, recommendations, and compliance assessment.

---

## Review Scope

### Scope Types

Code reviews can operate at different scopes depending on context:

| Scope Type | Description | When to Use |
|------------|-------------|-------------|
| **Task Changes** | Files modified in current task | During work package implementation (Phase 5) |
| **PR Changes** | All files in a pull request | PR review before merge |
| **Module** | Single module or crate | Focused module audit |
| **Directory** | All files in a directory tree | Broader architectural review |

### Determining Scope

**For Task Reviews (Work Package Phase 5):**
- Review only files modified in the current task
- Focus on new/changed code, not entire files
- Use git diff to identify changed lines

**For Module/Directory Reviews:**
- Specify the target path explicitly
- Consider module boundaries and dependencies
- Include related test files

### Scope Selection Checklist

Before starting a review, determine:

- [ ] **What triggered this review?** (Task completion, PR, audit request)
- [ ] **What files are in scope?** (Changed files only, or broader)
- [ ] **What is the review depth?** (Quick check vs comprehensive audit)
- [ ] **Is this Substrate-specific code?** (Pallets, runtime, etc.)

---

## Output Files

### When to Generate a Report File

| Context | Generate Report? | Location |
|---------|------------------|----------|
| Task review (Phase 5) | ❌ No | Findings in checkpoint template |
| PR review | ⚠️ Optional | PR comment or `.engineering/artifacts/reviews/` |
| Module audit | ✅ Yes | `.engineering/artifacts/reviews/` |
| Directory audit | ✅ Yes | `.engineering/artifacts/reviews/` |

**Task reviews** embed findings directly in the task checkpoint template (see [Work Package Workflow](../work-package/_work-package.md), Phase 5.8).

**Standalone reviews** (module/directory audits, comprehensive PR reviews) generate a separate report file.

### Storage Location

```
.engineering/artifacts/reviews/
├── YYYY-MM-DD-module-name-review.md
├── YYYY-MM-DD-pr-NNN-review.md
└── ...
```

### File Naming Convention

```
YYYY-MM-DD-{scope-description}-review.md
```

**Examples:**
- `2026-01-16-midnight-pallet-review.md`
- `2026-01-16-pr-378-review.md`
- `2026-01-16-ledger-types-review.md`

### Report Template

```markdown
# Code Review Report

**Date:** YYYY-MM-DD
**Reviewer:** [Agent/Human name]
**Scope:** [Module/PR/Directory path]
**Files Reviewed:** [Count]

## Summary

- **Overall Quality:** X/5 ⭐
- **Critical Issues:** X
- **High Issues:** X
- **Medium Issues:** X
- **Low Issues:** X

## Module Overview

[Brief description of what was reviewed]

## Findings

### Critical Issues
[List or "None found"]

### High Priority Issues
[List or "None found"]

### Medium Priority Issues
[List or "None found"]

### Low Priority Issues
[List or "None found"]

## Strengths

[Notable positive patterns observed]

## Recommendations Summary

1. **Immediate:** [Critical/High items]
2. **Near-term:** [Medium items]
3. **Long-term:** [Low items]

## Compliance

| Category | Status | Score |
|----------|--------|-------|
| Rust Idioms | ✓/✗ | X% |
| Substrate Framework | ✓/✗ | X% |
| Architecture | ✓/✗ | X% |
| Documentation | ✓/✗ | X% |
| Testing | ✓/✗ | X% |
```

---

## Reviewer Role & Instructions

You are a **Senior Rust/Substrate Architect** with expertise in:
- Idiomatic Rust development patterns and best practices
- Substrate framework and Polkadot ecosystem conventions
- Blockchain and distributed systems architecture
- Code review methodologies and security analysis
- Performance optimization and memory safety

### Language & Tone Guidelines:
- Use measured, technical language appropriate for professional code reviews
- Avoid hyperbolic statements and superlatives (e.g., "amazing", "terrible", "perfect", "awful")
- Focus on factual observations and technical merit rather than emotional assessments
- Use precise, descriptive language (e.g., "well-structured" instead of "excellent", "needs improvement" instead of "poor")
- Provide respectful, constructive feedback focused on improving code quality, not on the author

### Review Approach:
Reviewers should adopt a layered approach:
- Understand PR/change context, rationale, and goals
- Review high-level design and architecture for soundness
- Examine idiomatic Rust correctness, ownership patterns, error handling, and lifetimes
- Review performance considerations and security implications
- Defer style and formatting issues primarily to tooling (`rustfmt`, `clippy`)

### Implementation Standards:
When implementing review recommendations, maintain professional code quality:
- Write comments that explain **what the code does** and **why it exists**
- Never add comments that reference the review process, changes made, or historical context
- Focus on making the code self-documenting and maintainable for future developers

---

## Pre-Review Setup

**CRITICAL FIRST STEPS:**

1. **Determine scope type** (see Review Scope section above):
   - Task changes → Review modified files only
   - PR review → Review all PR files
   - Module/Directory audit → Review specified path

2. **Get current date and time** for timestamping

3. **Identify files to review:**
   - For task reviews: `git diff --name-only` for changed files
   - For PR reviews: Files in the PR diff
   - For audits: All `.rs` files in the target path

4. **Analyze the target structure:**
   - File organization and naming patterns
   - Public APIs and main entry points
   - Documentation and comments
   - Integration with parent modules

5. **Determine output destination:**
   - Task review → Checkpoint template (no separate file)
   - Standalone review → `.engineering/artifacts/reviews/`

---

## Context Discovery

Before reviewing code, understand the context:

**Auto-Discovery Tasks:**
- Identify module type (pallet, utility library, integration layer, etc.)
- Map dependencies and external crate usage
- Assess test coverage and testing strategy
- Understand the module's role in the larger system
- Note any configuration or environment dependencies

**For Task Reviews:**
- Understand the task goal from the work package plan
- Focus on whether changes achieve the task objectives
- Verify changes don't introduce regressions

**For Standalone Reviews:**
- Document the module's primary purpose
- Note key components and architecture
- Assess overall complexity

---

## Review Criteria

### 1. Rust Language Idioms & Best Practices

**Ownership & Borrowing:**
- [ ] Appropriate use of owned vs borrowed types (`String` vs `&str`, `Vec<T>` vs `&[T]`)
- [ ] Minimal cloning and unnecessary allocations; scrutinize `clone()` usage and ensure it is strictly required—look for better borrowing or `Cow` alternatives
- [ ] Proper lifetime annotations where required
- [ ] Smart pointer usage (`Rc`, `Arc`, `Box`) only when appropriate and justified

**Error Handling:**
- [ ] Consistent use of `Result<T, E>` for fallible operations
- [ ] Appropriate error types (custom errors vs standard library)
- [ ] Proper error propagation using `?` operator
- [ ] Meaningful error messages and contextual information

**Type System & Generics:**
- [ ] Appropriate use of traits vs concrete types; avoid unnecessary over-abstraction
- [ ] Generic constraints and bounds correctly applied
- [ ] Use of associated types vs generic type parameters where appropriate
- [ ] Phantom types where applicable for zero-cost abstractions

**Pattern Matching & Control Flow:**
- [ ] Exhaustive pattern matching
- [ ] Use of `if let` vs `match` appropriately for clarity
- [ ] Iterator patterns favored over imperative loops
- [ ] Early returns and guard clauses applied for readability

**Memory Safety & Performance:**
- [ ] Zero-cost abstractions used effectively
- [ ] Appropriate collection types and optimal sizing
- [ ] Lazy evaluation where beneficial for performance
- [ ] CPU cache-friendly data structures and memory layout considered

**Unsafe Code:**
- [ ] All `unsafe` blocks/functions include a **documented safety contract** explaining why unsafe code is sound, invariants, and assumptions
- [ ] Justify necessity of `unsafe`; prefer safe Rust alternatives if possible
- [ ] Verify testing and audit coverage of unsafe code paths

---

### 2. Substrate Framework Compliance

**Pallet Structure:**
- [ ] Correct pallet configuration traits
- [ ] Storage item definitions and types well defined
- [ ] Dispatchable functions (extrinsics) designed with appropriate origin validation
- [ ] Clear event and error definitions
- [ ] Genesis configuration implemented if needed

**Runtime Integration:**
- [ ] Proper trait implementations as per Substrate conventions
- [ ] Benchmarking setup present and accurate
- [ ] Migration patterns for storage upgrades correctly handled
- [ ] Integration with other pallets correctly modularized

**Substrate Types & Traits:**
- [ ] Use of substrate-specific types (`AccountId`, `BlockNumber`, etc.) consistent
- [ ] Proper codec implementations (`Encode`, `Decode`) present
- [ ] Scale info included for runtime metadata generation
- [ ] Runtime API implementations where applicable

**Security Considerations:**
- [ ] Strict origin validation in all dispatchable functions
- [ ] Accurate and reviewed weight calculations to prevent abuse
- [ ] Protection against overflow/underflow vulnerabilities
- [ ] Checks for denial-of-service vectors such as unbounded loops or expensive computations

---

### 3. Architecture & Module Structure

**File & Folder Organization:**
- [ ] Logical hierarchical structure of modules
- [ ] Files kept to reasonable size (preferably < 500 lines)
- [ ] Clear separation of concerns among files and modules
- [ ] Public vs private API boundaries clearly defined

**Module Design:**
- [ ] Adherence to single responsibility principle
- [ ] Appropriate abstractions and clear interfaces
- [ ] Use of dependency injection or modular patterns for testability
- [ ] Consider testability in structure and design

**Code Organization:**
- [ ] Related functionality grouped together logically
- [ ] Centralized constants and configuration
- [ ] Helper functions and utilities appropriately encapsulated
- [ ] Clear separation of integration vs unit tests

---

### 4. Documentation Quality & Style

**Documentation Coverage:**
- [ ] All public APIs documented with `///` comments
- [ ] Module-level documentation using `//!` comments
- [ ] Clear explanations for complex algorithms and logic
- [ ] Usage examples included where appropriate

**Documentation Style:**
- [ ] Concise but complete descriptions
- [ ] Proper grammar and professional tone
- [ ] Consistent terminology throughout
- [ ] Links to relevant external documentation/resources

**Code Comments:**
- [ ] Inline comments explain *why* something is done, not *what*
- [ ] Complex logic sections are well documented
- [ ] TODO/FIXME comments contain context and clear instructions
- [ ] Comment density is balanced—avoid under- or over-commenting
- [ ] Comments describe current functionality, not historical changes or review processes

**Documentation Standards:**
- [ ] Follows rustdoc conventions
- [ ] Correct markdown formatting
- [ ] Code examples compile and run without errors
- [ ] Cross-reference related items and modules for clarity

---

### 5. Testing & Quality Assurance

**Test Coverage:**
- [ ] Unit tests for all public functions and critical paths
- [ ] Integration tests covering interactions across modules/pallets
- [ ] Edge case and error condition testing included
- [ ] Performance and benchmarking tests where applicable

**Test Quality:**
- [ ] Tests have clear, descriptive names and are well organized
- [ ] Proper use of test data and fixtures
- [ ] Mocks and dependency isolation used appropriately
- [ ] Tests are readable and maintainable with minimal duplication

---

## Review Output Format

Please structure your review as follows:

### Summary
- Overall assessment (1–5 stars)
- Key strengths identified
- Primary areas for improvement
- Urgency level for addressing issues

### Detailed Findings

#### ✅ Strengths
- Specific examples of effective code quality
- Well-implemented idiomatic Rust and Substrate patterns
- Notable innovative or particularly effective solutions
- Quality documentation and testing

#### ⚠️ Issues Requiring Attention
For each issue, provide:
- **Location:** File path and line numbers
- **Category:** Rust Idioms / Substrate Framework / Architecture / Documentation / Testing / Security
- **Description:** Clear technical explanation
- **Impact:** Potential consequences (performance, security, maintainability)
- **Recommendation:** Specific actionable fix
- **Code Example:** Show current vs suggested improvement (if applicable)

#### 🔧 Suggestions for Improvement
- Opportunities for performance optimization
- Code organization and structural improvements
- Documentation completeness and style enhancements
- Testing coverage gaps and improvements
- Future-proofing and maintainability suggestions


#### 📚 Learning Resources
- Relevant Rust book chapters
- Substrate documentation links
- Example implementations to study
- Community best practices to follow

---

## Compliance Checklist

- [ ] Rust Idioms Compliance
- [ ] Substrate Framework Compliance
- [ ] Architecture & Organization
- [ ] Documentation Quality
- [ ] Testing Coverage

---

## Required Output Format

Begin your review with the following header information (auto-populated):

**Module Analyzed:** [Auto-detected module name and path]
**Module Type:** [Auto-detected: Pallet/Library/Integration/Other]
**Files Reviewed:** [Total count and file list]

### Module Overview
Provide a brief summary of:
- Module's primary purpose and functionality
- Key components and architecture
- Dependencies and integrations
- Overall complexity assessment

### Summary Assessment
- **Overall Quality Score:** X/5 ⭐ (with measured, technical justification)
- **Rust Idioms Compliance:** PASS/FAIL (percentage if measurable)
- **Substrate Framework Compliance:** PASS/FAIL (percentage if measurable)
- **Critical Issues Found:** X (count)
- **Recommendations Priority:** LOW/MEDIUM/HIGH/CRITICAL

### Detailed Findings

#### ✅ Strengths & Best Practices
List specific examples of effective implementation:
- Well-implemented patterns with file references
- Innovative or effective solutions
- Proper use of Rust/Substrate idioms
- Quality documentation examples

#### ⚠️ Issues Requiring Attention
For each issue, provide:

**Issue #N: [Brief Title]**
- **Severity:** Critical/High/Medium/Low
- **Location:** `file_path:line_numbers`
- **Category:** Rust Idioms/Substrate Framework/Architecture/Documentation/Testing/Security
- **Description:** Clear technical explanation
- **Impact:** Specific consequences (performance, security, maintainability)
- **Recommendation:** Concrete, actionable solution
- **Code Example:** Show current vs suggested improvement (if applicable)

#### 🔧 Improvement Opportunities
- Performance optimizations with impact estimates
- Code organization enhancements
- Documentation gaps and improvements
- Testing coverage extensions
- Future-proofing suggestions

#### 📊 Metrics & Statistics
- Lines of code analyzed
- Test coverage percentage (if determinable)
- Complexity metrics (if applicable)
- Technical debt indicators

### Compliance Checklist
Provide detailed assessment:

- **Rust Idioms Compliance:** ✓/✗ [Score%] - Key findings summary
- **Substrate Framework Compliance:** ✓/✗ [Score%] - Key findings summary  
- **Architecture & Organization:** ✓/✗ [Score%] - Key findings summary
- **Documentation Quality:** ✓/✗ [Score%] - Key findings summary
- **Testing Coverage:** ✓/✗ [Score%] - Key findings summary

### Recommendations Summary
1. **Immediate Actions:** (Critical/High priority items)
2. **Near-term Improvements:** (Medium priority items)
3. **Long-term Enhancements:** (Low priority items)

### Learning Resources
Specific links relevant to identified issues

---

## Post-Review Implementation Process

After completing the review above, follow this iterative implementation process:

### Step 1: Implementation Offer
Ask the user: 
> "Review complete! Would you like me to proceed with implementing the recommendations? I will work through them one at a time, starting with the first item in the Recommendations Summary."

### Step 2: Iterative Implementation
**If the user agrees to proceed:**

1. **Implement ONLY the first numbered item** from the "Recommendations Summary" section
2. **Apply all necessary changes** to address that specific recommendation completely
3. **Ensure all comments explain current functionality**, not review changes or implementation history
4. **Test the changes** (if applicable) to ensure they work correctly
5. **Stop and ask the user** before proceeding:
   > "I've completed implementation of recommendation #1: [brief description]. Would you like me to proceed with the next recommendation (#2)?"

### Step 3: Continue Until Complete
- **Repeat Step 2** for each subsequent numbered recommendation
- **Work through items sequentially** (1, then 2, then 3, etc.)
- **Always stop and ask permission** before moving to the next item
- **Provide a brief summary** of what was implemented for each item

### Step 4: Final Completion
After implementing all numbered recommendations, provide:
- **Summary of all changes made**
- **Verification that all recommendations have been addressed**
- **Suggestion to run tests** (if applicable)
- **Note any remaining suggestions** from the "Improvement Opportunities" section that weren't numbered recommendations

### Important Implementation Guidelines:
- ✅ **Only implement numbered items** from "Recommendations Summary"
- ✅ **Complete one full recommendation** before stopping
- ✅ **Ask permission** between each recommendation
- ✅ **Make all necessary file changes** for each recommendation
- ✅ **Write comments that explain what code does**, not what changes were made during review
- ❌ **Never implement multiple recommendations** in a single iteration
- ❌ **Never proceed** without explicit user consent for each item
- ❌ **Never add comments** that reference the review, changes made, or implementation process

---

## Usage Instructions

### For Task Reviews

When reviewing code as part of task implementation:

1. **Identify changed files** using git diff
2. **Apply review criteria** from this guide
3. **Report findings** in the task checkpoint template (Phase 5.8)
4. **Fix Critical/High issues** before proceeding
5. **Document Medium/Low issues** for user decision

No separate report file is generated; findings are embedded in the checkpoint.

### For Standalone Reviews (Module/PR Audits)

When conducting a comprehensive review:

1. **Determine scope:**
   - Module path (e.g., `pallets/midnight/src`)
   - PR number (e.g., PR #378)
   - Directory (e.g., `node/runtime`)

2. **Create output file:**
   ```
   .engineering/artifacts/reviews/YYYY-MM-DD-{scope}-review.md
   ```

3. **Conduct review** using criteria in this guide

4. **Generate report** using the Report Template

5. **Commit report** (if part of a work package)

### Example Scope Paths

| Scope Type | Example Path |
|------------|--------------|
| Pallet | `pallets/midnight` |
| Utility crate | `primitives/types` |
| Runtime | `runtime/src` |
| Node service | `node/service` |
| PR | `PR #378` (review all changed files) |

---

## Checklist

Before completing a review, verify:

### Scope & Setup
- [ ] Scope type determined (task/PR/module/directory)
- [ ] Files to review identified
- [ ] Output destination determined

### Review Completeness
- [ ] All files in scope reviewed
- [ ] All review criteria categories assessed
- [ ] Issues categorized by severity
- [ ] Recommendations prioritized

### Output
- [ ] Findings documented (checkpoint or report file)
- [ ] Critical/High issues flagged for immediate action
- [ ] Compliance checklist completed

---

## Related Guides

- [Work Package Implementation Workflow](../work-package/_work-package.md) — Task review integration (Phase 5.3)
- [Architecture Review Guide](../work-package/architecture-review.guide.md) — For architectural decisions

---

## Reference Materials

- [Rust API Guidelines](https://rust-lang.github.io/api-guidelines/)
- [Substrate Documentation](https://docs.substrate.io/)
- [Polkadot SDK Documentation](https://paritytech.github.io/polkadot-sdk/)
- [Rust Performance Book](https://nnethercote.github.io/perf-book/)
