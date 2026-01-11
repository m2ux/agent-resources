# High-Level Planning Workflow

**Version:** 1.0  
**Last Updated:** November 24, 2025  
**Purpose:** Create comprehensive planning sessions that organize multiple features into an actionable roadmap

---

## Overview

This workflow defines how to create high-level planning sessions that organize multiple related features. Each planning session produces a structured folder with analysis, feature plans, and prioritization.

**Use this workflow when you have:**
- Multiple related features to implement
- A roadmap spanning several weeks/months
- Features that share context or build on each other
- Need for prioritization across multiple initiatives

**Not needed for:**
- Quick bug fix (<30 min)
- Minor refactoring with clear scope

> **Note:** Even single features should use the folder pattern for consistency. The [WP Implementation Workflow](_workflow.md) uses the same folder structure - this ensures all planning artifacts follow a unified pattern.

**Related:** After planning, use the [WP Implementation Workflow](_workflow.md) to implement individual features.

---

## Planning Folder Structure

### Location Pattern
```
.ai/planning/YYYY-MM-DD-descriptive-name/
```

**Examples:**
- `.ai/planning/2025-11-23-integrated-roadmap/`
- `.ai/planning/2025-12-01-performance-initiative/`
- `.ai/planning/2025-12-15-api-redesign/`

**Naming Conventions:**
- Use date prefix (YYYY-MM-DD) for chronological ordering
- Descriptive name (roadmap, initiative, sprint, project name)
- Kebab-case (lowercase with hyphens)

### Standard Structure

```
.ai/planning/YYYY-MM-DD-name/
├── START-HERE.md              # Entry point (required)
├── README.md                  # Navigation (required)
├── 01-[ANALYSIS].md          # Context/background
├── 02-[ANALYSIS].md          # More analysis
├── 03-[feature]-plan.md      # First feature
├── 04-[feature]-plan.md      # Second feature
├── 05-[feature]-plan.md      # Third feature
├── ...
├── [FEATURE]-COMPLETE.md     # Created after implementation
└── [FEATURE]-TESTING.md      # Created if needed
```

---

## Core Planning Documents

### 1. START-HERE.md (Required)

**Purpose:** Entry point providing executive summary and navigation

**Template:**

```markdown
# [Planning Session Name] - [Month Year]

**Created:** [Date]
**Status:** [Ready for Review/In Progress/Complete]
**Previous Planning:** [Link to previous session if continuing work]

> **Note on Time Estimates:** All effort estimates refer to **agentic (AI-assisted) development time** plus separate **human review time**.

---

## 🎯 Executive Summary

[2-3 paragraphs explaining:]
- What this planning session covers
- Why these features are grouped together
- Expected overall impact

This planning session integrates:
1. **[Context/Background]** - Link to analysis
2. **[Remaining work]** from previous sessions
3. **[New features]** based on [analysis/requirements]

---

## 📊 Progress Since [Last Session]

### ✅ Completed

| Item | Status | PR/ADR | Notes |
|------|--------|--------|-------|
| Feature A | ✅ **Complete** | PR #XX | Brief description |
| Feature B | ✅ **Complete** | ADR YYYY | Brief description |

**Achievement:** ~X% of original recommendations completed

---

### ⚠️ Partially Complete

| Item | Status | What's Done | What Remains |
|------|--------|-------------|--------------|
| Feature C | ⚠️ **Partial** | Component X implemented | Need Y and Z |

---

### 🎯 This Roadmap

**Features to implement:**

1. **Phase 3:** [Feature Name] - [Brief description]
   - Priority: HIGH/MEDIUM/LOW
   - Effort: X-Yh agentic + Zh review
   
2. **Phase 4:** [Feature Name] - [Brief description]
   - Priority: HIGH/MEDIUM/LOW
   - Effort: X-Yh agentic + Zh review

3. **Phase 5:** [Feature Name] - [Brief description]
   - Priority: HIGH/MEDIUM/LOW
   - Effort: X-Yh agentic + Zh review

[Continue for all features...]

---

## 📅 Timeline

| Week | Features | Time Estimate |
|------|----------|---------------|
| Week 1 | Phase 3 + Phase 4 | X-Yh agentic + Zh review |
| Week 2 | Phase 5 | X-Yh agentic + Zh review |
| Week 3 | Phase 6 + Phase 7 | X-Yh agentic + Zh review |

**Total:** X-Y hours agentic + Z hours review = **A-B total hours**

---

## 🎯 Success Criteria

### Overall Success
- [ ] All planned features implemented
- [ ] Test coverage maintained/improved
- [ ] Performance targets met
- [ ] Documentation complete

### Phase-Specific
- [ ] Phase 3: [Specific measurable outcome]
- [ ] Phase 4: [Specific measurable outcome]
- [ ] Phase 5: [Specific measurable outcome]

---

## 📚 Document Navigation

| Document | Description |
|----------|-------------|
| **[START-HERE.md](START-HERE.md)** | 👈 You are here - Executive summary |
| [README.md](README.md) | Quick navigation and overview |
| [01-ANALYSIS.md](01-ANALYSIS.md) | Context and background |
| [02-ANALYSIS.md](02-ANALYSIS.md) | Additional analysis |
| [03-feature-plan.md](03-feature-plan.md) | Phase 3: [Feature Name] |
| [04-feature-plan.md](04-feature-plan.md) | Phase 4: [Feature Name] |
| [05-feature-plan.md](05-feature-plan.md) | Phase 5: [Feature Name] |

---

## 🔥 Priority Order

**Implementation sequence:**

1. 🔴 **HIGH:** Phase 3 - [Feature] 
   - Why: Blocks other work / Critical bug / User-facing issue
   
2. 🔴 **HIGH:** Phase 4 - [Feature]
   - Why: Dependency for Phase 5
   
3. 🟠 **MEDIUM:** Phase 5 - [Feature]
   - Why: Important but not blocking
   
4. 🟡 **LOW:** Phase 6 - [Feature]
   - Why: Nice to have / Future optimization

---

## 📋 Dependencies

### External Dependencies
- [ ] Dependency A must be resolved before Phase X
- [ ] Dependency B needed for Phase Y

### Internal Dependencies
- Phase 4 depends on Phase 3
- Phase 6 depends on Phase 4 and 5

---

## 🚀 Getting Started

**To implement features from this plan:**

1. Read this document (START-HERE.md) for context
2. Review individual feature plans (03-*, 04-*, 05-*)
3. Select first feature based on priority
4. Follow [Feature Implementation Workflow](../prompts/feature-_workflow.md)
5. Return here after completion to select next feature

---

**Status:** Ready for implementation
**Last Updated:** [Date]
```

### 2. README.md (Required)

**Purpose:** Quick reference and navigation

**Template:**

```markdown
# [Planning Session Name]

**Created:** [Date]
**Status:** [Ready for Implementation/In Progress/Complete]
**Previous Planning:** [Link if applicable]

> **Note on Time Estimates:** All effort estimates refer to **agentic (AI-assisted) development time** plus separate **human review time**.

---

## 📋 Overview

[1-2 paragraphs summarizing this planning session - what features, why grouped together, expected impact]

---

## 📚 What's Inside

| Document | Description | Status |
|----------|-------------|--------|
| **[START-HERE.md](START-HERE.md)** | 👈 **Read this first** - Executive summary | ✅ |
| [01-COMPLETION-ANALYSIS.md](01-COMPLETION-ANALYSIS.md) | What was completed previously | ✅ |
| [02-CONTEXT-ANALYSIS.md](02-CONTEXT-ANALYSIS.md) | Background and motivation | ✅ |
| [03-feature-plan.md](03-feature-plan.md) | Phase 3: [Feature Name] | 📋 Ready |
| [04-feature-plan.md](04-feature-plan.md) | Phase 4: [Feature Name] | 📋 Ready |
| [05-feature-plan.md](05-feature-plan.md) | Phase 5: [Feature Name] | 📋 Ready |

---

## 📊 Quick Summary

### ✅ What Was Completed ([Previous Session])
- ✅ **Feature A** - Description (PR #XX)
- ✅ **Feature B** - Description (ADR YYYY)

### 🎯 What's Next (This Roadmap)
- **Phase 3:** [Feature] - Description
- **Phase 4:** [Feature] - Description  
- **Phase 5:** [Feature] - Description
- **Phase 6:** [Feature] - Description

### ⏱️ Timeline
- **Week 1:** Phases 3-4 (X-Yh agentic + Zh review)
- **Week 2:** Phase 5 (X-Yh agentic + Zh review)
- **Week 3:** Phases 6-7 (X-Yh agentic + Zh review)

**Total:** X-Y hours agentic + Z hours review = **A-B total hours**

---

## 🎯 Priority Order

| Priority | Phase | Feature | Effort | Why |
|----------|-------|---------|--------|-----|
| 🔴 HIGH | Phase 3 | [Feature] | X-Yh | [Critical reason] |
| 🔴 HIGH | Phase 4 | [Feature] | X-Yh | [Important reason] |
| 🟠 MEDIUM | Phase 5 | [Feature] | X-Yh | [Useful reason] |
| 🟡 LOW | Phase 6 | [Feature] | X-Yh | [Nice to have] |

---

## 🚀 Getting Started

**To implement a feature:**

1. Read [START-HERE.md](START-HERE.md) for full context
2. Select feature based on priority
3. Review detailed plan (e.g., `03-feature-plan.md`)
4. Follow [Feature Implementation Workflow](../prompts/feature-_workflow.md)

---

**Next Step:** 👉 Read [START-HERE.md](START-HERE.md)
```

---

## Analysis Documents (Optional)

### Naming Pattern
```
01-[TYPE]-ANALYSIS.md
02-[TYPE]-ANALYSIS.md
03-[TYPE]-ANALYSIS.md
...
```

### Common Analysis Types

**01-COMPLETION-ANALYSIS.md** - What was done previously
```markdown
# Completion Analysis

**Date:** [Date]
**Purpose:** Assess what was completed since last planning session

## Executive Summary
[What was accomplished, what remains]

## Detailed Completion Status

### ✅ Fully Complete
- Feature A: [Details and PR link]

### ⚠️ Partially Complete
- Feature B: [What's done, what remains]

### ❌ Not Started
- Feature C: [Why deferred]

## Key Learnings
- Learning 1
- Learning 2

## Impact on This Roadmap
[How previous work affects current planning]
```

**02-CONCEPT-LEXICON-ANALYSIS.md** - Codebase insights
```markdown
# Concept Lexicon Analysis

**Date:** [Date]
**Purpose:** Document architectural patterns and concepts discovered in codebase

## Key Concepts

### Concept 1: [Name]
**Definition:** [What it is]
**Usage:** [Where/how used]
**Related:** [Related concepts]

### Concept 2: [Name]
[Same structure]

## Architectural Patterns
1. **Pattern A** - Description
2. **Pattern B** - Description

## Recommendations
Based on codebase analysis:
- Use pattern X for feature Y
- Avoid pattern Z due to A
```

**Other Common Analysis Documents:**
- `REQUIREMENTS-ANALYSIS.md` - Requirements gathering
- `TECHNICAL-DEBT-ANALYSIS.md` - Technical debt assessment
- `DEPENDENCY-ANALYSIS.md` - External/internal dependencies
- `RISK-ANALYSIS.md` - Risk assessment and mitigation

---

## Individual Feature Plans

### Naming Pattern
```
NN-feature-name-plan.md
```

Continue numbering from analysis documents.

**Examples:**
- `03-observability-plan.md` (Phase 3)
- `04-result-types-plan.md` (Phase 4)
- `05-caching-strategy-plan.md` (Phase 5)
- `06-resilience-patterns-plan.md` (Phase 6)

### Feature Plan Template

```markdown
# Phase N: [Feature Name]

**Date:** [Date]
**Priority:** [HIGH/MEDIUM/LOW] ([Reason])
**Status:** [Ready for Implementation/In Progress/Complete]
**Estimated Effort:** X-Yh agentic + Zh review

> **Note:** All time estimates refer to agentic (AI-assisted) development time plus human review time.

---

## Overview

[1-2 paragraphs explaining:]
- What this feature is
- Why it's needed
- Expected impact

---

## Knowledge Base Insights Applied

### Core Concepts ([N concepts from analysis])

1. **Concept A** - How it applies to this feature
2. **Concept B** - Relevant architectural pattern
3. **Concept C** - Design principle to follow

[Reference concepts from CONCEPT-LEXICON-ANALYSIS or other analysis docs]

---

## Current State

### What Exists ✅
- ✅ Component A - Current capability
- ✅ Component B - Current state

### What's Missing ❌
- ❌ Feature X - Why needed
- ❌ Feature Y - Impact of not having it

### Current Metrics (Baseline)
- 🔍 **Metric 1:** Current value
- 🔍 **Metric 2:** Current value

---

## Implementation Tasks

Break feature into concrete tasks (Task N.1, N.2, N.3, etc.)

### Task N.1: [Task Name] (X-Y min agentic)

**Goal:** [Clear, measurable objective]

**Tasks:**
1. Specific subtask A
2. Specific subtask B
3. Specific subtask C

**Deliverables:**
- `src/path/to/file.ts` - Component description
- `src/path/to/__tests__/file.test.ts` - Test coverage
- Documentation update

**Expected Impact:**
- [Quantifiable improvement]

---

### Task N.2: [Task Name] (X-Y min agentic)

**Goal:** [Clear objective]

**Tasks:**
1. Subtask A
2. Subtask B

**Deliverables:**
- File list with descriptions

**Expected Impact:**
- [Metric improvement]

---

[Continue for all tasks...]

---

## Detailed Implementation (Optional)

### Example Code Structure

**File:** `src/path/to/component.ts`

```typescript
/**
 * [Component description]
 */
export class ComponentName {
  constructor(/* dependencies */) {}
  
  method(): Result {
    // Implementation approach
  }
}
```

### Architecture Diagram (If Complex)

```
┌─────────────┐
│  Component A │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Component B │
└─────────────┘
```

---

## Success Criteria

### Functional Requirements
- [ ] Feature X implemented and working
- [ ] Feature Y integrated correctly
- [ ] Edge cases handled

### Performance Targets
- [ ] **Metric 1:** Achieve X (baseline: Y)
- [ ] **Metric 2:** Achieve X (baseline: Y)
- [ ] **Metric 3:** Below X (baseline: Y)

### Quality Requirements
- [ ] Test coverage ≥X% (unit tests)
- [ ] Integration tests passing
- [ ] No performance regressions
- [ ] Documentation complete
- [ ] ADR written (if significant decision)

---

## Testing Strategy

### Unit Tests
- Component X: [Test scenarios]
- Component Y: [Test scenarios]
- Edge cases: [List]

### Integration Tests
- Integration A: [Scenario]
- Integration B: [Scenario]

### E2E/Performance Tests (If Applicable)
- E2E flow: [Scenario]
- Performance: Baseline vs target comparison
- Load test: [Conditions]

---

## Validation Steps

1. **Baseline Measurement**
   - Measure current metrics
   - Document current behavior

2. **Implementation**
   - Follow task sequence (N.1, N.2, N.3...)
   - Test after each task
   - Commit after each task

3. **Performance Comparison**
   - Measure with new implementation
   - Compare to baseline
   - Verify targets met

4. **Integration Validation**
   - Test with other components
   - Verify no regressions
   - E2E testing

5. **Load Testing** (If Applicable)
   - Test under realistic conditions
   - Verify performance holds

---

## Documentation Requirements

### ADR (If Significant Decision)
- **ADR NNNN:** [Decision Title]
  - **Context:** Why this decision needed
  - **Decision:** What we chose and why
  - **Consequences:** Trade-offs and impacts
  - **Alternatives Considered:** What we rejected

### User Documentation (If Needed)
- Configuration guide
- Usage examples
- Troubleshooting section

### Inline Documentation
- JSDoc on all public APIs
- Code comments for complex logic
- Examples in docs

---

## Estimated Timeline

| Task | Duration (Agentic) | Review | Total |
|------|-------------------|--------|-------|
| N.1 [Name] | X-Y min | Z min | A-B min |
| N.2 [Name] | X-Y min | Z min | A-B min |
| N.3 [Name] | X-Y min | Z min | A-B min |
| Testing | X min | Y min | Z min |
| Documentation | X min | Y min | Z min |
| **TOTAL** | **X-Y h** | **Z h** | **A-B h** |

---

## Implementation Selection Matrix

Use this to customize which tasks to implement.

| Sub-Phase | Description | Duration | Include |
|-----------|-------------|----------|---------|
| Task N.1 | [Short description] | X-Y min | ✓ |
| Task N.2 | [Short description] | X-Y min | ✓ |
| Task N.3 | [Short description] | X-Y min | ✓ |
| Task N.4 | [Short description] | X-Y min | ✓ |
| Task N.5 | [Short description] | X-Y min | ✓ |

**Instructions:** Replace ✓ with X for any task you wish to skip.

---

## Dependencies

### Requires (Blockers)
- [ ] Feature A must be complete
- [ ] External dependency B resolved

### Enables (Unlocks)
- Enables Feature X
- Required for Feature Y

---

## Risks and Mitigation

### Risk 1: [Description]
- **Likelihood:** High/Medium/Low
- **Impact:** High/Medium/Low
- **Mitigation:** [Strategy]

### Risk 2: [Description]
- **Likelihood:** High/Medium/Low
- **Impact:** High/Medium/Low
- **Mitigation:** [Strategy]

---

**Status:** Ready for implementation
**Next Phase:** [Link to next feature plan, if dependent]
```

---

## Planning Session Checklist

Before starting implementation:

### Planning Folder Setup
- [ ] Planning folder created with `YYYY-MM-DD-name/` pattern
- [ ] Folder placed in `.ai/planning/`

### Core Documents
- [ ] START-HERE.md written with:
  - [ ] Executive summary (2-3 paragraphs)
  - [ ] Progress summary (what was done)
  - [ ] Features list with priorities
  - [ ] Timeline with estimates
  - [ ] Success criteria
  - [ ] Document navigation

- [ ] README.md written with:
  - [ ] Quick overview
  - [ ] Document index
  - [ ] Priority table
  - [ ] Getting started section

### Analysis Documents
- [ ] Completion analysis (01-) if continuing work
- [ ] Concept/technical analysis (02-) as needed
- [ ] Additional analysis documents as needed

### Feature Plans
- [ ] Each feature has detailed plan (03-, 04-, 05-...)
- [ ] Each plan includes:
  - [ ] Clear overview and rationale
  - [ ] Current state assessment
  - [ ] Tasks broken down with estimates
  - [ ] Success criteria (functional, performance, quality)
  - [ ] Testing strategy
  - [ ] Implementation selection matrix
  - [ ] Dependencies identified

### Quality Checks
- [ ] Priorities assigned (HIGH/MEDIUM/LOW)
- [ ] Time estimates realistic (agentic + review)
- [ ] Dependencies documented
- [ ] Success criteria measurable
- [ ] Testing strategy complete
- [ ] All questions answered or noted

---

## Example: Integrated Roadmap

### Planning Session
```
.ai/planning/2025-11-23-integrated-roadmap/
├── START-HERE.md                      # Executive summary
├── README.md                          # Navigation
├── 01-COMPLETION-ANALYSIS.md         # What was done
├── 02-CONCEPT-LEXICON-ANALYSIS.md    # Codebase insights
├── 03-observability-plan.md          # Phase 3: Observability
├── 04-result-types-plan.md           # Phase 4: Result Types
├── 05-caching-strategy-plan.md       # Phase 5: Caching
├── 06-resilience-patterns-plan.md    # Phase 6: Resilience
├── 07-database-optimization-plan.md  # Phase 7: DB Optimization
└── 08-api-design-patterns-plan.md    # Phase 8: API Design
```

### Context
- **8 features** planned across 3-4 weeks
- Built on completion analysis from previous session
- Applied insights from concept lexicon analysis
- Prioritized based on dependencies and impact

### Priorities
1. 🔴 HIGH: Phase 5 (Caching) - Performance critical
2. 🟠 MEDIUM: Phase 3 (Observability) - Operations need
3. 🟠 MEDIUM: Phase 6 (Resilience) - Stability
4. 🟡 LOW: Phase 7 (DB Optimization) - Future scaling

### Implementation Order
Features implemented one at a time following priority, with commits after each task.

---

## Tips for Effective Planning

### Grouping Features

**Good reasons to group:**
- Share common context or domain
- Build on each other (dependencies)
- Part of same initiative/quarter
- Similar technical area

**Don't group if:**
- Completely unrelated features
- Different teams/owners
- Very different timelines
- No shared context

### Sizing Features

**Right-sized feature:**
- Takes 2-8 hours agentic time
- Has 3-6 concrete tasks
- Clear success criteria
- Can be implemented in one session

**Too large:**
- Split into multiple phases
- Each phase becomes a feature

**Too small:**
- Combine related small items
- May not need full planning

### Time Estimates

**Be realistic:**
- Include review time separately
- Account for testing time
- Add buffer for unknowns
- Track actuals for calibration

**Format:** `X-Yh agentic + Zh review`
- X-Y: Range for AI-assisted coding
- Z: Human review and feedback

---

## Version History

- **v1.0** (2025-11-24): Initial version split from combined workflow

**Derived From:** Template developed through production use
- Example: `.ai/planning/YYYY-MM-DD-project-roadmap/`




















