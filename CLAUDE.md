# Strategy:CC

## Process Management - Product First

### Core Processes

**Meta-Processes (Framework):**


**Applied Processes (Domain-Specific):**



### Critical Rules
**Product and business are paramount.**

For ALL epics affecting product:
1. product-strategist MUST analyze first
2. Define success metrics before technical design
3. Track value delivery post-implementation

### Workflow
When user requests work:
1. ALWAYS start with orchestration process (`/orchestrate`)
2. Route to appropriate process based on request type
3. Track all changes in WAL (.strategy/wal/)
4. Update documentation automatically
5. Run retrospective on completion





### Quality Principles
- **Zero-bug tolerance** - No proceeding with failing tests
- **Test-first development** - TDD cycle always
- **Presumption of code guilt** - Failed test = bug in code
- **SOLID, DRY, KISS** - Non-negotiable principles

