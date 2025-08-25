---
Name: learn-conventions
description: Automatically analyze codebase patterns and update CLAUDE.md CONVENTIONS section with imperative coding rules
argument-hint: <standard|deep> [optional: project focus area]
---

# Convention Learning Through Systematic Codebase Analysis

**Core Purpose:** Extract established patterns from codebase and transform them into imperative coding conventions for CLAUDE.md.

## Execution Flow

1. **File Sampling** → @pragmatic-engineer samples critical files using git history + mandatory paths
2. **Core Pattern Analysis** → @fullstack-engineer analyzes naming, structure, imports, types, async, errors
3. **Security Pattern Analysis** → @security-engineer analyzes auth, validation, SQL, secrets, API security
4. **Data Pattern Analysis** → @database-specialist analyzes state, API calls, database access, caching
5. **Convention Synthesis** → @claude-code-expert transforms patterns into imperative rules (>70% consistency)
6. **Security Baseline Application** → @security-engineer applies mandatory security rules
7. **CLAUDE.md Update** → @claude-code-expert updates CONVENTIONS section

## Step 1: Strategic File Sampling

**Execute via @pragmatic-engineer:** Sample codebase for pattern analysis

### Sampling Strategy Selection
Based on argument:
- **standard** → 10-15 files (quick analysis)
- **deep** → 20-50 files (comprehensive analysis)

### Mandatory Critical Path Sampling
Execute these searches in order:
1. **Security/Auth paths:** `find . \( -path "*/auth/*" -o -path "*/security/*" \) | head -4`
2. **Core business paths:** `find . \( -path "*/models/*" -o -path "*/db/*" -o -path "*/api/*" \) | head -4`
3. **Configuration files:** `ls -la *config* .env* 2>/dev/null | head -2`

### Git-Based Smart Sampling
Execute git analysis for frequently changed files:
1. **Most modified files:** `git log --pretty=format: --name-only -30 | sort | uniq -c | sort -rg | head -5`
2. **Recent changes:** `git diff HEAD~10 --name-only | grep -E '\.(ts|tsx|js|jsx|py|go|rs)$' | head -3`

### File Selection Protocol
Create file list `.strategy/conventions/sampled-files.txt` with:
- All mandatory critical path files found
- Top git-analyzed files
- Ensure coverage: frontend, backend, database, config, tests
- Target total: 10-15 (standard) or 20-50 (deep)

**Output:** Complete file list for analysis with reasoning for each file's selection

## Step 2: Core Pattern Extraction

**Execute via @fullstack-engineer:** Analyze fundamental code patterns across sampled files

Read each file from sampled-files.txt and extract patterns in these categories:

### Naming Conventions Analysis
For each sampled file, identify:
- **Files:** PascalCase vs camelCase vs kebab-case vs snake_case
- **Variables:** Naming style, prefix/suffix patterns
- **Functions:** Naming conventions, verb patterns
- **Components:** Naming and organizational patterns
- **Constants:** ALL_CAPS vs camelCase patterns

### Structure Patterns Analysis
Examine:
- **Directory organization:** Feature-based vs layer-based
- **Module boundaries:** How responsibilities are separated
- **File organization:** Single vs multiple exports per file
- **Component structure:** How UI components are organized

### Import/Export Patterns Analysis
Document:
- **Import style:** Relative vs absolute paths
- **Path aliases:** Usage of @/ or other aliases
- **Export patterns:** Default vs named exports
- **Dependency organization:** How external vs internal imports are handled

### Type System Patterns Analysis
Identify:
- **TypeScript usage:** Interface vs type, any usage patterns
- **Type definitions:** Where and how types are defined
- **Generic usage:** Common generic patterns
- **Type safety:** Strict vs permissive patterns

### Async Patterns Analysis
Document:
- **Async handling:** async/await vs promises vs callbacks
- **Error boundaries:** How async errors are handled
- **Loading states:** How async loading is managed
- **Race conditions:** Prevention patterns identified

### Error Handling Patterns Analysis
Examine:
- **Error catching:** try-catch vs .catch vs error boundaries
- **Error logging:** Logging patterns and levels
- **User feedback:** How errors are communicated to users
- **Recovery patterns:** How applications recover from errors

**Output:** Structured pattern analysis saved to `.strategy/conventions/core-patterns.md`

### Pattern Consistency Calculation
For each pattern category:
1. Count total occurrences
2. Count most common variant occurrences
3. Calculate consistency percentage: (most_common / total) * 100
4. Mark patterns >70% consistency for conversion to rules

## Step 3: Security Pattern Deep Analysis

**Execute via @security-engineer:** Comprehensive security pattern analysis (NEVER SKIP THIS STEP)

### Authentication Patterns Analysis
Examine all auth-related files for:
- **Token handling:** JWT vs session vs OAuth patterns
- **Token storage:** localStorage vs cookies vs secure storage
- **Auth verification:** How endpoints verify authentication
- **Session management:** Session timeout and renewal patterns

### Authorization Patterns Analysis
Document:
- **Role verification:** How roles/permissions are checked
- **Resource access:** How access to specific resources is controlled
- **Permission patterns:** Permission checking patterns
- **Privilege escalation prevention:** How privilege escalation is prevented

### Input Validation Patterns Analysis
Identify:
- **Validation approach:** Client-side vs server-side vs both
- **Validation libraries:** What libraries are used for validation
- **Sanitization:** How user input is cleaned
- **XSS prevention:** Cross-site scripting prevention patterns

### SQL Security Patterns Analysis
Examine database access for:
- **Query construction:** Parameterized queries vs string concatenation
- **ORM usage:** How ORMs are used for query safety
- **Database access patterns:** Direct SQL vs ORM patterns
- **Injection prevention:** SQL injection prevention methods

### Secrets Management Analysis
Document:
- **Environment variables:** How secrets are stored and accessed
- **Hardcoded secrets:** Detection of any hardcoded sensitive data
- **Key rotation:** Patterns for managing secret rotation
- **Secret access:** How application code accesses secrets

### API Security Patterns Analysis
Identify:
- **Rate limiting:** How APIs prevent abuse
- **CORS configuration:** Cross-origin request handling
- **Input sanitization:** API input cleaning patterns
- **Error responses:** How APIs handle and report errors

**Output:** Security analysis saved to `.strategy/conventions/security-patterns.md`

### Security Pattern Validation
Mark ALL security patterns for mandatory rule creation regardless of consistency percentage.

## Step 4: Data Management Pattern Analysis

**Execute via @database-specialist:** Analyze data handling and persistence patterns

### State Management Patterns Analysis
Examine:
- **State libraries:** Redux vs Context vs Zustand vs local state
- **State structure:** How application state is organized
- **State updates:** Immutable vs mutable update patterns
- **State persistence:** How state is persisted between sessions

### API Communication Patterns Analysis
Document:
- **HTTP libraries:** fetch vs axios vs other libraries
- **Request patterns:** How API requests are structured
- **Response handling:** How API responses are processed
- **Error handling:** How API errors are managed
- **Retry logic:** How failed requests are retried

### Database Access Patterns Analysis
Identify:
- **Database queries:** Raw SQL vs ORM vs query builder
- **Connection management:** How database connections are handled
- **Transaction patterns:** How database transactions are managed
- **Migration patterns:** How database schema changes are handled

### Caching Patterns Analysis
Examine:
- **Cache strategy:** What gets cached and when
- **Cache invalidation:** How cached data is updated
- **Cache storage:** Where cached data is stored
- **Cache consistency:** How cache consistency is maintained

**Output:** Data patterns saved to `.strategy/conventions/data-patterns.md`

## Step 5: Convention Rule Synthesis

**Execute via @claude-code-expert:** Transform identified patterns into imperative coding rules

### Pattern Filtering Protocol
For each identified pattern:
1. **Consistency check:** Only include patterns >70% consistent
2. **Clarity validation:** Ensure pattern is clearly defined
3. **Actionability test:** Confirm pattern can be expressed as imperative rule
4. **Conflict resolution:** Resolve conflicting patterns by choosing most consistent

### Imperative Rule Transformation
Convert each validated pattern to imperative format:
- **FROM:** "Components use PascalCase (85% consistent)"
- **TO:** "Use PascalCase for React components"

- **FROM:** "API calls use async/await (92% consistent)"
- **TO:** "Use async/await for API calls"

### Rule Organization
Group rules into logical categories:
- **Naming Conventions**
- **File Organization**
- **Import/Export Style**
- **Type Definitions**
- **Async Patterns**
- **Error Handling**
- **Security Practices**
- **Data Management**

**Output:** Synthesized rules saved to `.strategy/conventions/imperative-rules.md`

## Step 6: Security Baseline Application

**Execute via @security-engineer:** Apply mandatory security rules regardless of codebase consistency

### Security Baseline Rules (ALWAYS APPLY)
Add these rules to conventions regardless of current codebase patterns:

1. **Require authentication for protected endpoints**
2. **Validate all user input at application boundaries**
3. **Use parameterized queries for all database access**
4. **Enforce HTTPS in production environments**
5. **Manage secrets via environment variables only**
6. **Implement rate limiting on public APIs**
7. **Ensure error messages never leak system details**

### Security Rule Integration
1. Review synthesized rules for security gaps
2. Add missing security baseline rules
3. Strengthen existing security rules if they're too permissive
4. Mark all security rules as non-negotiable

**Output:** Enhanced rules with security baseline in `.strategy/conventions/final-rules.md`

## Step 7: CLAUDE.md Integration

**Execute via @claude-code-expert:** Update project CLAUDE.md with discovered conventions (create if absent)

### CONVENTIONS Section Update Protocol

1. **Backup existing CLAUDE.md** to `.strategy/conventions/claude-backup-[timestamp].md`
2. **Locate CONVENTIONS section** in CLAUDE.md or create if missing
3. **Preserve custom rules** - any rules marked as "custom" or "manual"
4. **Replace auto-generated content** with new rules
5. **Add analysis metadata** - timestamp, files analyzed, consistency thresholds

### CONVENTIONS Section Structure
```markdown
## CONVENTIONS
<!-- Auto-updated by learn-conventions.md process -->
<!-- Generated: [timestamp] -->
<!-- Files analyzed: [count] | Consistency threshold: >70% -->
<!-- Next analysis recommended: [current_date + 30 days] -->

### Naming Conventions
[Imperative rules for naming]

### File Organization
[Imperative rules for structure]

### Import/Export Style
[Imperative rules for imports]

### Type Definitions
[Imperative rules for types]

### Async Patterns
[Imperative rules for async]

### Error Handling
[Imperative rules for errors]

### Security Practices
[Imperative security rules]

### Data Management
[Imperative data rules]

### Custom Rules (Manual)
<!-- These rules are manually maintained -->
[Preserve any existing custom rules]
```

### Deep Analysis Additional Output
If mode is "deep", also create:
- `CONVENTIONS_ANALYSIS.md` with detailed statistics
- Pattern strength classification (strong/emerging/no convention)
- Recommendations for improving pattern consistency

### Validation and Completion
1. **Verify CLAUDE.md syntax** is correct
2. **Test convention rules** are actionable and clear
3. **Confirm security baseline** is complete
4. **Validate file backup** was created successfully

**Output:** Updated CLAUDE.md with extracted conventions and analysis files in `.strategy/conventions/`

## Mode-Specific Behavior

### Standard Mode (Default)
- Sample 10-15 files using mandatory + git-based selection
- Focus on most critical patterns
- Generate core convention rules
- Complete analysis in single session

### Deep Analysis Mode
When user specifies "deep", "thorough", or "comprehensive":
- Sample 20-50 files with extended coverage
- Include architectural and team patterns from git history
- Generate detailed CONVENTIONS_ANALYSIS.md with statistics
- Classify patterns as strong/emerging/no convention
- Provide recommendations for improving consistency

## Project Focus Areas (Optional)
When user specifies focus area:
- **frontend** → Emphasize React/UI patterns, component conventions
- **backend** → Focus on API, database, service patterns
- **security** → Deep dive on auth, validation, secrets management
- **data** → Emphasize database, state management, API patterns

Adjust file sampling and analysis depth based on specified focus.

## Error Handling and Recovery

### Pattern Conflicts
When patterns conflict (multiple conventions with similar consistency):
1. **Security patterns** always take precedence
2. **Most recent patterns** (git history) preferred over legacy
3. **Framework/library conventions** preferred over custom patterns
4. **Document conflicts** in analysis files for user review

### Insufficient Pattern Data
When <70% consistency found:
1. **Note pattern inconsistency** in analysis
2. **Skip rule generation** for inconsistent patterns
3. **Apply security baseline** regardless
4. **Recommend pattern standardization** in analysis

### Analysis Completion Guarantee
Ensure all seven steps complete even if individual steps encounter issues:
1. **Continue with partial data** if file sampling fails
2. **Apply security baseline** even if pattern analysis incomplete
3. **Update CLAUDE.md** with whatever rules were successfully extracted
4. **Document any issues** in analysis files

## Quality Assurance

### Before CLAUDE.md Update
- [ ] All security baseline rules included
- [ ] Rules are imperative format (start with action verbs)
- [ ] No conflicting or contradictory rules
- [ ] Custom rules section preserved
- [ ] Backup created successfully

### Analysis Completeness Check
- [ ] Core patterns analyzed (naming, structure, imports, types, async, errors)
- [ ] Security patterns analyzed (auth, validation, SQL, secrets, API)
- [ ] Data patterns analyzed (state, API, database, caching)
- [ ] Pattern consistency calculated (>70% threshold applied)
- [ ] Security baseline applied regardless of consistency

**Session Output:** Updated CLAUDE.md with codebase-derived conventions and complete analysis documentation in `.strategy/conventions/`