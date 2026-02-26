# Trading Release Gate - Prompt Template

```
Execute trading release gate with the following parameters:

RELEASE_TYPE: {{release_type}}
STRATEGY_VERSION: {{strategy_version}}
BACKTEST_PERIOD: {{backtest_period}}
RISK_LIMITS: {{risk_limits}}

TASKS:
1. Pull latest strategy code from trading repo
2. Run full backtest over specified period
3. Calculate key metrics:
   - Sharpe ratio
   - Max drawdown
   - Win rate
   - Profit factor
   - Expectancy
4. Validate against RISK_LIMITS
5. Review recent paper trading logs
6. Check for code issues (lint, tests)
7. Verify exchange API connectivity
8. Generate gate report with Go/No-go

CONSTRAINTS:
- No live deployment if any risk check fails
- Backtest must cover at least 30 days
- Paper trade minimum 7 days before live
- All config must be version controlled
- Emergency stop procedures documented

DELIVERABLES:
- Gate report (Go/No-go decision)
- Backtest results JSON
- Risk validation checklist
- Deployment readiness checklist
```

## Example Usage

```
Execute trading release gate with the following parameters:

RELEASE_TYPE: new_strategy
STRATEGY_VERSION: ict2022-v2.1
BACKTEST_PERIOD: 90 days
RISK_LIMITS: {max_position: 100, max_drawdown: 0.10, daily_loss_limit: 50}

TASKS:
1. Pull latest strategy code...
```
