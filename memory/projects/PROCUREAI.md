# ProcureAI

## Overview

- Chat-centric procurement SaaS prototype for industrial buyers
- AI negotiates with suppliers 24/7, cuts costs 40%
- Next.js + Prisma + Hyperliquid integration

## Current Status

- **Landing page**: Team section live, chat demo video embedded
- **RFQ workflow**: Multi-item support, enhanced footer
- **Deployment**: Vercel configured, GitHub repo active

## Key Decisions

- **2026-02-27**: Added comprehensive test suite - 16 unit tests for RFQ module + integration tests
- **2026-02-24**: Moved to PR workflow (no direct master pushes)
- **2026-02-24**: Fixed dashboard crash (`rfqs.filter` error handling)
- **2026-02-23**: Added Team section with Founder + AI Agent profiles

## Next Actions

1. Investor demo flow polish
2. Test end-to-end RFQ → Quote → Approval
3. Stripe billing integration (post-demo)

## Repos/Paths

- Code: `apps/procure-ai/` (workspace root after restructure)
- Memory: `memory/projects/PROCUREAI.md`
- Agents: D01_FE, D02_BE, D03_QA

## Owners

- D01_FE: UI/UX, landing page
- D02_BE: API, database, integrations
- D03_QA: Testing, bug tracking
