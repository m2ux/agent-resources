# Work Package Implementation Workflow
## Overview

This workflow defines how to plan and implement ONE work package from inception to merged PR. A **work package** is a discrete unit of work such as a feature, bug-fix, enhancement, refactoring, or any other deliverable change.

**For multiple related work packages:** Use the [High-Level Planning Workflow](high-level-planning-workflow.md) to create a roadmap first.

---

## ⚠️ MANDATORY: Read AGENTS.md First

**Before starting any work package, agents MUST read and follow `.engineering/agent/workflows/AGENTS.md`.**

This file contains critical guidelines for:
- Code modification boundaries (when to ask permission)
- Communication standards (tone, language, no process attribution)
- Implementation workflow boundaries (one task at a time)
- File and directory restrictions
- Version control practices

**Key rules from AGENTS.md that apply to this workflow:**
1. **Do not modify code unless explicitly directed by the user**
2. **Complete only ONE numbered task at a time** - stop and ask permission before proceeding
3. **Never add process attribution comments** to code
4. **Never commit changes unless user explicitly asks**

📄 **Reference:** `.engineering/agent/workflows/AGENTS.md`

---

## Workflow
### Rules
- **Agents must NOT proceed past checkpoints without user confirmation**.
- **Ask, don't assume** - Clarify requirements before acting
- **Summarize, then proceed** - Provide brief status before asking to continue
- **One task at a time** - Complete current work before starting new work
- **Explicit approval** - Get clear "yes" or "proceed" before major actions

### Overview
```
1. ISSUE VERIFICATION & PR CREATION (10-20m)
   ├─ Check if GitHub or Jira issue specified
   ├─ 🛑 CHECKPOINT: "No issue found. Should I create one?"
   ├─ If creating: Use Issue Creation Guide to define problem space
   ├─ Create GitHub issue (problem-focused, no solutions)
   ├─ 🛑 CHECKPOINT: "Issue #N created. Proceed?"
   ├─ Create feature branch (type/work-package-name)
   ├─ Add changelog to changes/changed/ (references issue)
   ├─ Create draft PR with changelog only
   └─ 🛑 CHECKPOINT: "PR #N created. Do you need requirements elicitation?"

2. REQUIREMENTS ELICITATION (15-30m) [If requested]
   ├─ Explore problem space through conversation
   ├─ Clarify stakeholders and context
   ├─ Define scope boundaries (in/out lists)
   ├─ Establish success criteria
   ├─ Review elicited requirements
   ├─ 🛑 CHECKPOINT: "Have I understood the requirements correctly?"
   ├─ Create 00-requirements-elicitation.md
   └─ 🛑 CHECKPOINT: "Would you like to perform research?"

3. RESEARCH (20-45m) [If requested]
   ├─ Research knowledge base (concept-rag MCP)
   ├─ 🛑 CHECKPOINT: "Do these insights align with your expectations?"
   ├─ Web research (best practices, patterns, libraries)
   ├─ 🛑 CHECKPOINT: "Are these external resources relevant?"
   ├─ Analyze current implementation (effectiveness, gaps, metrics)
   └─ 🛑 CHECKPOINT: "Do these findings accurately reflect current state?"

4. PLAN & PREPARE (20-45m)
   ├─ Apply design framework
   ├─ Design approach (informed by research and analysis)
   ├─ 🛑 CHECKPOINT: "Does this approach look right? Any concerns?"
   ├─ Define tasks and estimates
   ├─ Create work package plan document
   ├─ Sync feature branch with main
   ├─ 🛑 VERIFY: On feature branch, NOT main/master
   ├─ Create test plan (RECOMMENDED)
   ├─ Update PR description with plan summary
   ├─ 🛑 CHECKPOINT: "Ready to begin implementation?"
   └─ Create TODO list

5. IMPLEMENT TASKS (varies)
   ├─ 🛑 VERIFY: On feature branch before any code changes
   ├─ Create 04-assumptions-log.md (before Task 1)
   ├─ Task N.1: Code + Test + Commit
   ├─ Review assumptions made during implementation
   ├─ 🛑 CHECKPOINT: "Task N complete. Review assumptions—confirm or correct?"
   ├─ Update 04-assumptions-log.md with outcomes
   ├─ Task N.2: Code + Test + Commit
   ├─ ...
   ├─ Verify architectural significance (after all tasks complete)
   ├─ 🛑 CHECKPOINT: "Is this architecturally significant? Create ADR?"
   ├─ Create ADR (if architecturally significant)
   └─ 🛑 CHECKPOINT: "ADR captures final architecture decisions?"

6. VALIDATE (30-60m)
   ├─ Full test suite
   ├─ Build verification
   └─ Performance validation

7. FINALIZE (15-30m)
   ├─ Update ADR status to Accepted (if ADR exists)
   ├─ Finalize test plan with source links
   ├─ Create WP-COMPLETE.md
   ├─ Inline documentation complete
   └─ 🛑 CHECKPOINT: "Does the PR description look correct?"

8. UPDATE PR (10-15m)
   ├─ Push all changes
   ├─ Update PR description
   ├─ 🛑 CHECKPOINT: "Ready to mark PR as ready for review?"
   └─ Mark PR ready for review

9. POST-IMPLEMENTATION
   ├─ After PR merged: Update status
   └─ Select next work package
```

## Phase 1: Issue Verification & PR Creation

**Every work package should be linked to a GitHub or Jira issue.** Issues define the problem space and provide traceability from requirements through implementation. The draft PR is created early with an initial changelog to establish the work package.

### 1.1 Check for Existing Issue

Before starting any work, verify whether an issue has been specified:

**Sources to check:**
- User explicitly provided issue number (e.g., "Implement #51")
- User linked to issue URL (e.g., "https://github.com/org/repo/issues/51")
- Jira ticket reference (e.g., "PROJ-123")
- Issue mentioned in context or conversation

### 1.2 🛑 Issue Verification Checkpoint

If no issue is found, **STOP and ask the user:**

```markdown
## 🎫 Issue Verification

I didn't find a GitHub or Jira issue associated with this work package.

**Issues provide:**
- Clear problem definition (what's broken/missing)
- Acceptance criteria (how we know it's done)
- Traceability (PR → Issue → Requirements)
- Stakeholder visibility

**Options:**
1. **Provide existing issue** - Share the issue number or URL
2. **Create new issue** - I'll help draft one using the Issue Creation Guide
3. **Skip issue** - Proceed without (not recommended for non-trivial work)

---
**Which option would you like?**
```

### 1.3 Creating a New Issue

📄 **Reference:** Follow the [Issue Creation Guide](issue-creation-guide.md) for template, methodology, and rules about problem-focused (not solution-focused) issues.

**Issue Creation Process:**

```
┌─────────────────────────────────────┐
│ 1. Draft Problem Statement          │
│    - What's broken/missing?         │
│    - Current vs desired state       │
└────────────┬────────────────────────┘
             │
┌────────────▼────────────────────────┐
│ 2. Define Scope                     │
│    - In scope items                 │
│    - Out of scope items             │
└────────────┬────────────────────────┘
             │
┌────────────▼────────────────────────┐
│ 3. Write User Stories               │
│    - As a [user], I want [X]        │
│    - Acceptance criteria            │
└────────────┬────────────────────────┘
             │
┌────────────▼────────────────────────┐
│ 🛑 CHECKPOINT: Review with User     │
└────────────┬────────────────────────┘
             │
┌────────────▼────────────────────────┐
│ 4. Create GitHub Issue              │
│    - Use gh api or gh issue create  │
└─────────────────────────────────────┘
```

**Creating the issue:**

```bash
# Write issue body to temp file
cat > /tmp/issue-body.md << 'EOF'
[Issue content following Issue Creation Guide template]
EOF

# Create issue using GitHub CLI
gh issue create --title "Issue Title" --body "$(cat /tmp/issue-body.md)"

# Or using API (preferred for complex content)
gh api repos/OWNER/REPO/issues -X POST \
  -f title="Issue Title" \
  -f body="$(cat /tmp/issue-body.md)"
```

### 1.4 🛑 Issue Created Checkpoint

After creating the issue, **confirm with user:**

```markdown
## ✅ Issue Created

**Issue:** #[number] - [Title]
**URL:** https://github.com/OWNER/REPO/issues/[number]

**Summary:**
- **Problem:** [One sentence]
- **Goal:** [One sentence]
- **Scope:** [Key items]

---
**Proceed to create feature branch and initial PR?**
```

### 1.5 Create Feature Branch

**Create the feature branch immediately after issue verification:**

```bash
# Ensure you're on main and up to date
git checkout main
git pull origin main

# Create feature branch
git checkout -b type/work-package-name
```

**Branch naming convention:**

| Type | Pattern | Example |
|------|---------|---------|
| Feature | `feat/work-package-name` | `feat/add-concept-caching` |
| Bug fix | `fix/bug-description` | `fix/search-null-pointer` |
| Refactor | `refactor/component-name` | `refactor/query-builder` |
| Performance | `perf/optimization-name` | `perf/index-lookup-speed` |
| Documentation | `docs/topic-name` | `docs/api-reference-update` |

### 1.6 Add Initial Changelog

**Create a changelog file in `changes/changed/` that references the issue:**

**Naming convention:** `{issue-number}-{brief-description}.md`

**Example:** `changes/changed/51-add-concept-caching.md`

```markdown
# [Brief Title]

## Summary

[One sentence describing the change]

## Issue

Fixes #[number]

## Type

[Feature | Bug Fix | Enhancement | Refactor | Documentation]
```

**Commit the changelog:**

```bash
git add changes/changed/
git commit -m "docs: add changelog for #[number]"
```

### 1.7 Create Draft PR

**Create the draft PR with the changelog as the initial content:**

```bash
# Push branch
git push -u origin type/work-package-name

# Create draft PR and assign
gh pr create --draft --assignee {GITHUB_USERNAME} \
  --title "type: Work Package Name" \
  --body "## 🎫 Issue

Fixes #[number]

## Status

🚧 Planning in progress

## Changelog

See \`changes/changed/[number]-description.md\`
"
```

**Why create PR early?**
- Establishes the work package immediately
- Provides visibility to stakeholders
- Links issue and PR early for traceability
- All subsequent commits are tracked

### 1.8 🛑 PR Created Checkpoint

After creating the PR, **confirm with user and ask about requirements elicitation:**

```markdown
## ✅ PR Created

**PR:** #[number] - [Title]
**Issue:** #[issue-number] - [Issue Title]

The PR is now linked to the issue. Next steps are research (Phase 3) and 
planning (Phase 4) to determine the approach, followed by implementation 
(Phases 5-9) to complete the work.

---

### Do you need requirements elicitation?

Requirements elicitation (Phase 2) is a structured conversation to discover 
and clarify what the work package should accomplish. It's useful when:

- ✅ Requirements are unclear or incomplete
- ✅ Scope needs to be explicitly defined (in/out lists)
- ✅ Multiple stakeholders have different needs
- ✅ Success criteria need to be established

It can be skipped when:
- ⏭️ Requirements are already well-defined in the issue
- ⏭️ The problem and solution are straightforward
- ⏭️ Scope is clear and unambiguous

**Options:**
1. **Yes, elicit requirements** - Proceed to Phase 2 (Requirements Elicitation)
2. **No, skip elicitation** - Proceed to research decision

**Which would you prefer?**
```

### 1.9 Issue Verification Checklist

- [ ] Checked for existing GitHub/Jira issue
- [ ] 🛑 **Asked user if no issue found**
- [ ] Issue created (if needed) following [Issue Creation Guide](issue-creation-guide.md)
- [ ] 🛑 **Issue confirmed with user**
- [ ] Feature branch created with correct naming
- [ ] Changelog added to `changes/changed/`
- [ ] Draft PR created linking to issue
- [ ] 🛑 **PR confirmed and elicitation decision obtained from user**

---

## Phase 2: Requirements Elicitation

**Discover and clarify what the work package should accomplish through structured conversation.** This phase ensures requirements are explicitly captured before planning the approach.

### 2.1 When to Perform Elicitation

**The user decides whether requirements elicitation is needed** at the Phase 1.8 checkpoint. This decision was made after creating the PR.

> **If skipping:** Proceed directly to Phase 3 (Research). The issue from Phase 1 serves as the requirements source.

### 2.2 Elicitation Process

Use a **sequential, conversational approach** to explore requirements. Ask **one question at a time**, wait for the user's response, and give them the option to skip.

**Key principles:**
- **One question per turn** - Never present multiple questions in a single message
- **Skip option always available** - User can say "skip" to move to the next question
- **Capture answers incrementally** - Build understanding as you go
- **Adapt based on responses** - Skip irrelevant follow-ups, probe deeper when needed

```
┌─────────────────────────────────────┐
│ For each question category:         │
│                                     │
│   1. Ask ONE question               │
│   2. Wait for response              │
│   3. User answers OR says "skip"    │
│   4. Record answer (if given)       │
│   5. Move to next question          │
│                                     │
│ After all categories:               │
│   🛑 CHECKPOINT: Requirements       │
└─────────────────────────────────────┘
```

**Question flow:**

```
Problem Exploration (1-4 questions)
        │
        ▼
Stakeholders & Context (1-4 questions)
        │
        ▼
Scope Boundaries (1-4 questions)
        │
        ▼
Success Criteria (1-4 questions)
        │
        ▼
🛑 CHECKPOINT: Summarize & Confirm
```

### 2.3 Elicitation Questions

Ask questions **one at a time** from each category. Always include the skip option.

**Question format:**

```markdown
## 📋 [Category Name] (Question N of M)

[Question text]

---
**Options:** Answer the question, or type **"skip"** to move on.
```

#### Problem Exploration

Ask these sequentially (stop when you have sufficient understanding):

1. "What problem are we trying to solve?"
2. "What's not working well today?"
3. "What would happen if we didn't address this?"
4. "Have you tried any workarounds?"

#### Stakeholders & Context

Ask these sequentially:

1. "Who will use this feature or be affected by this change?"
2. "Are there different user types with different needs?"
3. "What systems or components does this interact with?"
4. "Are there any dependencies on external services or tools?"

#### Scope Boundaries

Ask these sequentially:

1. "What should definitely be included in this work?"
2. "What should explicitly NOT be included?"
3. "Are there any constraints (time, technology, resources)?"
4. "What's the minimum viable version?"

#### Success Criteria

Ask these sequentially:

1. "How will you know this is working correctly?"
2. "What would a successful outcome look like?"
3. "Are there any performance or quality targets?"
4. "What would make this a failure?"

### 2.3.1 Example Elicitation Turn

**Agent presents:**

```markdown
## 📋 Problem Exploration (Question 1 of 4)

What problem are we trying to solve?

---
**Options:** Answer the question, or type **"skip"** to move on.
```

**User responds:** "Planning docs are lost when I switch machines."

**Agent records answer, then presents next question:**

```markdown
## 📋 Problem Exploration (Question 2 of 4)

What's not working well today?

---
**Options:** Answer the question, or type **"skip"** to move on.
```

**User responds:** "skip"

**Agent moves to next question without recording an answer.**

### 2.3.2 Adaptive Questioning

- **If user provides comprehensive answer**: Skip related follow-up questions in that category
- **If user's answer raises new concerns**: Add a clarifying question before moving on
- **If user says "skip all [category]"**: Move to the next category entirely
- **If user says "done with questions"**: Proceed directly to the requirements checkpoint

### 2.4 🛑 Requirements Elicitation Checkpoint

After exploring requirements, **STOP and confirm with user:**

```markdown
## 📋 Elicited Requirements

**Problem Statement:** [One sentence describing the core problem]

**Goal:** [What success looks like]

**Stakeholders:**
- [Primary user type] - [Their need]
- [Secondary user type] - [Their need]

**Scope:**
- ✅ In scope:
  - [Item 1]
  - [Item 2]
- ❌ Out of scope:
  - [Item 1]
  - [Item 2]

**Success Criteria:**
- [ ] [Criterion 1]
- [ ] [Criterion 2]

**Constraints:**
- [Any limitations or dependencies]

**Open Questions:**
1. [Any remaining uncertainties]

---
**Do these requirements capture what you need?**
```

### 2.5 Elicitation Output

**Create:** `.engineering/artifacts/planning/YYYY-MM-DD-work-package-name/00-requirements-elicitation.md`

📄 **Reference:** Follow the [Requirements Elicitation Guide](requirements-elicitation-guide.md) for the full template and methodology.

The elicitation document captures:
- Problem statement and goal
- Stakeholders and context
- Scope boundaries (in/out lists)
- Success criteria
- Constraints and assumptions
- Open questions (resolved before proceeding)

### 2.6 Requirements Elicitation Checklist

- [ ] User confirmed elicitation is needed (Phase 1.8 checkpoint)
- [ ] Problem explored through conversation
- [ ] Stakeholders and context identified
- [ ] Scope boundaries defined (in/out lists)
- [ ] Success criteria established
- [ ] 🛑 **Requirements confirmed with user**
- [ ] `00-requirements-elicitation.md` created

### 2.7 🛑 Research Decision Checkpoint

**After requirements elicitation (or immediately after Phase 1 if elicitation was skipped), ask about research:**

```markdown
## 🔬 Research Decision

Would you like me to perform research before planning?

Research (Phase 3) gathers knowledge base insights, web research, and current 
implementation analysis to inform the planning phase. It's useful when:

- ✅ The problem domain is unfamiliar or complex
- ✅ Best practices or design patterns should be discovered
- ✅ Current implementation needs analysis to establish baselines
- ✅ External libraries, tools, or approaches may be relevant
- ✅ You want evidence-based recommendations

It can be skipped when:

- ⏭️ The problem domain is well-understood
- ⏭️ The solution approach is already clear
- ⏭️ No external research or pattern discovery is needed
- ⏭️ Current implementation is already well-documented

**Options:**
1. **Yes, perform research** - Proceed to Phase 3 (Research)
2. **No, skip to planning** - Proceed directly to Phase 4 (Plan & Prepare)

**Which would you prefer?**
```

---

## Phase 3: Research

Research the knowledge base and analyze current implementation to inform the planning phase.

> **Note:** If requirements were elicited in Phase 2, use them as context for research. If elicitation was skipped, use the issue from Phase 1 as context.

### 3.1 When to Perform Research

**The user decides whether research is needed** at the Phase 2.7 checkpoint. This decision was made after completing requirements elicitation (or immediately after Phase 1 if elicitation was skipped).

> **If skipping:** Proceed directly to Phase 4 (Plan & Prepare). Use the issue from Phase 1 and any elicited requirements from Phase 2 as context for planning.

### 3.2 Research Process

```
┌─────────────────────────────────────┐
│ 1. Research Knowledge Base          │
│    - Search for related concepts    │
│    - Find relevant design patterns  │
│    - Discover best practices        │
└────────────┬────────────────────────┘
             │
┌────────────▼────────────────────────┐
│ 🛑 CHECKPOINT: Knowledge Insights   │
└────────────┬────────────────────────┘
             │
┌────────────▼────────────────────────┐
│ 2. Web Research                     │
│    - Industry best practices        │
│    - Relevant libraries/tools       │
│    - Similar implementations        │
│    - Documentation & tutorials      │
└────────────┬────────────────────────┘
             │
┌────────────▼────────────────────────┐
│ 🛑 CHECKPOINT: Web Research         │
└────────────┬────────────────────────┘
             │
┌────────────▼────────────────────────┐
│ 3. Analyze Current Implementation   │
│    - How is it currently used?      │
│    - What are baseline metrics?     │
│    - Is it effective? (evidence)    │
│    - What gaps/opportunities exist? │
└────────────┬────────────────────────┘
             │
┌────────────▼────────────────────────┐
│ 🛑 CHECKPOINT: Analysis Findings    │
└─────────────────────────────────────┘
```

### 3.3 Knowledge Base Research

Before designing an approach, **research the knowledge base** using concept-rag MCP tools to discover relevant concepts, best practices, and design patterns.

**⚠️ MANDATORY:** Call `get_guidance` before making other concept-rag MCP tool calls.

📄 **Reference:** [Knowledge Base Research Guide](knowledge-base-research-guide.md) — Full methodology, templates, and checkpoint format.

**Output:** `.engineering/artifacts/planning/YYYY-MM-DD-work-package-name/02-kb-research.md`

### 3.4 🛑 Knowledge Base Insights Checkpoint

After researching, **STOP and present findings** using the checkpoint template from the guide above.

### 3.5 Web Research

**Research external sources** to discover industry best practices, relevant libraries, and similar implementations.

**Areas to research:**
- Industry best practices for the problem domain
- Relevant libraries, frameworks, or tools
- Similar implementations in open source projects
- Official documentation and tutorials
- Recent articles or blog posts on the topic

**Use the `web_search` tool** to find current information.

**Output:** Add web research findings to `.engineering/artifacts/planning/YYYY-MM-DD-work-package-name/02-kb-research.md` (or create separate `02b-web-research.md` if extensive).

### 3.6 🛑 Web Research Checkpoint

After web research, **STOP and present findings:**

```markdown
## 🌐 Web Research Findings

**Search Topics:**
1. [Topic 1] - [What was searched]
2. [Topic 2] - [What was searched]

**Key Findings:**

### Best Practices
- [Finding 1] - [Source]
- [Finding 2] - [Source]

### Relevant Libraries/Tools
- [Library 1] - [Brief description, relevance]
- [Library 2] - [Brief description, relevance]

### Similar Implementations
- [Example 1] - [What's relevant]

### Documentation/Resources
- [Resource 1] - [Link/reference]

**Recommendations:**
- [How these findings should inform the approach]

---
**Are these external resources relevant? Any additional areas to research?**
```

### 3.7 Current Implementation Analysis

After gathering knowledge base and web research insights, **analyze the current implementation** to understand effectiveness, establish baselines, and identify opportunities for improvement.

📄 **Reference:** [Implementation Analysis Guide](implementation-analysis-guide.md) — Full methodology, templates, and checkpoint format.

**Output:** `.engineering/artifacts/planning/YYYY-MM-DD-work-package-name/03-implementation-analysis.md`

### 3.8 🛑 Analysis Findings Checkpoint

After completing analysis, **STOP and present findings** using the checkpoint template from the guide above.

### 3.9 Research Checklist

- [ ] User confirmed research is needed (Phase 2.7 checkpoint)
- [ ] `get_guidance` called at start of KB research session (MANDATORY)
- [ ] Knowledge base researched → `02-kb-research.md`
- [ ] 🛑 **Knowledge insights confirmed with user**
- [ ] Web research completed (best practices, libraries, examples)
- [ ] 🛑 **Web research findings confirmed with user**
- [ ] Current implementation analyzed → `03-implementation-analysis.md`
- [ ] Baseline metrics established with evidence
- [ ] 🛑 **Analysis findings confirmed with user**

---

## Phase 4: Plan & Prepare

Design the approach, create the work package plan, and prepare for implementation.

> **Note:** The feature branch and draft PR were created in Phase 1.

### 4.1 When Planning is Required

**Always plan when:**
- Work package has 3+ distinct tasks
- Multiple files or components affected
- Architectural decisions needed
- Performance targets must be met

**Skip formal planning when:**
- Simple, well-understood bug fix
- Single file change with clear requirements
- Change can be completed in <30 minutes

### 4.2 Design Framework

**Consult the Design Framework Guide** before designing the approach to structure problem-solving and identify solution strategies.

📄 **Reference:** [Design Framework Guide](design-framework-guide.md)

**The framework helps you:**
- Define the problem clearly before jumping to solutions
- Classify the problem type to select the right approach
- Explore conventional solutions first (design patterns, best practices)
- Apply inventive principles when trade-offs or contradictions exist
- Synthesize and document the final design

> **Note:** For straightforward implementations, a lightweight application focusing on problem definition and conventional solutions may suffice. Apply the full framework for complex problems with trade-offs.

### 4.3 Planning Process

```
┌─────────────────────────────────────┐
│ 0. Apply Design Framework           │
│    - Problem definition             │
│    - Problem type classification    │
│    - Solution approach selection    │
└────────────┬────────────────────────┘
             │
┌────────────▼────────────────────────┐
│ 1. Design Approach                  │
│    - How will we solve it?          │
│    - What are the alternatives?     │
└────────────┬────────────────────────┘
             │
┌────────────▼────────────────────────┐
│ 🛑 CHECKPOINT: Approach             │
└────────────┬────────────────────────┘
             │
┌────────────▼────────────────────────┐
│ 2. Define Tasks & Document Plan     │
└────────────┬────────────────────────┘
             │
┌────────────▼────────────────────────┐
│ 3. Sync Branch & Prepare            │
└────────────┬────────────────────────┘
             │
┌────────────▼────────────────────────┐
│ 🛑 CHECKPOINT: Ready to Implement   │
└─────────────────────────────────────┘
```

### 4.4 Approach Checkpoint

After designing the approach, **STOP and confirm:**

```markdown
## 🎯 Proposed Approach

**Solution Overview:** [2-3 sentences]

**Key Components:**
1. [Component/change 1]
2. [Component/change 2]

**Alternatives Considered:**
- Option A: [Brief] - [Why not chosen]

**Trade-offs:**
- Pro: [Benefit]
- Con: [Limitation]

**Estimated Effort:** X-Yh agentic + Zh review

---
**Does this approach look right?**
```

### 4.5 Work Package Plan Folder

> **Note:** Always use the folder pattern for consistency with [High-Level Planning Workflow](high-level-planning-workflow.md). Even simple work packages benefit from the structured navigation.

**Location:** `.engineering/artifacts/planning/YYYY-MM-DD-work-package-name/`

**Structure:**
```
.engineering/artifacts/planning/YYYY-MM-DD-work-package-name/
├── START-HERE.md              # Executive summary (required) - includes issue link
├── README.md                  # Quick navigation (required)
├── 00-requirements-elicitation.md  # Elicited requirements (if requested)
├── 01-work-package-plan.md    # Detailed implementation plan (required)
├── 02-kb-research.md          # Knowledge base research findings (recommended)
├── 03-implementation-analysis.md  # Current implementation analysis (recommended)
└── 04-assumptions-log.md      # Assumptions and outcomes (created during implementation)
```

> **Issue Reference:** The `START-HERE.md` should include the issue link from Phase 1 (e.g., `**Issue:** [#51](https://github.com/OWNER/REPO/issues/51)`).

**For complex work packages**, add additional files as needed:
```
.engineering/artifacts/planning/YYYY-MM-DD-work-package-name/
├── START-HERE.md
├── README.md
├── 00-requirements-elicitation.md  # Elicited requirements (features only, see guide)
├── 01-work-package-plan.md    # Implementation plan
├── 02-kb-research.md          # KB research (see Knowledge Base Research Guide)
├── 03-implementation-analysis.md  # Analysis (see Implementation Analysis Guide)
├── 04-assumptions-log.md      # Assumptions made and outcomes (see below)
└── 05-testing-plan.md         # Detailed testing (if needed)
```

---

#### START-HERE.md

📄 **Reference:** Follow the [Work Package START-HERE Template](start-here-template.md) for the full template and guidelines.

---

#### README.md

📄 **Reference:** Follow the [Work Package README Template](readme-template.md) for the full template and guidelines.

---

#### 01-work-package-plan.md

📄 **Reference:** Follow the [Work Package Plan Template](plan-template.md) for the full template and guidelines.

---

#### 04-assumptions-log.md

📄 **Reference:** Follow the [Assumptions Guide](assumptions-guide.md) for assumption categories, review process, and log template.

### 4.6 Sync Feature Branch with Main

**Ensure the feature branch is up to date with main before starting implementation:**

```bash
# Switch to feature branch (created in Phase 1)
git checkout type/work-package-name

# Pull latest from main
git fetch origin main
git rebase origin/main

# Or merge if preferred
# git merge origin/main
```

**Verification:**

```bash
# Confirm you're on the correct branch
git branch --show-current
# Should output: type/work-package-name (NOT main or master)
```

### 4.7 Create Test Plan (Recommended)

**Create a test plan when the work package has multiple testable behaviors.**

The test plan documents how the work package's requirements will be validated. At this stage, create a **placeholder** test plan—detailed test cases and source links will be added after implementation.

**Steps:**

1. Create test plan file: `docs/tests/test-plan-work-package-name.md`
2. Use the **Initial Test Plan Template** (placeholder without source links)
3. List planned test objectives (implementation details come later)

📄 **Reference:** Follow the [Test Plan Creation Guide](test-plan-creation-guide.md) for templates, TDD principles, and guidelines.

> **Note:** The test plan will be finalized in Phase 7 (Finalize) after implementation is complete, adding hyperlinks to actual test locations.

### 4.8 Update PR Description

**Update the PR description with the plan summary.** The PR was created in Phase 1 with just the changelog; now add implementation details.

```bash
# Update PR description using GitHub API
gh api repos/OWNER/REPO/pulls/PR_NUMBER -X PATCH \
  -f body="$(cat /tmp/pr-body.md)"
```

**PR description should now include:**

```markdown
## 🎫 Issue

Fixes #[issue-number]

## Summary

[Brief description of what this PR implements]

## Approach

[Key design decisions from Phase 4 planning]

## Tasks

- [ ] Task 1: [Description]
- [ ] Task 2: [Description]
- [ ] Task 3: [Description]

## Changelog

See `changes/changed/[number]-description.md`

## Status

🚧 Implementation in progress
```

📄 **Reference:** Follow the [PR Description Guide](pr-description-guide.md) for the full template.

### 4.9 Create TODO List

Extract tasks from work package plan. Create one TODO per task.

**TODO Management:**
- Mark only ONE as `in_progress` at a time
- Update to `completed` immediately after finishing
- Use descriptive names matching plan

### 4.10 🛑 Ready to Implement Checkpoint

Before starting implementation, **present the plan summary:**

```markdown
## ✅ Ready to Implement

**Work Package:** [Name]
**PR:** #[pr-number] - [Title]
**Issue:** #[issue-number] - [Issue Title]
**Type:** [Feature/Bug-Fix/Enhancement/Refactor]
**Estimated Effort:** X-Yh agentic + Zh review

**Tasks to Complete:**
1. Task 1: [Name] (~X min)
2. Task 2: [Name] (~X min)

**Success Criteria:**
- [ ] Criterion 1
- [ ] Criterion 2

**I will:**
- Implement tasks in order, committing after each
- Stop after each task to report progress
- Create ADR after implementation (if major feature)

---
**Ready to proceed with implementation?**
```

### 4.11 Plan & Prepare Checklist

- [ ] Issue verified or created (Phase 1)
- [ ] Requirements elicited (Phase 2, features only)
- [ ] Research completed (Phase 3)
- [ ] Design framework consulted
- [ ] Approach designed with alternatives
- [ ] 🛑 **Approach confirmed with user**
- [ ] Tasks broken down with estimates
- [ ] Success criteria defined (quantitative targets)
- [ ] Work package plan folder created:
  - [ ] `START-HERE.md` - Executive summary
  - [ ] `README.md` - Quick navigation
  - [ ] `00-requirements-elicitation.md` - Elicited requirements (if requested)
  - [ ] `01-work-package-plan.md` - Implementation details
  - [ ] `02-kb-research.md` - Knowledge base findings
  - [ ] `03-implementation-analysis.md` - Analysis findings
- [ ] Feature branch synced with main
- [ ] On correct feature branch (not main/master) 🛑
- [ ] Test plan created (if applicable)
- [ ] PR description updated with plan summary
- [ ] TODOs created from plan
- [ ] 🛑 **Ready to implement confirmed with user**

---

## Phase 5: Implement Tasks

### 5.0 Pre-Implementation Branch Verification

**Before writing any code, verify you're on the correct feature branch:**

```bash
# Check current branch
git branch --show-current

# Expected: type/work-package-name (e.g., feat/add-concept-caching)
# NOT: main, master, or any other branch
```

⚠️ **Do NOT proceed with implementation until you're on the correct feature branch.**

### 5.1 Task Implementation Pattern

```
0. Verify on feature branch (NOT main/master)
       │
1. Read task spec (goal, deliverables)
       │
2. Implement (bottom-up, follow existing patterns)
       │
3. Test immediately (100% coverage of new code)
       │
4. Commit with clear message
       │
5. Update TODO (mark completed, next in_progress)
       │
6. Review assumptions made during implementation
       │
7. 🛑 Report progress + assumptions to user
       │
8. Document assumptions + outcomes in 04-assumptions-log.md
```

### 5.2 Assumption Review

**After completing each task, explicitly identify assumptions made during implementation.**

📄 **Reference:** Follow the [Assumptions Guide](assumptions-guide.md) for assumption categories, self-review questions, and the log template.

### 5.3 Code Quality Checklist

- [ ] Follows existing patterns and architecture
- [ ] Type-safe (compiler checks pass)
- [ ] Error handling implemented
- [ ] No hardcoded values
- [ ] Documentation comments on public APIs
- [ ] No debug prints in production code

### 5.4 Testing as You Code

**Don't defer testing - write tests alongside implementation:**

1. Write interface/type signature
2. Write basic test
3. Implement to pass test
4. Add edge case tests
5. Implement to pass all tests
6. Refactor if needed (tests protect you)

**Language-specific test commands:**

| Language | Run Tests | Run Single Test |
|----------|-----------|-----------------|
| Rust | `cargo test` | `cargo test test_name` |
| TypeScript | `npm test` | `npm test -- path/to/test` |
| Python | `pytest` | `pytest path/to/test.py` |

### 5.5 Commit Strategy

**Commit after each task** following the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) specification.

#### Commit Message Format

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

**Rules:**
- **Description** must be 50 characters or less
- **Body** (if present) must be separated by a blank line
- **Footer** (if present) must be separated by a blank line from body

#### Types

| Type | When to Use | SemVer Impact |
|------|-------------|---------------|
| `feat` | New feature or capability | MINOR |
| `fix` | Bug fix | PATCH |
| `docs` | Documentation only | None |
| `style` | Formatting, no code change | None |
| `refactor` | Code change that neither fixes nor adds | None |
| `perf` | Performance improvement | None |
| `test` | Adding or correcting tests | None |
| `build` | Build system or dependencies | None |
| `ci` | CI configuration | None |
| `chore` | Other changes (e.g., tooling) | None |

#### Breaking Changes

Indicate breaking changes using `!` after type/scope OR with a `BREAKING CHANGE:` footer:

```
feat(api)!: remove deprecated endpoints

BREAKING CHANGE: The /v1/users endpoint has been removed. Use /v2/users instead.
```

#### Scope (Optional)

Use scope to indicate the affected component:

```
feat(search): add hybrid scoring mode
fix(ingestion): handle empty documents
refactor(api): simplify error handling
```

#### Examples

**Simple commit:**
```
feat: add BM25 keyword scoring
```

**Commit with scope:**
```
fix(search): handle null query parameters
```

**Commit with body:**
```
feat(fusion): implement reciprocal rank fusion

Combines vector similarity and BM25 scores using RRF algorithm.
Uses k=60 constant for score normalization.

Refs: #123
```

**Commit with footer referencing work package:**
```
refactor(scoring): extract score normalization utilities

Move normalization logic to dedicated module for reuse
across different scoring strategies.

WP: Hybrid Search Implementation (Task 2)
```

### 5.6 Task Completion Checklist

- [ ] Implementation matches plan
- [ ] Unit tests written (100% of new code)
- [ ] ✅ All unit tests passing
- [ ] ✅ All integration tests passing
- [ ] ✅ All e2e tests passing
- [ ] Build succeeds
- [ ] Documentation comments on public APIs
- [ ] Committed with clear message
- [ ] TODO marked as `completed`
- [ ] Assumptions documented and reported to user
- [ ] 🛑 **User confirmed assumptions or corrections applied**
- [ ] Assumptions and outcomes recorded in `04-assumptions-log.md`

**⚠️ Do NOT mark a task complete if any tests are failing.**

### 5.7 🛑 Task Progress & Assumption Review Checkpoint

After each task, **STOP and report progress AND assumptions:**

```markdown
## ✅ Task N Complete

**What was done:**
- [Summary of implementation]
- [Key decisions made]

**Files changed:**
- `src/path/to/module` - [Description]
- `tests/...` - [X tests]

**Test Results:**
- ✅ Unit tests: X/X passing (including Y new tests)
- ✅ Integration tests: X/X passing
- ✅ E2E tests: X/X passing
- ✅ Build successful

**Committed:** `abc123` - "feat: [message]"

---

### 🔍 Assumptions Made

**⚠️ The following assumptions were made during implementation. Please review and confirm or correct before proceeding.**

#### Design Decisions

| Decision | Assumption Made | Alternatives Considered |
|----------|-----------------|------------------------|
| [e.g., Error handling] | [e.g., Return Result<T> instead of panicking] | [e.g., Could use Option<T>, could panic] |
| [e.g., Data structure] | [e.g., Used HashMap for O(1) lookup] | [e.g., Could use Vec with linear search] |

#### Behavioral Assumptions

- **[Category]:** [Assumption] — [Rationale]
- **[Category]:** [Assumption] — [Rationale]

*Examples:*
- **Default value:** Empty string used when field is missing — assumed this matches existing behavior
- **Edge case:** Silently ignores duplicate entries — unclear if duplicates should error
- **Ordering:** Results returned in insertion order — no explicit requirement specified

#### Open Questions

1. [Any uncertainties that emerged during implementation]
2. [Decisions that could benefit from clarification]

#### Scope Decisions

- **Included:** [What was intentionally added beyond minimum]
- **Deferred:** [What was intentionally left for later]
- **Excluded:** [What was explicitly not done and why]

---
**Progress:** Task N of M complete (X% done)
**Next:** Task N+1 - [Name] (~Y min)

**Please review assumptions above.**
- ✅ Confirm assumptions are acceptable, OR
- 🔄 Provide corrections before continuing

**Continue to Task N+1?**
```

**⚠️ If any tests are failing, do NOT proceed to the next task. Fix failures first.**

**⚠️ Do NOT proceed until user has reviewed and confirmed assumptions.** If assumptions are incorrect, make necessary adjustments before moving on.

### 5.8 Updating the Assumptions Log

**After the user responds to the checkpoint**, update `04-assumptions-log.md`:

```markdown
## Task N: [Task Name]

**Date:** YYYY-MM-DD

### Assumptions Surfaced

| ID | Category | Assumption | Rationale |
|----|----------|------------|-----------|
| N.1 | [Category] | [Assumption made] | [Why this seemed reasonable] |
| N.2 | [Category] | [Assumption made] | [Why this seemed reasonable] |

### User Response

**Status:** ✅ Confirmed | 🔄 Corrected | ⏸️ Deferred

**Feedback:**
- [User's response to each assumption]

### Outcome

| ID | Original Assumption | Outcome | Changes Made |
|----|---------------------|---------|--------------|
| N.1 | [Assumption] | ✅ Confirmed | None required |
| N.2 | [Assumption] | 🔄 Corrected | [Description of changes] |

### Lessons Learned

- [Any insights for future tasks]
```

📄 **Reference:** See the [Assumptions Guide](assumptions-guide.md) for the log template.

### 5.9 Verify Architectural Significance

**After all tasks are complete**, verify whether the implementation warrants an ADR before creating one.

**Rationale:** Not all work packages require ADRs. ADRs should document architecturally significant decisions—those that are difficult to reverse, affect system-wide quality attributes, or establish precedents for future decisions.

#### Architectural Significance Checklist

Use this checklist to determine if the work package warrants an ADR:

| Criterion | Check |
|-----------|-------|
| Affects multiple components? | ☐ |
| Involves quality attribute trade-offs? | ☐ |
| Establishes a pattern others will follow? | ☐ |
| Would be costly to reverse? | ☐ |
| Future developers need to understand why? | ☐ |
| Changes core abstractions or data models? | ☐ |

**Threshold:** If **3 or more** criteria are checked, create an ADR.

#### Quick Decision Guide

| Work Package Type | ADR Required? |
|-------------------|---------------|
| Major new feature with new capabilities | ✅ Yes |
| Architectural change affecting multiple components | ✅ Yes |
| New pattern, library, or framework introduction | ✅ Yes |
| Changes to core abstractions or data models | ✅ Yes |
| Bug fix (even complex multi-file) | ❌ No |
| Refactoring (internal improvements) | ❌ No |
| Minor feature (small enhancement, UI tweak) | ❌ No |
| Performance optimization (unless architectural) | ❌ No |
| Documentation update | ❌ No |

#### 🛑 Architectural Significance Checkpoint

After completing all tasks, **STOP and present the significance assessment:**

```markdown
## 🏛️ Architectural Significance Assessment

**Work Package:** [Name]

### Checklist Results

| Criterion | Result | Evidence |
|-----------|--------|----------|
| Affects multiple components? | [✅/❌] | [Brief evidence] |
| Involves quality attribute trade-offs? | [✅/❌] | [Brief evidence] |
| Establishes a pattern others will follow? | [✅/❌] | [Brief evidence] |
| Would be costly to reverse? | [✅/❌] | [Brief evidence] |
| Future developers need to understand why? | [✅/❌] | [Brief evidence] |
| Changes core abstractions or data models? | [✅/❌] | [Brief evidence] |

**Criteria Met:** X of 6
**Threshold:** 3 or more → Create ADR

### Recommendation

[✅ Create ADR | ❌ Skip ADR] because [brief rationale].

---
**Do you agree with this assessment? Should I [create/skip] the ADR?**
```

### 5.10 Create ADR (If Architecturally Significant)

**If the significance assessment indicates an ADR is warranted**, create one to document the architectural decisions made during implementation.

**Rationale:** Architectural decisions are not finalized until implementation is complete. Constraints encountered during implementation often require design changes. Creating the ADR after implementation ensures it captures the *actual* architecture, not the *planned* architecture.

#### ⚠️ CRITICAL: Never Modify Historical ADRs

**ADRs are immutable historical records.** They document the design decision *at the time it was made*.

- **NEVER modify existing ADRs** to reflect later changes
- **DO NOT update examples** in old ADRs when code changes
- If a decision is superseded, create a **new ADR** that references and supersedes the old one
- The new ADR's "Context" section should explain why the previous decision changed

**Rationale:** ADRs serve as an audit trail. Future developers need to understand what was decided and why, including decisions that were later changed. Modifying historical ADRs destroys this valuable context.

#### ADR Creation Steps

**Steps:**

1. Create ADR file: `docs/decisions/adr-work-package-name.md`
2. Set status to **Accepted** (since implementation is complete)
3. Document the actual architectural decisions made during implementation
4. Include **Consequences** section (positive, negative, neutral)
5. Commit with message: `docs(adr): add ADR for [work package name]`

📄 **Reference:** Follow the [ADR Creation Guide](adr-creation-guide.md) for full template, architectural significance criteria, and guidelines.

#### 🛑 ADR Checkpoint

After creating the ADR, **STOP and confirm with user:**

```markdown
## 📋 ADR Created

**ADR:** `docs/decisions/adr-work-package-name.md`
**Status:** Accepted

**Key Decisions Documented:**
1. [Decision 1] - [Brief rationale]
2. [Decision 2] - [Brief rationale]

**Alternatives Considered:**
- [Alternative 1] - [Why not chosen]

**Consequences:**
- Positive: [Key benefit]
- Negative: [Key trade-off accepted]

---
**Does this ADR accurately capture the architectural decisions made?**
```

---

## Phase 6: Testing & Validation

### 6.1 Continuous Testing

**After each task:**

```bash
# Run tests for current component
#    Rust:       cargo test module_name
#    TypeScript: npm test -- path/to/test
#    Python:     pytest path/to/test.py

# Run full test suite
#    Rust:       cargo test
#    TypeScript: npm test
#    Python:     pytest

# Verify build
#    Rust:       cargo build
#    TypeScript: npm run build
```

**If tests fail:** Fix immediately before moving on.

### 6.2 Test Levels

**⚠️ CRITICAL: ALL existing tests must pass before a work package is considered complete.**

This includes unit tests, integration tests, and e2e tests—regardless of whether the work package modified the code they cover.

#### Unit Tests (Always Required)

**Location:**
- Rust: `src/module/tests.rs` or `tests/module_test.rs`
- TypeScript: `src/**/__tests__/component.test.ts`
- Python: `tests/test_component.py`

**Coverage:** 100% of new code

**Categories to cover:**
- ✅ Normal/happy path
- ✅ Edge cases (empty, null/None, boundary values)
- ✅ Error conditions

#### Integration Tests (Required to Pass)

Test multiple components working together with real dependencies.

**Requirement:** All existing integration tests MUST pass. If the work package adds new integration points, add corresponding integration tests.

#### E2E Tests (Required to Pass)

Test complete workflows and validate end-to-end behavior.

**Requirement:** All existing e2e tests MUST pass. If the work package affects user-facing workflows, add or update e2e tests.

#### Performance Tests (If Applicable)

Validate performance targets when the work package has performance criteria.

### 6.3 Final Validation

**⚠️ MANDATORY: All tests must pass before creating a PR.**

Before creating PR, run the complete test suite:

```bash
# TypeScript/Node.js
npm test                    # All unit tests
npm run test:integration    # All integration tests (if available)
npm run test:e2e            # All e2e tests (if available)
npm run build               # Build verification
npm run lint                # Linter check

# Rust
cargo test                  # All tests (unit + integration)
cargo build                 # Build verification
cargo clippy                # Linter check

# Python
pytest                      # All tests
pytest tests/integration    # Integration tests
pytest tests/e2e            # E2E tests
```

**If ANY test fails:** Fix the issue before proceeding. Do NOT create a PR with failing tests.

### 6.4 Validation Checklist

**All items are REQUIRED for work package completion:**

- [ ] ✅ All unit tests pass (100% pass rate)
- [ ] ✅ All integration tests pass (100% pass rate)
- [ ] ✅ All e2e tests pass (100% pass rate)
- [ ] ✅ Build succeeds with no errors
- [ ] ✅ No new linter errors
- [ ] Performance targets met (if work package has performance criteria)
- [ ] All TODOs completed

**Test Failure Policy:**
- A work package is NOT complete if any test fails
- Fix failing tests before moving to documentation or PR creation
- If a test failure is unrelated to your changes, investigate and document the issue

---

## Phase 7: Finalize

> **Note:** This phase focuses on finalizing documentation after implementation is complete.

### 7.1 Update ADR Status (If Applicable)

**Skip this step if no ADR was created** (i.e., for bug fixes, refactoring, or minor features).

If an ADR was created in Phase 5, verify its status is **Accepted**:

```markdown
## Status

Accepted
```

Commit this change:

```bash
git commit -m "docs(adr): update ADR status to Accepted"
```

### 7.2 Finalize Test Plan

If a placeholder test plan was created in Phase 4, update it with implementation details:

**Steps:**

1. Add hyperlinks to Test IDs pointing to actual test locations (`#L<line>`)
2. Add hyperlinked symbols in the Overview section
3. Expand the table with Steps and Expected Result columns
4. Add verified Running Tests commands

📄 **Reference:** Use the **Final Test Plan Template** from the [Test Plan Creation Guide](test-plan-creation-guide.md).

Commit with the ADR update or separately:

```bash
git commit -m "docs: finalize test plan with source links"
```

### 7.3 Work Package Completion Document

**Create:** `.engineering/artifacts/planning/YYYY-MM-DD-work-package-name/COMPLETE.md`

📄 **Reference:** Follow the [Work Package Completion Template](complete-template.md) for the full template and guidelines.

### 7.4 Inline Documentation

Ensure documentation on all public APIs:

**Rust:**
```rust
/// Brief description.
///
/// # Arguments
/// * `param` - Description
///
/// # Returns
/// Description
pub fn function(param: Type) -> Result { ... }
```

**TypeScript:**
```typescript
/**
 * Brief description.
 * @param param - Description
 * @returns Description
 */
export function fn(param: Type): Result { ... }
```

---

## Phase 8: Update PR

> **Note:** The PR was created in Phase 1. This phase updates the PR description with final implementation details.

### 8.1 Pre-Finalization Verification

```bash
git branch --show-current    # On feature branch?
git status                   # Clean working directory?
git log origin/main..HEAD    # Review all commits
# Build and tests pass?
```

### 8.2 Push Final Changes

Ensure all commits are pushed:

```bash
git push origin type/work-package-name
```

### 8.3 Update PR Description

Update the PR description to reflect the completed implementation.

📄 **Reference:** Follow the [PR Description Guide](pr-description-guide.md) for the full template and section guidelines.

> **Important:** If an ADR exists, link to it on the *feature branch*, not main. Use the format:
> `https://github.com/OWNER/REPO/blob/BRANCH-NAME/docs/decisions/adr-name.md`
>
> Example: `**ADR:** [adr-work-package-name](https://github.com/{REPO_OWNER}/{REPO_NAME}/blob/feat/work-package-name/docs/decisions/adr-work-package-name.md)`
>
> Relative links like `docs/decisions/adr-name.md` resolve to main, which won't contain the ADR until the PR is merged.

**Updating the PR Description:**

Use the GitHub API directly instead of `gh pr edit` (which may fail due to GraphQL issues with Projects):

```bash
# Write the PR body to a file
cat > /tmp/pr-body.md << 'EOF'
[PR description content here]
EOF

# Update using GitHub API
gh api repos/OWNER/REPO/pulls/PR_NUMBER -X PATCH -f body="$(cat /tmp/pr-body.md)"
```

### 8.4 Mark PR Ready for Review

**Convert draft PR to ready for review:**

```bash
# Mark PR as ready for review
gh pr ready
```

### 8.5 🛑 PR Update Checkpoint

Before marking PR ready for review, **present to user:**

```markdown
## 📝 PR Ready for Review

**PR:** #[number]
**Title:** `type: Work Package Name`

**Updated Description:**
[Show the updated PR description]

---
**Ready to mark PR as ready for review?**
```

### 8.6 After PR Updated

Update WP-COMPLETE.md with final PR number and status.

---

## Phase 9: Post-Implementation

### 9.1 After PR Merged

Update work package plan status:
```markdown
**Status:** ✅ COMPLETED
**PR:** #42
**Merged:** [Date]
```

### 9.2 Select Next Work Package

- Review priority list
- Check dependencies
- Repeat this workflow

---

## Summary Checklist

### Issue Verification & PR Creation (Phase 1)
- [ ] Checked for existing GitHub/Jira issue
- [ ] 🛑 **Asked user if no issue found**
- [ ] Issue created if needed (see [Issue Creation Guide](issue-creation-guide.md))
- [ ] 🛑 **Issue confirmed with user**
- [ ] Feature branch created with correct naming
- [ ] Changelog added to `changes/changed/`
- [ ] Draft PR created linking to issue
- [ ] 🛑 **PR confirmed and elicitation decision obtained from user**

### Requirements Elicitation (Phase 2 - If Requested)
- [ ] User confirmed elicitation is needed (Phase 1.8 checkpoint)
- [ ] Problem explored through conversation
- [ ] Stakeholders and context identified
- [ ] Scope boundaries defined (in/out lists)
- [ ] Success criteria established
- [ ] 🛑 **Requirements confirmed with user**
- [ ] `00-requirements-elicitation.md` created
- [ ] 🛑 **Research decision obtained from user** (Phase 2.7 checkpoint)

### Research (Phase 3 - If Requested)
- [ ] User confirmed research is needed (Phase 2.7 checkpoint)
- [ ] `get_guidance` called at start of KB research session (MANDATORY)
- [ ] Knowledge base researched → `02-kb-research.md`
- [ ] Knowledge insights confirmed 🛑
- [ ] Web research completed (best practices, libraries, examples)
- [ ] Web research findings confirmed 🛑
- [ ] Current implementation analyzed → `03-implementation-analysis.md`
- [ ] Baseline metrics established
- [ ] Analysis findings confirmed 🛑

### Plan & Prepare (Phase 4)
- [ ] Design framework applied
- [ ] Approach designed with alternatives
- [ ] Approach confirmed 🛑
- [ ] Tasks broken down with estimates
- [ ] Success criteria defined
- [ ] Plan documents created
- [ ] Feature branch synced with main
- [ ] Verified on feature branch (not main/master) 🛑
- [ ] Test plan created (if applicable)
- [ ] PR description updated with plan summary
- [ ] TODOs created
- [ ] Ready to implement confirmed 🛑

### Implementation (Phase 5)
- [ ] `04-assumptions-log.md` created before Task 1
- [ ] Tasks completed with progress reports 🛑
- [ ] Assumptions documented and reviewed with user after each task 🛑
- [ ] Assumptions and outcomes recorded in `04-assumptions-log.md` after each task
- [ ] ✅ All unit tests passing (100% pass rate)
- [ ] ✅ All integration tests passing (100% pass rate)
- [ ] ✅ All e2e tests passing (100% pass rate)
- [ ] Build succeeds
- [ ] All TODOs completed
- [ ] Architectural significance verified 🛑
- [ ] ADR created (if architecturally significant; status: Accepted) 🛑

### Finalize (Phase 7)
- [ ] ADR verified (if exists)
- [ ] Test plan finalized with source links (if applicable)
- [ ] COMPLETE.md written (see [Completion Template](complete-template.md))
- [ ] Inline docs complete

### Update PR (Phase 8)
- [ ] All changes pushed
- [ ] PR description updated with implementation details 🛑
- [ ] Draft PR marked ready for review
- [ ] Docs updated with PR number

---

## Anti-Patterns to Avoid

| Don't | Why |
|-------|-----|
| Skip issue verification | No traceability, unclear requirements, stakeholders can't track (see [Issue Creation Guide](issue-creation-guide.md)) |
| Prescribe solutions in issues | Issues define problems, not implementations; constrains design options. **Never include "Solution", "Implementation Approach", algorithms, or code locations in issues.** |
| Skip elicitation without asking user | User should decide if elicitation is needed; assumptions compound into wrong implementation |
| Skip research without asking user | User should decide if research is needed; may miss patterns, best practices, or baseline analysis |
| Accept vague requirements | Hidden ambiguity becomes hidden assumptions |
| Mix requirements and solutions | Constrains design options; keep "what" separate from "how" |
| Skip scope boundaries | Leads to scope creep; always define in/out lists |
| Implement on main/master | Pollutes main branch, no PR review, risky deploys |
| Skip branch creation | Same as above; always create dedicated feature branch |
| Skip ADR creation (major features) | For major features, ADR documents final architecture after implementation; captures actual decisions made |
| Delay PR creation | PR should be created in Phase 1 with initial changelog; establishes work package immediately |
| Create non-draft PR | PRs must start as drafts to signal work-in-progress status |
| Skip PR assignment | PRs must be assigned to m2ux for tracking |
| Use relative ADR links in PR | Relative links resolve to main; use branch-specific URLs (when ADR exists) |
| Skip testing | "I'll add tests later" never happens |
| Complete WP with failing tests | ALL tests (unit, integration, e2e) must pass—no exceptions |
| Ignore unrelated test failures | Investigate first; they may indicate breaking changes |
| Monolithic commits | Can't track issues, hard to review/revert |
| Poor commit messages | No context for future maintainers |
| Skip architectural significance check | Creates unnecessary ADRs for trivial changes or misses ADRs for significant ones |
| Skip ADR for architecturally significant decisions | Decision rationale lost forever (see [ADR Creation Guide](adr-creation-guide.md)) |
| Modify historical ADRs | ADRs are immutable historical records; create new ADR if decision changes |
| Skip test plan | No traceability from docs to tests (see [Test Plan Creation Guide](test-plan-creation-guide.md)) |
| Skip validation | Broken code gets merged |
| Multiple WPs at once | Mixed commits, confusing PRs |
| Skip planning | Scope creep, wasted effort |
| Skip checkpoints | Assumptions lead to wrong implementation |
| Skip assumption review | Hidden design decisions compound errors; user loses opportunity to correct course early |
| Skip KB research | Missing applicable patterns and practices (see [KB Research Guide](knowledge-base-research-guide.md)) |
| Skip `get_guidance` at session start | Inefficient searching, wrong tool selection, excessive tool calls |
| Narrate search process | Users want synthesized answers with citations, not play-by-play of searches |
| Skip analysis | No baseline, can't measure success, miss opportunities (see [Implementation Analysis Guide](implementation-analysis-guide.md)) |

---

## Language Reference

| Action | Rust | TypeScript | Python |
|--------|------|------------|--------|
| Test | `cargo test` | `npm test` | `pytest` |
| Build | `cargo build` | `npm run build` | `py_compile` |
| Lint | `cargo clippy` | `npm run lint` | `ruff`/`flake8` |
| Bench | `cargo bench` | `npm run benchmark` | `pytest --benchmark` |
| Coverage | `cargo tarpaulin` | `npm test --coverage` | `pytest --cov` |
