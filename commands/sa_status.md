---
name: sa_status
description: Get intelligent status reports with advanced query capabilities
---

You are being asked to generate a status report using the project-lead agent.

The user provided: {{ARGUMENTS}}

## Your Task

1. **Parse the status request** to determine:
   - Scope (project/epic/task/agent)
   - Time period (today/week/sprint/all-time)
   - Specific filters (blocking/critical/overdue)
   - Complex queries (who/what/when/why questions)
   - Format preference (summary/detailed)

2. **Intelligent interpretation**:
   - No arguments → project-level summary
   - Task ID → specific task status
   - Agent name → all tasks for that agent
   - Time keywords → filter by period
   - Status keywords → filter by state
   - Question words → deep investigation mode

3. **Generate appropriate report** with project-lead
   - Read data from .aira/tasks/, .aira/epics/, .aira/reports/

## Parsing Examples

Input: "status"
Action: Show project-level summary
- Active tasks/epics
- Blocked items
- Recent completions
- Overall health

Input: "T-117"
Action: Detailed status for task T-117
- Current state
- Work completed
- Remaining work
- Blockers
- Time spent

Input: "last week"
Action: Weekly summary
- Completed tasks
- Active work
- Velocity metrics
- Budget variance

Input: "backend-engineer"
Action: Status for all backend-engineer tasks
- Assigned tasks
- In progress
- Completed this period
- Upcoming work

Input: "blocked"
Action: All blocked items
- Task ID and title
- Blocker description
- Duration blocked
- Required action

Input: "critical issues"
Action: High-priority items only
- Critical/high priority tasks
- Their current status
- Any blockers
- ETA if available

## Advanced Query Examples

Input: "who committed the code with the general ledger bug T-3213?"
Action: Project lead investigates:
- Check T-3213 work logs
- Identify commits (git log with task ID)
- Find author and timestamp
- Check if bug was introduced or fixed

Input: "why is the payment integration taking so long?"
Action: Deep dive analysis:
- Find payment-related tasks/epics
- Check original estimates vs actual
- Identify blockers and dependencies
- Review work logs for issues
- Summarize root causes

Input: "what did security-engineer review yesterday?"
Action: Time-based agent query:
- Filter security-engineer activities
- Date = yesterday
- Show all reviews/comments
- Include task IDs and outcomes

Input: "which tasks are waiting for code review?"
Action: State-based query:
- Find all tasks in review state
- Show assigned reviewers
- Calculate wait time
- Highlight overdue reviews

Input: "when will EPIC-45 be ready for release?"
Action: Predictive analysis:
- Check EPIC-45 subtasks
- Calculate remaining work
- Consider current velocity
- Factor in dependencies
- Provide estimated completion

## Query Intelligence

**Question Words**:
- **Who**: Find people (assignee, reviewer, committer)
- **What**: Find activities, changes, decisions
- **When**: Find timelines, estimates, deadlines
- **Where**: Find code locations, file changes
- **Why**: Find root causes, rationales, blockers
- **How**: Find methods, implementations, processes

**Smart Context Enhancement**:
- For bug queries → include error logs, stack traces
- For performance → include metrics, benchmarks
- For delays → include blocker history, dependencies
- For commits → include git history, PR links
- For decisions → include rationale from logs

## Report Components

**Summary View**:
```
Project: [Name]
Week of: [Date]
Health: 🟢 Good | 🟡 Caution | 🔴 At Risk

Progress:
- Completed: X tasks
- In Progress: Y tasks
- Blocked: Z tasks

Key Metrics:
- Velocity: X points/week
- Budget variance: ±Y%
- Time variance: ±Z%
```

**Investigation View**:
```
Query: "who committed the code with bug T-3213?"
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Finding: backend-engineer committed fix
Commit: abc123 "T-3213: Fix general ledger calculation"
Date: 2025-07-30T15:45:22Z
Files: src/ledger/calculations.py
Review: security-engineer approved
Status: Merged to main, deployed to prod
```

## Smart Filters

**By State**: pending, in_progress, blocked, completed
**By Priority**: critical, high, medium, low
**By Time**: today, yesterday, this week, last week, sprint
**By Person**: [agent-name], unassigned, needs-review
**By Type**: bug, feature, epic, task
**By Query**: Complex natural language questions