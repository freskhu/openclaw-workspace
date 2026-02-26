# Trading Release Gate

## Purpose
Validate trading strategy code and configuration before deploying to live trading. Ensures safety checks, backtest validation, and risk controls are in place.

## When to Use
- Before switching from paper to live trading
- After significant strategy changes
- Before deploying new features (alerts, auto-close)
- Weekly as part of trading ops routine

## Inputs
| Input | Type | Description |
|-------|------|-------------|
| `release_type` | enum | new_strategy, config_change, feature_update |
| `strategy_version` | string | version or commit hash |
| `backtest_period` | string | days of backtest data |
| `risk_limits` | object | max position, drawdown, etc. |

## Outputs
| Output | Type | Description |
|--------|------|-------------|
| `gate_report` | markdown | Go/No-go decision |
| `backtest_results` | json | Performance metrics |
| `risk_check` | markdown | Risk validation |
| `deployment_checklist` | markdown | Production readiness |

## Owner Agent(s)
- **Primary:** `trade-quant` (Trading Quant)
- **Secondary:** `trade-ops` (Trading Operations)

## Dependencies
- Backtest data available
- Strategy code in trading repo
- Risk limits documented
- Exchange API keys configured (for live)

## Success Metrics
- Backtest Sharpe > 1.0 (configurable)
- Max drawdown < 10%
- All risk checks pass
- No critical bugs in 7-day paper trade
