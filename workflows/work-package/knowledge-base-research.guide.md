# Knowledge Base Research Guide

**Purpose:** Guidelines for researching the knowledge base during work package planning to discover relevant concepts, design patterns, and best practices.

---

## Overview

Before designing a solution, research the knowledge base using concept-rag MCP tools. This surfaces:
- **Best Practices** - Industry-standard approaches
- **Design Patterns** - Proven solutions applicable to the work package
- **Architectural Choices** - Guidance on system structure
- **Documentation Style** - Conventions for inline docs and ADRs
- **Testing Strategies** - Approaches to testing similar functionality

> **Key Insight:** Informed design decisions come from understanding what patterns and practices already exist in your knowledge base. Skip this step, and you risk reinventing the wheel or missing proven approaches.

---

## When to Apply This Guide

**Always research when:**
- Work package involves architectural decisions
- Multiple implementation approaches are possible
- Domain is unfamiliar or complex
- Performance or reliability requirements exist

**Lightweight research acceptable when:**
- Simple, well-understood change
- Following existing established patterns
- Minor bug fix with clear solution

---

## Research Tools

Use concept-rag MCP tools to query the knowledge base.

### ⚠️ MANDATORY: Call get_guidance First

**At the start of any knowledge base research session, call `get_guidance` before making other concept-rag MCP tool calls.**

The `get_guidance` tool returns research guidelines that ensure:
- **Correct tool selection** - Which tool to use for your specific query type
- **Efficient searching** - Aim for 4-6 tool calls maximum per research session
- **Proper answer synthesis** - How to combine results into coherent findings

> **Note:** Call `get_guidance` once per research session, not before each individual search tool call. The returned guidance applies for the duration of the session.

**Communication rule:** Never narrate your search process to the user. Instead, synthesize answers directly and cite sources. The user wants findings, not a play-by-play of tool calls.

### Available Tools

| Tool | Purpose | When to Use |
|------|---------|-------------|
| `get_guidance` | Get research guidelines | **ALWAYS call first** |
| `broad_chunks_search` | Find content across ALL documents | Start here with work package keywords |
| `concept_search` | Find where concepts are discussed | Track specific concept mentions |
| `catalog_search` | Discover documents about topics | Find authoritative sources |
| `chunks_search` | Search within a known document | Deep dive into identified docs |
| `list_concepts_in_category` | See concepts in a domain | Explore conceptual landscape |

---

## Research Strategy

### Step 0: Get Guidance (MANDATORY)

**Always start by calling `get_guidance`** to receive current research guidelines:

```
Tool: get_guidance
```

This returns tool selection rules, search efficiency tips, and synthesis guidelines specific to the knowledge base. Follow the returned guidance throughout your research session.

### Step 1: Start Broad

Use `broad_chunks_search` with work package keywords:

```
Query: "caching strategy performance optimization"
Query: "error handling retry patterns"
Query: "API versioning backward compatibility"
```

**Goal:** Identify recurring themes and relevant documents.

### Step 2: Identify Key Concepts

From initial results, note:
- Recurring terminology
- Referenced design patterns
- Mentioned best practices
- Cited sources or documents

### Step 3: Find Authoritative Sources

Use `catalog_search` to find documents about identified topics:

```
Query: "distributed systems caching"
Query: "API design guidelines"
```

**Goal:** Locate primary sources for deeper exploration.

### Step 4: Extract Specific Guidance

Use `chunks_search` on identified documents to find:
- Implementation recommendations
- Trade-off discussions
- Warning signs or anti-patterns
- Configuration guidelines

### Step 5: Map to Work Package

Connect findings to requirements:
- Which patterns apply directly?
- What modifications are needed?
- What risks do sources mention?
- What success metrics are suggested?

---

## Research Checklist

- [ ] `get_guidance` called at start of session (MANDATORY, once per session)
- [ ] Followed returned guidance for tool selection throughout session
- [ ] Broad search performed with work package keywords
- [ ] Key concepts identified and noted
- [ ] Relevant documents discovered
- [ ] Specific guidance extracted from sources
- [ ] Findings mapped to work package requirements
- [ ] Applicable patterns identified
- [ ] Best practices documented
- [ ] Risks and anti-patterns noted
- [ ] Answers synthesized with citations (no search narration)

---

## Planning Artifact

Store research findings in a discrete planning document:

**Location:** `.engineering/artifacts/planning/YYYY-MM-DD-work-package-name/02-kb-research.md`

### Template

```markdown
# Knowledge Base Research - [Work Package Name]

**Date:** [Date]
**Work Package:** [Name]
**Status:** [Draft/Complete]

---

## Search Queries Executed

| Query | Tool | Results Summary |
|-------|------|-----------------|
| "[query 1]" | broad_chunks_search | [Brief findings] |
| "[query 2]" | catalog_search | [Documents found] |

---

## Relevant Concepts Discovered

### [Concept 1]
**Source:** [Document name/path]
**Relevance:** [How it applies to work package]
**Key Insight:** [Main takeaway]

### [Concept 2]
**Source:** [Document name/path]
**Relevance:** [How it applies to work package]
**Key Insight:** [Main takeaway]

---

## Applicable Design Patterns

| Pattern | Source | How It Applies | Confidence |
|---------|--------|----------------|------------|
| [Pattern name] | [Document] | [Application to work package] | HIGH/MEDIUM/LOW |
| [Pattern name] | [Document] | [Application to work package] | HIGH/MEDIUM/LOW |

---

## Best Practices Found

### [Practice 1]
**Source:** [Document name/path]
**Description:** [What the practice recommends]
**Application:** [How to apply in this work package]

### [Practice 2]
**Source:** [Document name/path]
**Description:** [What the practice recommends]
**Application:** [How to apply in this work package]

---

## Risks and Anti-Patterns

| Risk/Anti-Pattern | Source | Mitigation |
|-------------------|--------|------------|
| [Issue] | [Document] | [How to avoid] |

---

## Recommended Approach

Based on research findings:

1. **Primary Pattern:** [Pattern to follow]
   - Rationale: [Why this pattern fits]

2. **Key Practices to Apply:**
   - [Practice 1]
   - [Practice 2]

3. **Risks to Monitor:**
   - [Risk 1] - [Mitigation]

---

## Sources Referenced

| Document | Relevance | Key Sections |
|----------|-----------|--------------|
| [Document 1] | [Why relevant] | [Specific sections] |
| [Document 2] | [Why relevant] | [Specific sections] |

---

**Status:** Ready for design phase
```

---

## Checkpoint Template

After completing research, present findings to the user for confirmation:

```markdown
## 📚 Knowledge Base Research Findings

### Relevant Concepts Discovered
- **[Concept 1]:** [Brief description and relevance]
- **[Concept 2]:** [Brief description and relevance]

### Applicable Design Patterns
| Pattern | Source | Applicability |
|---------|--------|---------------|
| [Pattern] | [Document] | [How it applies] |

### Best Practices Found
1. **[Practice]:** [Description] - Source: [Document]

### Recommended Approach Based on Research
- [Key recommendation]

---
**Proceed with this research as input to the design phase?**
```

---

## Quality Indicators

### Good Research

- ✅ Multiple sources consulted
- ✅ Patterns validated across documents
- ✅ Direct quotes or specific references included
- ✅ Clear mapping to work package needs
- ✅ Risks and anti-patterns identified

### Insufficient Research

- ❌ Single source only
- ❌ Vague or generic findings
- ❌ No specific pattern recommendations
- ❌ Missing risk assessment
- ❌ No clear connection to requirements

---

## Examples

### Good Research Finding

```markdown
### Caching Strategy
**Source:** System Design Patterns, Chapter 7
**Relevance:** Work package requires improving API response times
**Key Insight:** "Write-through caching provides consistency at the cost of 
write latency; write-behind improves write performance but risks data loss 
on failure. For read-heavy workloads with tolerance for eventual consistency, 
write-behind with periodic flush is recommended."

**Application:** Our API is 90% reads, 10% writes. Write-behind with 5-second 
flush interval balances performance and durability for our use case.
```

### Poor Research Finding

```markdown
### Caching
We should probably use caching to make things faster.
```

---

## Integration with Workflow

This guide supports knowledge base research:

1. **After requirements confirmed** → Begin KB research
2. **Complete research** → Store in `02-kb-research.md`
3. **Present checkpoint** → Get user confirmation
4. **Proceed to analysis** → Use findings to inform implementation analysis

---

## Related Guides

- [Work Package Implementation Workflow](_work-package.md)
- [Implementation Analysis Guide](implementation-analysis.guide.md)
- [Architecture Review Guide](architecture-review.guide.md)

