# Price Hunter

## Overview

- S01 agent: Helps buy right products with minimal hassle
- Shortlist → Recommend → Track prices
- Discord #product-hunt channel binding

## Current Status

- **Agent**: S01_PRICE_HUNTER active
- **Workflow**: Intake playbook + shortlist template ready
- **Binding**: Discord channel 1474448990417191003

## Key Decisions

- **2026-02-20**: S01 agent bootstrapped with standard files
- **2026-02-20**: INTAKE_PLAYBOOK + SHORTLIST_TEMPLATE created

## Next Actions

1. Migrate to systemd timer (from cron)
2. Add watchlist persistence
3. Price alert notifications

## Repos/Paths

- Agent: `agents/S01_PRICE_HUNTER/`
- Reports: `shopping/price_hunter/reports/`

## Owners

- S01_PRICE_HUNTER: Full ownership
