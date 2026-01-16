# Work Packages Workflow

**Version:** 1.1  
**Last Updated:** January 2026  
**Purpose:** Organize multiple related work packages into an actionable roadmap

---

## Overview

This workflow defines how to plan and coordinate **multiple work packages** that share context, dependencies, or a common initiative. It produces a structured planning folder with analysis, prioritization, and links to individual work package plans.

**Use this workflow when you have:**
- Multiple related features to implement
- A roadmap spanning several weeks/months
- Features that share context or build on each other
- Need for prioritization across multiple initiatives

**For single work packages:** Use the [Work Package Workflow](_work-package.md) directly.

> **Key Principle:** This workflow handles **coordination and planning**. Individual work packages are implemented using the [Work Package Workflow](_work-package.md).

---

## Planning Folder Structure

### Location Pattern
```
.engineering/artifacts/planning/YYYY-MM-DD-descriptive-name/
```

**Examples:**
- `.engineering/artifacts/planning/2025-11-23-integrated-roadmap/`
- `.engineering/artifacts/planning/2025-12-01-performance-initiative/`
- `.engineering/artifacts/planning/2025-12-15-api-redesign/`

**Naming Conventions:**
- Use date prefix (YYYY-MM-DD) for chronological ordering
- Descriptive name (roadmap, initiative, sprint, project name)
- Kebab-case (lowercase with hyphens)

### Standard Structure

```
.engineering/artifacts/planning/YYYY-MM-DD-name/
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
4. Follow [Work Package Workflow](_work-package.md)
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
4. Follow [Work Package Workflow](_work-package.md)

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

## Individual Work Package Plans

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

### Work Package Plan Template

Each individual work package plan should provide enough context to begin implementation using the [Work Package Workflow](_work-package.md).

```markdown
# Phase N: [Feature Name]

**Date:** [Date]
**Priority:** [HIGH/MEDIUM/LOW] ([Reason])
**Status:** [Ready for Implementation/In Progress/Complete]
**Estimated Effort:** X-Yh agentic + Zh review

---

## Overview

[1-2 paragraphs explaining:]
- What this work package covers
- Why it's needed
- Expected impact

---

## Context from Analysis

[Reference relevant findings from analysis documents]
- Key insight from 01-COMPLETION-ANALYSIS.md
- Relevant pattern from 02-CONCEPT-ANALYSIS.md

---

## Scope

### In Scope
- Feature/capability A
- Feature/capability B

### Out of Scope
- Deferred to Phase N+1
- Not part of this initiative

---

## Dependencies

### Requires (Blockers)
- [ ] Phase N-1 must be complete
- [ ] External dependency resolved

### Enables (Unlocks)
- Phase N+1 depends on this
- Feature X requires this

---

## Success Criteria

- [ ] [Measurable outcome 1]
- [ ] [Measurable outcome 2]
- [ ] [Performance target if applicable]

---

## Implementation

👉 **Follow the [Work Package Workflow](_work-package.md)** to implement this work package.

The workflow will guide you through:
- Requirements elicitation
- Implementation analysis
- Design and architecture review
- Task breakdown and implementation
- Testing and validation
- PR creation and completion

---

**Status:** Ready for implementation
**Next Phase:** [Link to next work package plan]
```

---

## Planning Session Checklist

Before starting implementation:

### Planning Folder Setup
- [ ] Planning folder created with `YYYY-MM-DD-name/` pattern
- [ ] Folder placed in `.engineering/artifacts/planning/`

### Core Documents
- [ ] START-HERE.md written with executive summary, priorities, and navigation
- [ ] README.md written with quick overview and document index

### Analysis Documents (as needed)
- [ ] Completion analysis (01-) if continuing previous work
- [ ] Context/technical analysis (02-) for background

### Work Package Plans
- [ ] Each work package has a plan document (03-, 04-, 05-...)
- [ ] Each plan includes overview, scope, dependencies, and success criteria
- [ ] Each plan references [Work Package Workflow](_work-package.md) for implementation

### Quality Checks
- [ ] Priorities assigned (HIGH/MEDIUM/LOW)
- [ ] Time estimates realistic (agentic + review)
- [ ] Dependencies between work packages documented
- [ ] Success criteria measurable

---

## Example: Integrated Roadmap

### Planning Session
```
.engineering/artifacts/planning/2025-11-23-integrated-roadmap/
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

- **v1.1** (2026-01): Refactored to reference _work-package.md instead of duplicating implementation details
- **v1.0** (2025-11-24): Initial version split from combined workflow

**Related:** [Work Package Workflow](_work-package.md) for implementing individual work packages
















