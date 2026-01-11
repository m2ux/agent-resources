# Requirements Elicitation Guide

## Overview

This guide provides methodology and templates for eliciting requirements through structured conversation. Requirements elicitation discovers **what** the user needs before planning **how** to implement it.

**When to use this guide:** New features and major enhancements only. Skip for bug fixes, refactors, chores, and minor updates.

---

## Elicitation Methodology

### Core Principle: Conversation, Not Interrogation

Elicitation is a dialogue, not a checklist. The goal is to:
- **Discover** what the user actually needs (which may differ from what they initially ask for)
- **Clarify** ambiguities before they become implementation assumptions
- **Establish** clear scope boundaries to prevent scope creep
- **Define** measurable success criteria

### The Five Elicitation Domains

```
┌─────────────────────────────────────────────────────────────┐
│                    1. PROBLEM                               │
│    What's broken/missing? Why does it matter?               │
├─────────────────────────────────────────────────────────────┤
│                    2. STAKEHOLDERS                          │
│    Who cares? Who uses it? Who's affected?                  │
├─────────────────────────────────────────────────────────────┤
│                    3. CONTEXT                               │
│    What's the environment? What are the constraints?        │
├─────────────────────────────────────────────────────────────┤
│                    4. SCOPE                                 │
│    What's in? What's out? What's the minimum viable?        │
├─────────────────────────────────────────────────────────────┤
│                    5. SUCCESS                               │
│    How do we know it's done? What does good look like?      │
└─────────────────────────────────────────────────────────────┘
```

---

## Question Bank

### 1. Problem Exploration

**Goal:** Understand the core problem and its impact.

| Question | Purpose |
|----------|---------|
| "What problem are we trying to solve?" | Establish the core issue |
| "What's not working well today?" | Identify current pain points |
| "What triggers the need for this now?" | Understand urgency and priority |
| "What would happen if we didn't address this?" | Assess impact of inaction |
| "Have you tried any workarounds?" | Learn from existing solutions |
| "How long has this been a problem?" | Gauge severity and history |

**Red flags to probe:**
- Vague problem statements ("it's just not good enough")
- Solutions disguised as problems ("we need a caching layer")
- Symptoms rather than root causes

### 2. Stakeholder Identification

**Goal:** Understand who is affected and their specific needs.

| Question | Purpose |
|----------|---------|
| "Who will use this feature?" | Identify primary users |
| "Are there different user types with different needs?" | Discover user segments |
| "Who else is affected by this change?" | Find secondary stakeholders |
| "Who makes decisions about this area?" | Identify decision-makers |
| "Are there any external parties involved?" | Discover external dependencies |

**User story format:**
> As a **[user type]**, I want **[capability]** so that **[benefit]**.

### 3. Context & Environment

**Goal:** Understand the operating environment and constraints.

| Question | Purpose |
|----------|---------|
| "What systems or components does this interact with?" | Map integration points |
| "Are there any dependencies on external services?" | Identify external factors |
| "What's the expected usage volume/frequency?" | Understand scale requirements |
| "Are there any technology constraints?" | Discover technical limitations |
| "What's the timeline or deadline?" | Understand time constraints |
| "Are there any regulatory or compliance requirements?" | Identify non-functional constraints |

### 4. Scope Definition

**Goal:** Establish clear boundaries to prevent scope creep.

| Question | Purpose |
|----------|---------|
| "What should definitely be included?" | Define must-haves |
| "What should explicitly NOT be included?" | Define exclusions |
| "What's the minimum viable version?" | Identify MVP scope |
| "What can be deferred to a later phase?" | Identify nice-to-haves |
| "Are there any constraints on complexity?" | Understand simplicity requirements |

**Scope boundary format:**
- ✅ **In scope:** [Explicit inclusions]
- ❌ **Out of scope:** [Explicit exclusions]
- ⏳ **Deferred:** [Future considerations]

### 5. Success Criteria

**Goal:** Define measurable outcomes that indicate completion.

| Question | Purpose |
|----------|---------|
| "How will we know this is working correctly?" | Define functional success |
| "What would a successful outcome look like?" | Establish acceptance criteria |
| "Are there any performance targets?" | Identify non-functional requirements |
| "What would make this a failure?" | Define failure conditions |
| "How will this be tested/validated?" | Consider verification approach |

**SMART criteria format:**
- **S**pecific: Clear and unambiguous
- **M**easurable: Quantifiable or observable
- **A**chievable: Realistic given constraints
- **R**elevant: Aligned with the problem
- **T**ime-bound: Has a clear timeline

---

## Elicitation Checkpoint Template

Use this template to confirm elicited requirements with the user:

```markdown
## 📋 Elicited Requirements

**Problem Statement:** 
[One sentence describing the core problem]

**Goal:** 
[What success looks like in one sentence]

---

### Stakeholders

| User Type | Need | Priority |
|-----------|------|----------|
| [Type 1] | [What they need] | Primary |
| [Type 2] | [What they need] | Secondary |

---

### Scope

**✅ In Scope:**
- [Must-have item 1]
- [Must-have item 2]
- [Must-have item 3]

**❌ Out of Scope:**
- [Explicit exclusion 1]
- [Explicit exclusion 2]

**⏳ Deferred:**
- [Future consideration 1]

---

### Success Criteria

| ID | Criterion | Measurable? |
|----|-----------|-------------|
| SC-1 | [Criterion 1] | ✅/❌ |
| SC-2 | [Criterion 2] | ✅/❌ |
| SC-3 | [Criterion 3] | ✅/❌ |

---

### Constraints

- **Technical:** [Any technical limitations]
- **Timeline:** [Any deadline constraints]
- **Dependencies:** [External dependencies]

---

### Open Questions

1. [Any remaining uncertainty 1]
2. [Any remaining uncertainty 2]

---

**Do these requirements capture what you need?**
```

---

## Output Document Template

**Location:** `.ai/planning/YYYY-MM-DD-work-package-name/00-requirements-elicitation.md`

```markdown
# Requirements Elicitation: [Work Package Name]

**Date:** YYYY-MM-DD
**Status:** ✅ Confirmed | 🔄 Pending Confirmation

---

## Problem Statement

[2-3 sentences describing the core problem being solved]

## Goal

[What success looks like - the desired end state]

---

## Stakeholders

### Primary Users

| User Type | Needs | User Story |
|-----------|-------|------------|
| [Type] | [Needs] | As a [type], I want [X] so that [Y] |

### Secondary Stakeholders

- [Stakeholder 1] - [Their interest]
- [Stakeholder 2] - [Their interest]

---

## Context

### Integration Points
- [System/component 1] - [How it interacts]
- [System/component 2] - [How it interacts]

### Dependencies
- [External dependency 1]
- [External dependency 2]

### Constraints
- **Technical:** [Constraints]
- **Timeline:** [Constraints]
- **Resources:** [Constraints]

---

## Scope

### ✅ In Scope

1. [Must-have 1]
2. [Must-have 2]
3. [Must-have 3]

### ❌ Out of Scope

1. [Exclusion 1] - [Why excluded]
2. [Exclusion 2] - [Why excluded]

### ⏳ Deferred

1. [Future item 1] - [When to revisit]

---

## Success Criteria

| ID | Criterion | Verification Method |
|----|-----------|---------------------|
| SC-1 | [Criterion 1] | [How to verify] |
| SC-2 | [Criterion 2] | [How to verify] |
| SC-3 | [Criterion 3] | [How to verify] |

---

## Elicitation Log

### Questions Asked

| Domain | Question | Response Summary |
|--------|----------|------------------|
| Problem | [Question] | [Key points from response] |
| Scope | [Question] | [Key points from response] |

### Clarifications Made

- [Clarification 1]: [Resolution]
- [Clarification 2]: [Resolution]

### Open Questions Resolved

- [Question]: [Resolution]

---

## Confirmation

**Confirmed by:** [User]
**Date:** YYYY-MM-DD
**Notes:** [Any additional notes from confirmation]
```

---

## Anti-Patterns to Avoid

| Don't | Why | Do Instead |
|-------|-----|------------|
| Ask leading questions | Biases responses | Ask open-ended questions |
| Accept vague answers | Creates assumptions | Probe for specifics |
| Skip scope boundaries | Leads to scope creep | Always define in/out |
| Assume you understand | Hidden misunderstandings | Confirm understanding |
| Mix requirements and solutions | Constrains design options | Keep "what" separate from "how" |
| Accept the first answer | May miss deeper needs | Ask "why" and "what else" |
| Skip stakeholder identification | Miss important perspectives | Always identify who's affected |

---

## Quick Reference

### Elicitation Flow

```
1. Explore problem → 2. Identify stakeholders → 3. Understand context
                              ↓
4. Define scope ← 5. Establish success criteria
                              ↓
                    🛑 CHECKPOINT: Confirm
```

### Minimum Viable Elicitation

For simpler features, at minimum capture:
- [ ] One-sentence problem statement
- [ ] Primary user/stakeholder
- [ ] 3-5 in-scope items
- [ ] 2-3 explicit exclusions
- [ ] 2-3 success criteria

### When to Stop Eliciting

Stop when you can confidently answer:
1. What problem are we solving? ✅
2. For whom? ✅
3. What's included and excluded? ✅
4. How will we know it's done? ✅

