# Freskhy's OpenClaw Workspace

Personal workspace for OpenClaw agent configuration, memory, and daily improvements.

## Structure

- `memory/` — Daily notes and project logs
- `scripts/` — Automation scripts (daily improvements, etc.)
- `systemd/` — Systemd timer configs for scheduled tasks
- `docs/` — Documentation
- `AGENTS.md` — Workspace guidelines
- `SOUL.md` — Identity and personality
- `USER.md` — Notes about the human
- `HEARTBEAT.md` — Daily task definitions

## Daily Improvements

The `scripts/daily_improvement.sh` generates a random task every day at 8 AM.
Triggered via systemd timer (`openclaw-daily-improvement.timer`).
