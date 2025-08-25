# Agent Categories

This document provides a categorized overview of all available agents in the claude_commands framework, organized into 6 logical categories for easier discovery and selection. Each category has its own subfolder in the `agents/` directory.

## Directory Structure

```
agents/
├── Architecture/
├── Complience/  
├── Engineering/
├── Growth/
├── Operations/
└── Strategy/
```

## 1. Architecture (`agents/Architecture/`)
*System design, API design, and architectural decision-making*

- **ai-architect** - Designs AI/ML systems, RAG pipelines, LLM architectures, vector databases, and prompt engineering at scale
- **api-architect** - Designs REST/GraphQL/gRPC APIs, versioning strategies, rate limiting, and developer experience
- **cloud-architect** - Multi-cloud strategies, Kubernetes orchestration, service mesh, disaster recovery, cost optimization
- **data-architect** - Data pipelines, lakehouse/mesh patterns, real-time analytics, query optimization, data governance
- **fintech-architect** - Payment systems, ledgers, PCI compliance, reconciliation engines, financial data consistency
- **integration-specialist** - Enterprise system integration (SAP, Salesforce), API orchestration, data transformation, iPaaS
- **mcp-architect** - Model Context Protocol servers, tool interfaces, resource providers, AI capability extension
- **solutions-architect** - Hyperscale systems for millions of users, evolutionary architectures, AWS-specific solutions
- **system-architect** - Distributed systems, microservices, consensus mechanisms, CAP theorem, event-driven architectures
- **ui-designer** - UI/UX design, mockups, wireframes, design systems, user interface patterns, visual design
- **ux-researcher** - User research, personas, journey mapping, usability testing, ethnographic studies, A/B test analysis

## 2. Compliance (`agents/Complience/`)
*Security, legal, privacy, and regulatory compliance*

- **compliance-officer** - SOC2, PCI DSS, HIPAA, GDPR compliance, audit trails, cross-border regulations, AI governance
- **cryptography-specialist** - Homomorphic encryption, zero-knowledge proofs, post-quantum crypto, key management systems
- **dependency-auditor** - SBOM generation, vulnerability scanning, license compliance, supply chain security
- **legal-counsel** - Tech contracts, SaaS agreements, IP issues, open source compliance, M&A, employment law
- **privacy-engineer** - GDPR/CCPA/HIPAA compliance, differential privacy, consent management, data minimization
- **risk-manager** - Risk assessment, threat modeling, Monte Carlo simulations, security posture, crisis mitigation
- **security-engineer** - Zero-trust architectures, vulnerability assessment, SIEM/SOAR, incident response strategies
- **tax-specialist** - International tax, cryptocurrency taxation, R&D tax credits, IRS audit defense, FATCA compliance

## 3. Engineering (`agents/Engineering/`)
*Core development across various technology stacks*

- **ai-engineer** - ML model implementation, fine-tuning, RLHF, production ML systems, distributed training
- **analytics-engineer** - dbt pipelines, metric layers, data transformations, semantic layers, incremental materialization
- **blockchain-engineer** - Smart contracts, DeFi protocols, NFTs, Layer 2 scaling, MEV protection, Web3 integration
- **claude-code-expert** - Claude Code development, agent instructions, CC processes, system architecture, CC functionality
- **data-engineer** - ETL/ELT pipelines, streaming data, Spark optimization, data quality monitoring, schema management
- **data-scientist** - Predictive models, A/B test analysis, statistical modeling, causal inference, recommendation systems
- **database-specialist** - Query optimization, schema design, sharding strategies, replication, performance tuning
- **fullstack-engineer** - React/Next.js frontends, Node.js backends, WebSocket integration, SEO optimization
- **ml-ops-engineer** - Model deployment, feature stores, model versioning, monitoring, automatic retraining pipelines
- **mobile-engineer** - iOS/Android native, React Native, offline-first design, battery optimization, smooth UI performance
- **payment-specialist** - Stripe integration, subscription billing, dunning management, payment success optimization
- **performance-engineer** - System profiling, latency reduction, memory optimization, throughput improvement, flame graphs
- **pragmatic-engineer** - Reviews proposals with extreme pragmatism, prevents over-engineering, finds simpler solutions
- **search-engineer** - Elasticsearch/Solr, semantic search, ranking algorithms, faceted search, autocomplete
- **streaming-engineer** - Kafka/Flink systems, exactly-once processing, real-time analytics, event stream processing

## 4. Growth (`agents/Growth/`)
*User acquisition, engagement, and growth optimization*

- **agent-architect** - Designs autonomous agent systems, self-improvement mechanisms, agent evaluation frameworks
- **community-lead** - Developer communities, Discord/Slack management, hackathons, ambassador programs, events
- **customer-success-engineer** - Enterprise accounts, Salesforce integration, churn prevention, escalation handling
- **email-specialist** - Email deliverability, SPF/DKIM/DMARC, automation flows, sender reputation, re-engagement
- **engagement-designer** - Retention features, gamification, habit formation, onboarding flows, viral loops
- **growth-engineer** - Referral systems, activation funnels, viral features, product-led growth, A/B testing
- **monetization-specialist** - Pricing strategies, in-app purchases, LTV/CAC optimization, subscription models
- **prompt-engineer** - LLM prompt optimization, chain-of-thought, few-shot learning, prompt injection defense
- **sales-engineer** - Technical sales, POCs, enterprise demonstrations, technical objection handling
- **seo-engineer** - Search visibility, Core Web Vitals, schema markup, featured snippets, JavaScript SEO
- **support-engineer** - Complex escalations, deep troubleshooting, log analysis, knowledge base creation
- **technical-writer** - API documentation, developer guides, SDK docs, README files, technical content

## 5. Operations (`agents/Operations/`)
*Infrastructure, DevOps, quality, and operational excellence*

- **accessibility-specialist** - WCAG compliance, screen reader optimization, keyboard navigation, ARIA labels
- **chaos-engineer** - Failure scenarios, game days, resilience testing, cascade failure prevention, antifragile systems
- **cost-engineer** - Cloud cost optimization, FinOps practices, resource efficiency, budget management
- **devops-engineer** - Infrastructure automation, CI/CD pipelines, Kubernetes, terraform, monitoring setup
- **dx-engineer** - Developer experience, build optimization, CLI design, SDK development, productivity metrics
- **i18n-engineer** - Internationalization, RTL layouts, locale formatting, pluralization rules, Unicode handling
- **incident-responder** - Production incidents, postmortems, incident command, blameless culture, MTTR reduction
- **observability-engineer** - Monitoring infrastructure, distributed tracing, SLO/SLI, dashboards, alert design
- **platform-engineer** - Internal developer platforms, golden paths, CI/CD automation, platform-as-product
- **qa-engineer** - Test strategies, automation frameworks, quality gates, coverage metrics, property-based testing
- **release-engineer** - Deployment strategies, rollout planning, feature flags, blue-green deployments, canary releases

## 6. Strategy (`agents/Strategy/`)
*Business strategy, project management, and strategic planning*

- **business-analyst** - Financial models, KPI analysis, cohort analysis, unit economics, requirement translation
- **competitive-analyst** - Market positioning, competitive threats, differentiation strategies, disruption analysis
- **problem-solver** - Complex problem decomposition, leverage points, scope management, solution orchestration
- **process-architect** - Workflow design, value streams, Toyota Kata, constraint theory, continuous improvement
- **product-strategist** - Product vision, roadmaps, OKRs, go-to-market, platform thinking, product-market fit
- **project-lead** - Team orchestration, dependency management, agile transformations, program governance
- **strategic-advisor** - Business transformation, scaling strategies, pivots, IPO preparation, hypergrowth planning

## Usage Guide

### Selecting the Right Agent

1. **For new features**: Start with `product-strategist` → `business-analyst` → appropriate engineering agents
2. **For bugs**: Use `support-engineer` for complex issues, relevant engineering agent for simple fixes
3. **For performance issues**: Combine `performance-engineer` with `observability-engineer`
4. **For security concerns**: Always involve `security-engineer` and `risk-manager` for assessment
5. **For compliance**: Use `compliance-officer` for regulations, `privacy-engineer` for data protection

### Common Agent Combinations

- **Full-stack development**: `fullstack-engineer` + `database-specialist` + `api-architect`
- **AI feature implementation**: `ai-architect` + `ai-engineer` + `ml-ops-engineer`
- **Production deployment**: `devops-engineer` + `qa-engineer` + `release-engineer`
- **Financial features**: `fintech-architect` + `payment-specialist` + `risk-manager`
- **Project execution**: `project-lead` orchestrating multiple specialist agents

### Best Practices

1. **Always consider security**: Involve `security-engineer` for any sensitive features
2. **Think about scale early**: Engage architects before implementation
3. **Document as you go**: Use `technical-writer` after major implementations
4. **Test thoroughly**: `qa-engineer` should review all critical code
5. **Monitor everything**: `observability-engineer` for production systems