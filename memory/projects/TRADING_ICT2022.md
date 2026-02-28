# Trading ICT2022

## Overview

- ICT 2022 FVG strategy on Hyperliquid Perpetual
- 5m candle signals, $50 position sizing
- Live trading via Hummingbot API

## Current Status

- **Mode**: LIVE (switched from paper on 2026-02-25)
- **Strategy**: Optimized thresholds (min_disp_score: 1, require_mss: false) + Quality filters (0.5-5 ATR range, 0.1-1 ATR sweep)
- **Positions**: None active (waiting for quality signals)
- **PnL**: +$2.81 net (from paper trades this morning)
- **Exit Strategy**: Intraday scalping - 1% SL / 2% TP auto-close
- **Bot**: Running (PID 229460) - Live mode active

## Key Decisions

- **2026-02-24**: $50 fixed position sizing implemented
- **2026-02-24**: Hyperliquid Perpetual connector configured
- **2026-02-24**: Relaxed signal thresholds for more entries
- **2026-02-24**: **Exit strategy updated for intraday scalping:**
  - Auto-close: -1% SL / +2% TP (price moves, not PnL)
  - Alerts only (manual close): 8h max hold, NY close (4 PM EST), trailing stop
  - No overnight/weekend positions — 5m candles = intraday only
- **2026-02-24**: GitHub repo created: `freskhu/trading-ict2022`

## Next Actions

1. Monitor SL/TP exits
2. Add position de-duplication (prevent stacking)
3. Backtest sizing impact on drawdown

## Repos/Paths

- **GitHub**: https://github.com/freskhu/trading-ict2022
- **Local**: `~/.openclaw/workspace/trading/ict2022/`
- **Logs**: `trading/ict2022/logs/`
- **Config**: `trading/ict2022/config/strategy.yaml`

## Credentials Location

**Hummingbot API credentials stored in:**
- `trading/ict2022/.env` file (HB_API_USER, HB_API_PASS)
- Loaded automatically by live_runner.py on startup
- File is gitignored (not in repo) and chmod 600 (restricted access)
- **DO NOT** store credentials in memory files or ask user repeatedly

## Owners

- A01_QUANT: Strategy research, signals
- A02_PM: Position sizing, risk
- A03_TRADER: Execution, monitoring
