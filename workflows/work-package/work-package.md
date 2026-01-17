# Work Package Implementation Workflow
## Overview

This workflow defines how to plan and implement ONE work package from inception to merged PR. A **work package** is a discrete unit of work such as a feature, bug-fix, enhancement, refactoring, or any other deliverable change.

**For multiple related work packages:** Use the [Work Packages Workflow](work-packages.md) to create a roadmap first.

---

## Workflow
### Rules
- **Agents must NOT proceed past checkpoints without user confirmation**.
- **Ask, don't assume** - Clarify requirements before acting
- **Summarize, then proceed** - Provide brief status before asking to continue
- **One task at a time** - Complete current work before starting new work
- **Explicit approval** - Get clear "yes" or "proceed" before major actions
- **Decision points require user choice** - When issues are found, user decides whether to proceed or loop back

### Notation
- 🛑 **CHECKPOINT** — Requires user confirmation before proceeding
- 🔀 **DECISION POINT** — User chooses path based on findings (proceed or loop back)

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
   └─ Create 00-requirements-elicitation.md

3. IMPLEMENTATION ANALYSIS (10-20m) [Always]
   ├─ Complete analysis per Implementation Analysis Guide
   ├─ Create 01-implementation-analysis.md
   └─ 🛑 CHECKPOINT: "Would you like to perform research?"

4. RESEARCH (20-45m) [If requested]
   ├─ Complete research per Knowledge Base Research Guide
   ├─ 🛑 CHECKPOINT: "Knowledge insights confirmed?"
   └─ 🛑 CHECKPOINT: "Web research findings confirmed?"

5. PLAN & PREPARE (20-45m)
   ├─ Complete planning per guides (design framework, plan, test plan)
   ├─ 🛑 CHECKPOINT: "Approach confirmed?"
   ├─ Prepare for implementation (sync branch, PR, TODOs)
   └─ 🛑 CHECKPOINT: "Ready to implement?"

6. IMPLEMENT TASKS (varies)
   ├─ 🛑 VERIFY: On feature branch before any code changes
   ├─ For each task: implement → test → commit → assumptions
   ├─ 🛑 CHECKPOINT: "Task N complete. Assumptions confirmed?"
   ├─ After all tasks: code review per guide
   ├─ 🛑 CHECKPOINT: "Review findings confirmed?"
   ├─ Architectural significance check per guide
   ├─ 🛑 CHECKPOINT: "Significance assessment confirmed?"
   └─ ADR (if significant) 🛑 "ADR confirmed?"

7. VERIFY & VALIDATE DESIGN (30-60m)
   ├─ All tests pass, build succeeds (per Test Plan Guide)
   └─ 🔀 DECISION: Pass → Phase 8 | Minor change → Phase 6 | Major change → Phase 5

8. STRATEGIC REVIEW (15-30m)
   ├─ Complete review per Strategic Review Guide
   ├─ 🛑 CHECKPOINT: "Review findings confirmed?"
   └─ 🔀 DECISION: Pass → Phase 9 | Issues → Phase 5

9. FINALIZE (15-30m)
   └─ Complete finalization tasks per guides (ADR, test plan, COMPLETE.md)

10. UPDATE PR (10-15m)
    ├─ Update PR per PR Description Guide
    ├─ 🛑 CHECKPOINT: "PR description confirmed?"
    └─ Mark PR ready for review

11. POST-IMPLEMENTATION
    └─ Complete post-implementation tasks per Workflow Retrospective Guide
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
1. **Provide existing issue** - Share the issue number or URL (GitHub #N or Jira PROJ-N)
2. **Create GitHub issue** - I'll help draft one using the GitHub Issue Creation Guide
3. **Create Jira issue** - I'll help draft one using the Jira Issue Creation Guide (Atlassian MCP)
4. **Skip issue** - Proceed without (not recommended for non-trivial work)

---
**Which option would you like?**
```

#### Jira Confirmation (If Option 3 Selected)

If the user selects Jira issue creation, **confirm the target organization:**

```markdown
## ⚠️ Jira Issue Creation Confirmation

Creating a Jira issue will use the **Atlassian MCP server** configured for this environment.

**This will create a real ticket** in your organization's Jira instance.

Before proceeding, please confirm:
- You have the necessary permissions to create issues
- You want to create a ticket in this organization's Jira

**Proceed with Jira issue creation?** (yes/no)
```

### 1.3 Creating a New Issue

Choose the appropriate guide based on where the issue will be tracked:

| Platform | Guide | When to Use |
|----------|-------|-------------|
| **GitHub** | [GitHub Issue Creation Guide](github-issue-creation.guide.md) | GitHub-hosted projects, open source |
| **Jira** | [Jira Issue Creation Guide](jira-issue-creation.guide.md) | Enterprise projects, Atlassian ecosystem |

> **Key Principle (both platforms):** Issues define *problems*, not solutions. Focus on what's broken/missing and why it matters.

**Issue Creation Process:**

```
┌─────────────────────────────────────┐
│ 1. Select Platform                  │
│    - GitHub or Jira?                │
│    - Follow appropriate guide       │
└────────────┬────────────────────────┘
             │
┌────────────▼────────────────────────┐
│ 2. Draft Problem Statement          │
│    - What's broken/missing?         │
│    - Current vs desired state       │
└────────────┬────────────────────────┘
             │
┌────────────▼────────────────────────┐
│ 3. Define Scope & User Stories      │
│    - In/out scope items             │
│    - Acceptance criteria            │
└────────────┬────────────────────────┘
             │
┌────────────▼────────────────────────┐
│ 🛑 CHECKPOINT: Review with User     │
└────────────┬────────────────────────┘
             │
┌────────────▼────────────────────────┐
│ 4. Create Issue                     │
│    - GitHub: gh CLI or API          │
│    - Jira: Atlassian MCP tools      │
└─────────────────────────────────────┘
```

#### GitHub Issue Creation

```bash
# Write issue body to temp file
cat > /tmp/issue-body.md << 'EOF'
[Issue content following GitHub Issue Creation Guide template]
EOF

# Create issue using GitHub CLI
gh issue create --title "Issue Title" --body "$(cat /tmp/issue-body.md)"

# Or using API (preferred for complex content)
gh api repos/OWNER/REPO/issues -X POST \
  -f title="Issue Title" \
  -f body="$(cat /tmp/issue-body.md)"
```

#### Jira Issue Creation

Use Atlassian MCP tools (see [Jira Issue Creation Guide](jira-issue-creation.guide.md) for full workflow):

```
1. mcp_atlassian_getAccessibleAtlassianResources → cloudId
2. mcp_atlassian_getVisibleJiraProjects → projectKey (🛑 ask user)
3. mcp_atlassian_createJiraIssue → issue created
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
- [ ] Issue created (if needed) following [Issue Creation Guide](github-issue-creation.guide.md)
- [ ] 🛑 **Issue confirmed with user**
- [ ] Feature branch created with correct naming
- [ ] Changelog added to `changes/changed/`
- [ ] Draft PR created linking to issue
- [ ] 🛑 **PR confirmed and elicitation decision obtained from user**

---

## Phase 2: Requirements Elicitation

**Discover and clarify what the work package should accomplish through structured conversation.** This phase ensures requirements are explicitly captured before planning the approach.

> **Note:** The user decides whether elicitation is needed at the Phase 1.8 checkpoint. If skipping, proceed directly to Phase 3 (Implementation Analysis). The issue from Phase 1 serves as the requirements source.

### 2.1 Elicitation Process

📄 **Reference:** Follow the [Requirements Elicitation Guide](requirements-elicitation.guide.md) for the full methodology, question bank, and templates.

**Process overview:**
1. Explore problem through sequential conversation (one question at a time)
2. Identify stakeholders and context
3. Define scope boundaries (in/out lists)
4. Establish success criteria
5. Confirm with user at checkpoint

**Output:** `.engineering/artifacts/planning/YYYY-MM-DD-work-package-name/00-requirements-elicitation.md`

### 2.2 🛑 Requirements Elicitation Checkpoint

After exploring requirements, **STOP and confirm with user** using the checkpoint template from the guide.

### 2.3 Requirements Elicitation Checklist

- [ ] User confirmed elicitation is needed (Phase 1.8 checkpoint)
- [ ] Problem explored through conversation
- [ ] Stakeholders and context identified
- [ ] Scope boundaries defined (in/out lists)
- [ ] Success criteria established
- [ ] 🛑 **Requirements confirmed with user**
- [ ] `00-requirements-elicitation.md` created

---

## Phase 3: Implementation Analysis

**Analyze the current implementation** to understand effectiveness, establish baselines, and identify opportunities for improvement. This phase always occurs to ensure the planning phase has necessary context.

> **Note:** If requirements were elicited in Phase 2, use them as context for analysis. If elicitation was skipped, use the issue from Phase 1 as context.

📄 **Reference:** Follow the [Implementation Analysis Guide](implementation-analysis.guide.md) for the full methodology, analysis criteria, and checkpoint templates.

**Output:** `.engineering/artifacts/planning/YYYY-MM-DD-work-package-name/01-implementation-analysis.md`

### 3.1 🛑 Research Decision Checkpoint

After completing implementation analysis, **present findings and ask about research** using the checkpoint template from the guide.

### 3.2 Implementation Analysis Checklist

- [ ] Implementation analysis completed per guide
- [ ] `01-implementation-analysis.md` created
- [ ] 🛑 **Research decision obtained from user**

---

## Phase 4: Research

**Research the knowledge base and external sources** to discover best practices, patterns, and resources to inform the planning phase.

> **Note:** The user decides whether research is needed at the Phase 3 checkpoint. If skipping, proceed directly to Phase 5.

📄 **Reference:** Follow the [Knowledge Base Research Guide](knowledge-base-research.guide.md) for the full methodology, tool usage, and checkpoint templates.

**⚠️ MANDATORY:** Call `get_guidance` before making other concept-rag MCP tool calls.

**Output:** `.engineering/artifacts/planning/YYYY-MM-DD-work-package-name/02-kb-research.md`

### 4.1 🛑 Knowledge Base Insights Checkpoint

After researching the knowledge base, **present findings to user** using the checkpoint template from the guide.

### 4.2 🛑 Web Research Checkpoint

After web research, **present findings to user** using the checkpoint template from the guide.

### 4.3 Research Checklist

- [ ] User confirmed research is needed (Phase 3 checkpoint)
- [ ] `get_guidance` called at start of KB research session (MANDATORY)
- [ ] Knowledge base research completed per guide → `02-kb-research.md`
- [ ] 🛑 **Knowledge insights confirmed with user**
- [ ] Web research completed per guide
- [ ] 🛑 **Web research findings confirmed with user**

---

## Phase 5: Plan & Prepare

**Design the approach, create the work package plan, and prepare for implementation.** This phase produces the planning documents and ensures everything is ready before coding begins.

> **Note:** The feature branch and draft PR were created in Phase 1.

📄 **References:**
- [Design Framework Guide](design-framework.guide.md) — Problem-solving methodology
- [Work Package Plan Guide](plan.guide.md) — Plan template and guidelines
- [Test Plan Guide](test-plan.guide.md) — Test plan templates
- [PR Description Guide](pr-description.guide.md) — PR template

**Output:** `.engineering/artifacts/planning/YYYY-MM-DD-work-package-name/` folder with planning documents

### 5.1 Planning Documents

Create the work package plan folder with required documents:

| Document | Guide | Required? |
|----------|-------|-----------|
| `START-HERE.md` | [start-here.guide.md](start-here.guide.md) | Yes |
| `README.md` | [readme.guide.md](readme.guide.md) | Yes |
| `03-work-package-plan.md` | [plan.guide.md](plan.guide.md) | Yes |
| `00-requirements-elicitation.md` | [requirements-elicitation.guide.md](requirements-elicitation.guide.md) | If Phase 2 |
| `02-kb-research.md` | [knowledge-base-research.guide.md](knowledge-base-research.guide.md) | If Phase 4 |
| `01-implementation-analysis.md` | [implementation-analysis.guide.md](implementation-analysis.guide.md) | Recommended |

### 5.2 🛑 Approach Checkpoint

After designing the approach, **present to user** using the checkpoint template from the [Plan Guide](plan.guide.md).

### 5.3 Prepare for Implementation

Before starting implementation:
- Sync feature branch with main
- Verify on correct feature branch (not main/master)
- Create test plan (if applicable) per [Test Plan Guide](test-plan.guide.md)
- Update PR description per [PR Description Guide](pr-description.guide.md)
- Create TODO list from plan

### 5.4 🛑 Ready to Implement Checkpoint

Before starting implementation, **present the plan summary to user** using the checkpoint template from the [Plan Guide](plan.guide.md).

### 5.5 Plan & Prepare Checklist

- [ ] Design framework applied per guide
- [ ] Approach designed and 🛑 **confirmed with user**
- [ ] Work package plan folder created with required documents
- [ ] Feature branch synced with main
- [ ] On correct feature branch (not main/master)
- [ ] Test plan created (if applicable)
- [ ] PR description updated
- [ ] TODOs created from plan
- [ ] 🛑 **Ready to implement confirmed with user**

---

## Phase 6: Implement Tasks

**Execute the implementation plan task by task.** Each task follows a cycle of implement → test → commit → review assumptions → checkpoint.

> ⚠️ **Before writing any code, verify you're on the correct feature branch (not main/master).**

📄 **References:**
- [Assumptions Guide](assumptions-review.guide.md) — Assumption review process, checkpoint templates, log format
- [Task Completion Review Guide](task-completion-review.guide.md) — Code review methodology and templates
- [Architecture Review Guide](architecture-review.guide.md) — Architectural significance criteria, ADR templates

### 6.1 Task Implementation Cycle

For each task: implement → test → commit → review assumptions → checkpoint with user.

After all tasks complete: code review → architectural significance check → create ADR (if significant).

📄 **Reference:** See guides above for detailed methodology and checkpoint templates.

### 6.2 🛑 Task Progress Checkpoint

After each task, **report progress and assumptions to user** using the checkpoint template from the [Assumptions Guide](assumptions-review.guide.md).

⚠️ **Do NOT proceed until user has reviewed and confirmed assumptions.**

### 6.3 🛑 Code Review Checkpoint

After all tasks complete, **perform code review and present findings to user** using the checkpoint template from the [Task Completion Review Guide](task-completion-review.guide.md).

### 6.4 🛑 Architectural Significance Checkpoint

After code review, **assess architectural significance and present to user** using the criteria and checkpoint template from the [Architecture Review Guide](architecture-review.guide.md).

### 6.5 🛑 ADR Checkpoint (If Significant)

If creating an ADR, **present to user for confirmation** using the checkpoint template from the [Architecture Review Guide](architecture-review.guide.md).

### 6.6 Implementation Checklist

- [ ] Verified on correct feature branch before starting
- [ ] Tasks implemented per plan with tests
- [ ] 🛑 **Progress and assumptions confirmed with user after each task**
- [ ] Assumptions logged in `05-assumptions-log.md`
- [ ] Code review completed per guide
- [ ] 🛑 **Review findings confirmed with user**
- [ ] Architectural significance assessed per guide
- [ ] 🛑 **Significance assessment confirmed with user**
- [ ] ADR created if significant, 🛑 **confirmed with user**

---

## Phase 7: Verify & Validate Design

**Validate the implementation through comprehensive testing.** All tests must pass before the work package is considered complete.

⚠️ **CRITICAL:** ALL existing tests (unit, integration, e2e) must pass—regardless of whether the work package modified the code they cover.

📄 **Reference:** See the [Test Plan Guide](test-plan.guide.md) for testing methodology, test levels, and language-specific commands.

### 7.1 Validation Requirements

- All unit tests pass (100% pass rate)
- All integration tests pass (100% pass rate)
- All e2e tests pass (100% pass rate)
- Build succeeds with no errors
- No new linter errors
- Performance targets met (if applicable)

### 7.2 🔀 Validation Decision Point

After running validation, **assess results and present decision to user:**

| Outcome | Criteria | Action |
|---------|----------|--------|
| ✅ **Pass** | All tests pass, build succeeds | Proceed to Phase 8 |
| 🔄 **Minor issues** | Isolated test failures, build fixes, localized bugs | Return to Phase 6 to fix specific tasks |
| ⚠️ **Major issues** | Fundamental design problems, cascading failures, architectural flaws | Return to Phase 5 to re-plan approach |

**Present to user:**

```markdown
## 🔀 Validation Decision

**Results:**
- Tests: [X passing / Y failing]
- Build: [Pass/Fail]
- Issues identified: [Summary]

**Assessment:** [Pass | Minor issues | Major issues]

**Recommendation:** [Proceed to Phase 8 | Return to Phase 6 | Return to Phase 5]

**Rationale:** [Why this path is recommended]

---
**Which path should we take?**
1. Proceed to Phase 8 (Strategic Review)
2. Return to Phase 6 (fix specific tasks)
3. Return to Phase 5 (re-plan approach)
```

### 7.3 Validation Checklist

- [ ] All tests pass (unit, integration, e2e)
- [ ] Build succeeds
- [ ] No new linter errors
- [ ] All TODOs completed
- [ ] 🔀 **Decision point: user confirmed path**

---

## Phase 8: Strategic Review

**Review the implementation to ensure changes are minimal and focused.** This phase validates that the final PR contains only the changes required for the solution.

📄 **Reference:** Follow the [Strategic Review Guide](strategic-review.guide.md) for the full methodology, checklist, and checkpoint template.

### 8.1 🛑 Strategic Review Checkpoint

After completing the review, **present findings to user** using the checkpoint template from the guide.

### 8.2 🔀 Strategic Review Decision Point

After presenting review findings, **assess whether issues require re-planning:**

| Outcome | Criteria | Action |
|---------|----------|--------|
| ✅ **Pass** | Changes are minimal and focused; minor cleanup only | Proceed to Phase 9 |
| ⚠️ **Issues found** | Speculative changes reveal flawed approach; significant rework needed | Return to Phase 5 to re-plan |

**Present to user:**

```markdown
## 🔀 Strategic Review Decision

**Findings:**
- Files reviewed: [Count]
- Required changes: [Count]
- Speculative changes identified: [Count]

**Assessment:** [Pass | Issues found]

**Recommendation:** [Proceed to Phase 9 | Return to Phase 5]

**Rationale:** [Why this path is recommended]

---
**Which path should we take?**
1. Proceed to Phase 9 (Finalize)
2. Return to Phase 5 (re-plan approach)
```

### 8.3 Strategic Review Checklist

- [ ] Strategic review completed per guide
- [ ] 🛑 **Review findings confirmed with user**
- [ ] 🔀 **Decision point: user confirmed path**

---

## Phase 9: Finalize

**Finalize documentation after implementation is complete.**

📄 **References:**
- [Test Plan Guide](test-plan.guide.md) — Finalize test plan with source links
- [Work Package Completion Guide](complete.guide.md) — COMPLETE.md template

### 9.1 Finalization Tasks

- Update ADR status to Accepted (if ADR exists)
- Finalize test plan with source links per [Test Plan Guide](test-plan.guide.md)
- Create `COMPLETE.md` per [Completion Guide](complete.guide.md)
- Ensure inline documentation on all public APIs

### 9.2 Finalization Checklist

- [ ] ADR status updated (if applicable)
- [ ] Test plan finalized with source links (if applicable)
- [ ] `COMPLETE.md` created per guide
- [ ] Inline documentation complete

---

## Phase 10: Update PR

**Update the PR with final implementation details and mark ready for review.** The PR was created in Phase 1; this phase updates it with completed work.

📄 **Reference:** Follow the [PR Description Guide](pr-description.guide.md) for the full template and section guidelines.

### 10.1 PR Update Tasks

- Verify on feature branch with clean working directory
- Push all commits
- Update PR description per [PR Description Guide](pr-description.guide.md)
- Mark PR ready for review

### 10.2 🛑 PR Update Checkpoint

Before marking PR ready for review, **present updated description to user** using the checkpoint template from the guide.

### 10.3 Update PR Checklist

- [ ] All changes pushed
- [ ] PR description updated per guide
- [ ] 🛑 **PR description confirmed with user**
- [ ] PR marked ready for review
- [ ] `COMPLETE.md` updated with final PR number

---

## Phase 11: Post-Implementation

**Complete post-implementation tasks after the PR is created.**

📄 **Reference:** Follow the [Workflow Retrospective Guide](workflow-retrospective.guide.md) for retrospective methodology and report template.

### 11.1 Post-Implementation Tasks

- Capture session history (if metadata repository exists) — private, never committed
- Workflow retrospective per [Workflow Retrospective Guide](workflow-retrospective.guide.md) (skip if trivial)
- After PR merged: Update work package plan status
- Select next work package

### 11.2 Post-Implementation Checklist

- [ ] Session history captured (if metadata repo exists)
- [ ] Workflow retrospective completed (if non-trivial session)
- [ ] Status updated after PR merged

---

## Summary Checklist

### Issue Verification & PR Creation (Phase 1)
- [ ] Checked for existing GitHub/Jira issue
- [ ] 🛑 **Asked user if no issue found**
- [ ] Issue created if needed (see [Issue Creation Guide](github-issue-creation.guide.md))
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

### Implementation Analysis (Phase 3 - Always)
- [ ] Implementation analysis completed per guide
- [ ] `01-implementation-analysis.md` created
- [ ] 🛑 **Research decision obtained from user**

### Research (Phase 4 - If Requested)
- [ ] User confirmed research is needed (Phase 3 checkpoint)
- [ ] `get_guidance` called at start of KB research session (MANDATORY)
- [ ] Research completed per guide → `02-kb-research.md`
- [ ] 🛑 **Knowledge insights confirmed with user**
- [ ] 🛑 **Web research findings confirmed with user**

### Plan & Prepare (Phase 5)
- [ ] Planning completed per guides
- [ ] 🛑 **Approach confirmed with user**
- [ ] Work package plan folder created with required documents
- [ ] Feature branch synced with main
- [ ] On correct feature branch (not main/master)
- [ ] Test plan created (if applicable)
- [ ] PR description updated
- [ ] TODOs created from plan
- [ ] 🛑 **Ready to implement confirmed with user**

### Implementation (Phase 6)
- [ ] Tasks implemented per plan with tests
- [ ] 🛑 **Progress and assumptions confirmed with user after each task**
- [ ] Assumptions logged in `05-assumptions-log.md`
- [ ] Code review completed per guide
- [ ] 🛑 **Review findings confirmed with user**
- [ ] Architectural significance assessed per guide
- [ ] 🛑 **Significance assessment confirmed with user**
- [ ] ADR created if significant, 🛑 **confirmed with user**

### Verify & Validate Design (Phase 7)
- [ ] All tests pass (unit, integration, e2e)
- [ ] Build succeeds
- [ ] 🔀 **Decision point: user confirmed path (proceed/fix/re-plan)**

### Strategic Review (Phase 8)
- [ ] Strategic review completed per guide
- [ ] 🛑 **Review findings confirmed with user**
- [ ] 🔀 **Decision point: user confirmed path (proceed/re-plan)**

### Finalize (Phase 9)
- [ ] Finalization tasks completed per guides
- [ ] `COMPLETE.md` created

### Update PR (Phase 10)
- [ ] PR updated per guide
- [ ] 🛑 **PR description confirmed with user**
- [ ] PR marked ready for review

---

## Anti-Patterns to Avoid

| Don't | Why |
|-------|-----|
| Skip issue verification | No traceability, unclear requirements, stakeholders can't track (see [Issue Creation Guide](github-issue-creation.guide.md)) |
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
| Skip ADR for architecturally significant decisions | Decision rationale lost forever (see [Architecture Review Guide](architecture-review.guide.md)) |
| Modify historical ADRs | ADRs are immutable historical records; create new ADR if decision changes |
| Skip test plan | No traceability from docs to tests (see [Test Plan Creation Guide](test-plan.guide.md)) |
| Skip validation | Broken code gets merged |
| Skip strategic review | Speculative/debug code pollutes PR; unnecessary changes confuse reviewers (see [Strategic Review Guide](strategic-review.guide.md)) |
| Multiple WPs at once | Mixed commits, confusing PRs |
| Skip planning | Scope creep, wasted effort |
| Skip checkpoints | Assumptions lead to wrong implementation |
| Ignore decision points | Unresolved issues compound; failing tests or flawed approach persists without structured resolution |
| Proceed past validation failures | Broken code gets merged; decision points exist to enable structured recovery |
| Skip assumption review | Hidden design decisions compound errors; user loses opportunity to correct course early |
| Skip KB research | Missing applicable patterns and practices (see [KB Research Guide](knowledge-base-research.guide.md)) |
| Skip `get_guidance` at session start | Inefficient searching, wrong tool selection, excessive tool calls |
| Narrate search process | Users want synthesized answers with citations, not play-by-play of searches |
| Skip analysis | No baseline, can't measure success, miss opportunities (see [Implementation Analysis Guide](implementation-analysis.guide.md)) |

---

## Language Reference

| Action | Rust | TypeScript | Python |
|--------|------|------------|--------|
| Test | `cargo test` | `npm test` | `pytest` |
| Build | `cargo build` | `npm run build` | `py_compile` |
| Lint | `cargo clippy` | `npm run lint` | `ruff`/`flake8` |
| Bench | `cargo bench` | `npm run benchmark` | `pytest --benchmark` |
| Coverage | `cargo tarpaulin` | `npm test --coverage` | `pytest --cov` |
