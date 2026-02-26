# Release Notes — ProcureAI v1.1-demo-ready

**Version**: v1.1-demo  
**Date**: 2026-02-21  
**Status**: Investor Demo Ready (Enhanced)

---

## ✨ What's New in v1.1

### Working RFQ Creation
- Full "New RFQ" dialog with form validation
- Project and product dropdown selectors
- Quantity input with number validation
- Saves to database with toast notifications

### Interactive Chat System
- Send messages (Enter or button)
- AI automatically responds with contextual action cards
- Smart detection: "need" → Create RFQ, "supplier" → Suggest Suppliers, etc.
- System notifications (green bubbles)

### Test Quote Generation
- One-click generate 3 sample quotes
- Realistic price variance (±20%)
- Random delivery times (5-20 days)
- Uses top-rated suppliers from database

### Send RFQ Workflow
- Send button changes status DRAFT → SENT
- Visual status badges throughout UI
- Confirmation via toast notifications

---

## 🎉 What's Included

### Core Features
- **Landing Page** — Professional hero with value proposition and "Launch Demo" CTA
- **Project Management** — Create and manage procurement projects
- **AI Chat Workflow** — Natural language interface with action cards
- **RFQ Management** — Create, send, and track RFQs
- **Quote Comparison** — Side-by-side supplier quote comparison with approval
- **Supplier Directory** — 12 vetted suppliers with ratings and categories
- **Product Catalog** — Organized product listings
- **Activity Log** — Full audit trail of procurement actions

### Demo Data (Atlas Metalworks)
- 1 demo user (demo@atlas-metalworks.com)
- 3 sample projects (Fan Impeller Blades, etc.)
- 12 suppliers across Europe (Spain, Portugal, Germany, etc.)
- 5 products (S355 Steel Plates, Laser Cutting Service, etc.)
- Pre-seeded RFQs and quotes for immediate demo

---

## 🛠️ Tech Stack

- **Framework**: Next.js 16 + React 19
- **Styling**: Tailwind CSS + shadcn/ui components
- **Database**: SQLite + Prisma ORM
- **Testing**: Playwright (15 E2E tests)
- **Icons**: Lucide React

---

## 📁 Project Structure

```
apps/procure-ai/my-app/
├── app/                    # Next.js App Router
│   ├── api/               # API routes (projects, rfqs, quotes, suppliers)
│   ├── app/               # Main application pages
│   ├── layout.tsx         # Root layout
│   └── page.tsx           # Landing page
├── components/ui/         # shadcn/ui components
├── e2e/                   # Playwright E2E tests
├── prisma/                # Database schema + seed
└── docs/                  # Documentation
```

---

## 🚀 Quick Start

```bash
cd ~/.openclaw/workspace/apps/procure-ai/my-app
npm install
npx prisma db push
npm run db:seed
npm run dev
```

Open http://localhost:3000

---

## 🧪 Testing

```bash
# Run E2E tests
npm run test:e2e

# Run specific test file
npx playwright test e2e/demo-flow.spec.ts
```

---

## 📖 Documentation

- [UI Research](docs/research_ui.md) — UX patterns from Coupa, Ariba, Linear
- [Data Model](docs/research_data_model.md) — Prisma schema + relationships
- [QA Test Plan](docs/QA_TEST_PLAN.md) — Test coverage details
- [Demo Script](docs/INVESTOR_DEMO_SCRIPT.md) — 5-7 min investor walkthrough
- [Acceptance Checklist](docs/FINAL_ACCEPTANCE_CHECKLIST.md) — Completion verification

---

## ✅ Quality Gates

| Gate | Status |
|------|--------|
| Build | ✅ Pass |
| E2E Tests | ✅ 15 tests defined |
| Code Review | ✅ No secrets |
| Demo Data | ✅ Seeded |
| Documentation | ✅ Complete |

---

## 🎯 Investor Demo Flow

1. **Landing** — Show value proposition
2. **Projects** — "Fan Impeller Blades" project
3. **Chat** — Type procurement need, see AI action cards
4. **RFQs** — Show generated RFQ
5. **Quotes** — Compare 3 supplier quotes
6. **Approve** — Select best quote
7. **Suppliers** — Show directory

See full script: [INVESTOR_DEMO_SCRIPT.md](docs/INVESTOR_DEMO_SCRIPT.md)

---

## 🔒 Security

- No real API keys or credentials
- Demo data only (no confidential business info)
- SQLite database (local only)

---

## 🔧 Bug Fixes (v1.1.1)

1. ✅ **Fixed API routes** — Updated to Next.js 15 `params` as Promise pattern
2. ✅ **Fixed Messages API** — Now supports SYSTEM role for notifications
3. ✅ **Fixed Project links** — Navigation to project detail works correctly
4. ✅ **Fixed RFQ links** — All RFQ operations (create, send, generate quotes) work
5. ✅ **Fixed Type errors** — Removed undefined `payload` reference in ActionCard

## 📝 Known Limitations

1. Mock AI (rule-based, not LLM) — for demo stability
2. No real email notifications
3. Single demo user (no auth system)
4. No file upload (placeholder)

---

## 🏷️ Tag

```bash
git tag -a v1-demo-ready -m "ProcureAI v1.0 — Investor Demo Ready"
```

---

**Built by**: OpenClaw Dev Crew (D01_FE, D02_BE, D03_QA)  
**Coordinated by**: MAX (Atlas)  
**For**: Simão / Atlas Metalworks