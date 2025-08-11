---
name: sa_task
description: Create or modify a task/epic with intelligent natural language parsing
---

You are being asked to create or modify a task using the project-lead agent.

The user provided: {{ARGUMENTS}}

## Your Task

1. **Parse the natural language input** to extract:
   - Task title (derive from main action)
   - Description (detailed requirements)
   - Acceptance criteria (look for "should", "must", "need to")
   - Reviewers (mentioned agents or roles)
   - Epic vs Task (if "large", "complex", "multiple parts" → Epic)

2. **Auto-generate missing elements**:
   - Task ID: T-[next number] or EPIC-[next number]
   - Assignee: Based on task type (API → backend-engineer, UI → frontend-engineer)
   - Reviewers: If not specified, suggest based on task domain
   - Priority: Infer from keywords (critical, urgent, ASAP → high)

3. **Invoke the project-lead agent** with structured data
4. **Save task/epic to .aira/tasks/ or .aira/epics/ directory**

## Parsing Examples

Input: "Add field-level encryption to AuditEvent with AES-GCM, update schema and write tests"
Extract:
- Title: "Add field-level encryption to AuditEvent"
- Description: "Implement AES-GCM encryption, update database schema, write comprehensive tests"
- Assignee: backend-engineer (encryption task)
- Reviewers: [security-engineer, qa-engineer]
- Acceptance Criteria:
  - [ ] AES-GCM encryption implemented
  - [ ] Schema updated
  - [ ] Tests written with >90% coverage

Input: "Fix the login button on mobile, it's not responding to taps"
Extract:
- Title: "Fix unresponsive login button on mobile"
- Description: "Login button not responding to tap events on mobile devices"
- Assignee: frontend-engineer
- Reviewers: [mobile-architect, qa-engineer]
- Priority: high (login is critical)

Input: "Build complete payment system with Stripe, PayPal, and crypto support"
Extract:
- Type: EPIC (multiple payment providers)
- Title: "Multi-provider payment system"
- Break into tasks:
  - T-X: Stripe integration
  - T-Y: PayPal integration
  - T-Z: Crypto payment support

## Keywords for Smart Parsing

**Assignee Detection**:
- API, backend, server, database → backend-engineer
- UI, frontend, React, button, form → frontend-engineer
- Payment, transaction, billing → payment-integration-agent
- Security, vulnerability, auth → security-engineer
- Bug, error, crash → error-detective
- Slow, performance, optimize → performance specialist
- Anything else -> project lead agent descretion

**Priority Detection**:
- Critical, urgent, ASAP, blocking → high
- Important, needed, should → medium
- Nice to have, eventually, consider → low

**Reviewer Detection**:
- Security-related → security-engineer
- Payment-related → risk-manager
- UI/UX → ux-designer
- Performance → appropriate specialist