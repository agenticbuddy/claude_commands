---
name: sa_release
description: Handle releases with intelligent context and safety checks
---

You are being asked to manage a release using the project-lead agent.

The user provided: {{ARGUMENTS}}

## Your Task

1. **Parse the release request** to extract:
   - Action (deploy/rollback/demo/validate)
   - Environment (dev/staging/prod)
   - Scope (specific tasks/full release)
   - Dependencies (after/with conditions)
   - Safety requirements

2. **Intelligent interpretation**:
   - Missing environment → ask for clarification
   - No action → assume deployment readiness check
   - Task mentions → verify those specific tasks
   - Risk keywords → trigger extra validation

3. **Execute release workflow** with project-lead
   - Store release documentation in .aira/releases/
   - Update task status in .aira/tasks/

## Parsing Examples

Input: "release"
Action: Pre-release checklist
- All tasks completed?
- All reviews passed?
- Tests passing?
- Documentation updated?
- Show readiness report

Input: "deploy to prod"
Action: Production deployment
- Run final validation
- Check dependencies
- Create deployment package
- Notify DevOps engineer
- Monitor deployment

Input: "rollback T-117"
Action: Targeted rollback
- Identify T-117 changes
- Check safe rollback path
- Execute rollback
- Verify system stable
- Document incident

Input: "demo ready"
Action: Demo preparation
- Ensure demo environment ready
- Check specific features working
- Prepare demo script
- Test user flows
- Notify stakeholders

Input: "deploy to staging after T-112 and T-113"
Action: Conditional deployment
- Verify T-112 completed
- Verify T-113 completed
- Deploy to staging
- Run smoke tests
- Report status

## Release Actions

**Deploy**: Push to specified environment
- Validate all prerequisites
- Check quality gates passed
- Coordinate with DevOps
- Monitor deployment
- Verify success

**Rollback**: Revert changes
- Identify scope
- Check dependencies
- Execute rollback plan
- Verify stability
- Create incident report

**Demo**: Prepare demonstration
- Setup demo environment
- Verify key features
- Create walkthrough
- Test scenarios
- Brief presenters

**Validate**: Final checks only
- Run test suite
- Check security scan
- Verify documentation
- Review metrics
- Generate report

## Environment Detection

**Production Indicators**:
- "prod", "production", "live", "real users"
- Triggers: Maximum validation, change freeze check

**Staging Indicators**:
- "stage", "staging", "pre-prod", "acceptance"
- Triggers: Full test suite, performance tests

**Development Indicators**:
- "dev", "development", "test"
- Triggers: Basic validation, quick deploy

## Safety Checks

**Pre-Production**:
- [ ] All tasks in epic completed
- [ ] All code reviews approved
- [ ] Security scan passed
- [ ] Performance benchmarks met
- [ ] Documentation complete
- [ ] Rollback plan documented

**Production Extra**:
- [ ] Change window approved
- [ ] On-call engineer notified
- [ ] Monitoring alerts configured
- [ ] Customer communication ready
- [ ] Incident response team standby

## Smart Defaults

- No environment specified → Ask, don't assume
- Friday deployment → Warn about weekend risk
- Major changes → Suggest staged rollout
- Failed checks → Block and report
- Success → Create release notes

## Risk Assessment

**Low Risk**: 
- Small changes
- Well-tested
- Easy rollback

**Medium Risk**:
- Multiple services
- Database changes
- External dependencies

**High Risk**:
- Payment systems
- User data migration
- API breaking changes
- First-time deployment

**Actions by Risk**:
- Low → Standard deployment
- Medium → Staged rollout
- High → Extra validation, standby team