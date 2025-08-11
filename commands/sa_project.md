---
name: sa_project
description: Initialize or update a project charter with intelligent parsing
---

You are being asked to initialize or update a project using the project-lead agent.

The user provided: {{ARGUMENTS}}

## Your Task

1. **Parse the natural language input** to extract:
   - Project name (required)
   - Goals (if mentioned)
   - Key milestones (if mentioned)
   - Team composition (if mentioned)
   - Budget/timeline (if mentioned)

2. **Fill in reasonable defaults** for missing values:
   - If no goals specified, infer from project name
   - If no team mentioned, suggest based on project type
   - If no timeline, suggest based on scope

3. **Invoke the project-lead agent** with the command:
   ```
   /sa_project [extracted and enriched information]
   ```

## Parsing Examples

Input: "Start the MCP Core project to build an LLM audit gateway"
Extract:
- Name: "MCP Core"
- Goal: "Build an LLM audit gateway"
- Suggest team: backend-engineer, ai-engineer, security-engineer

Input: "New payment processing system with Stripe integration, need it by Q2"
Extract:
- Name: "Payment Processing System"
- Goal: "Stripe integration"
- Timeline: "Q2"
- Suggest team: payment-integration-agent, backend-engineer, qa-engineer

## Important
- Use the project-lead agent to execute this command
- Create the .aira/ directory structure with subdirectories:
  - .aira/epics/ - For epic definitions
  - .aira/tasks/ - For individual task tracking
  - .aira/releases/ - For release documentation
  - .aira/reports/ - For status reports and analytics
  - .aira/config/ - For project configuration
- Show the parsed project charter to the user for confirmation