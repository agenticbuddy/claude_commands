---
name: sa_execute
description: Start execution of tasks with intelligent context understanding
---

You are being asked to execute a task or epic using the project-lead agent.

The user provided: {{ARGUMENTS}}

## Your Task

1. **Parse the execution request** to identify:
   - Specific task/epic ID (T-123, EPIC-45)
   - Task description (if no ID given)
   - Scope keywords ("all", "critical", "security issues")
   - Priority indicators

2. **Smart execution handling**:
   - If ID provided → execute that specific task
   - If description → find matching task(s)
   - If scope keyword → execute all matching tasks
   - If ambiguous → list options and ask for clarification
   - If EPIC taks → Execute unfinished tasks one by one, according to the process, calling specified sub-agents to execute the task, do the review and testing, and process the feedback if needed until the task is complete, or feedback is not epmty after three cycles of review/testing. Run subagents in parallel wherever applicable

3. **Pre-execution checks**:
   - Verify task exists in .aira/tasks/ or .aira/epics/
   - Check dependencies
   - Confirm assignee availability
   - Validate prerequisites
   - Update task status in .aira/tasks/

## Parsing Examples

Input: "T-117"
Action: Execute task T-117 directly

Input: "the encryption task"
Action: Search for tasks with "encryption" in title/description
- If one match → execute
- If multiple → show list and ask which one

Input: "all critical security issues"
Action: Find all tasks where:
- Priority = critical/high
- AND (assignee = security-engineer OR title contains "security")

Input: "start working on the payment integration"
Action: Find tasks related to payment
- Check assignee = payment-integration-agent
- OR title/description contains "payment"

Input: "EPIC-17"
Action: Execute entire epic
- Show all sub-tasks
- Confirm execution order
- Assign specialists

## Execution Process

1. **Validate** - Check task exists and is ready. Check tasks for EPIC and subtasks for tasks.
2. **Assign** - Confirm or assign specialists
3. **Notify** - Inform all participants
4. **Track** - Create/update logs
5. **Monitor** - Set up progress tracking
6. **Review** - Run subagents to review and test after assignee finishes his work
7. **Mitigate** - Run assignee to process feedback from reviewers if any
8. **Iterate** - Run review again if any changes are made
9. **Documentation** - Run documentation subagent to update all proper documentation with changes, including user, technical, product, qa documentations

## Smart Defaults

- If no assignee → assign based on task domain
- If no reviewers → project lead agent should decide who reviews
- Any participant may add reviewers to tasks
- Task is completed only when it is done, review is complete, all feedback from review is mitigated and reviewed again until there are no remarks from reviewers and testers. There are no new broken tests, test and documentation are updated to match changes. Project lead may decide to postpone tests and documentation update until EPIC is complete (information about that should be logged in the EPIC acceptance criterias
- If dependencies → check they're complete
- If blocked → identify blockers first