# Trading Release Gate - QA Checklist

## Code Quality
- [ ] All code committed to trading repo
- [ ] Commit hash documented
- [ ] No uncommitted changes
- [ ] Code passes lint checks
- [ ] Type hints present (Python)
- [ ] No TODO/FIXME comments in critical paths

## Backtest Validation
- [ ] Backtest period ≥ 30 days
- [ ] Multiple market conditions covered
- [ ] Out-of-sample validation performed
- [ ] Transaction costs included
- [ ] Slippage modeled realistically
- [ ] Sharpe ratio > 1.0
- [ ] Max drawdown < 10%
- [ ] Win rate > 40%

## Risk Checks
- [ ] Position size limits enforced in code
- [ ] Stop losses configured and tested
- [ ] Daily loss limits set
- [ ] Maximum drawdown circuit breaker
- [ ] No single-point-of-failure in logic

## Paper Trading
- [ ] Minimum 7 days paper trading
- [ ] Logs reviewed for errors
- [ ] Performance matches backtest expectations
- [ ] No unexpected API errors
- [ ] Order execution as expected

## Configuration
- [ ] Strategy config version controlled
- [ ] Environment-specific configs separated
- [ ] Secrets not in repo (env vars used)
- [ ] Feature flags documented

## Deployment Readiness
- [ ] Rollback plan documented
- [ ] Monitoring dashboards ready
- [ ] Alerts configured (Slack/Discord)
- [ ] Emergency contact list updated
- [ ] Runbook for common issues

## Documentation
- [ ] gate_report.md complete
- [ ] backtest_results.json generated
- [ ] Risk limits documented
- [ ] Known issues listed

## Sign-off
- [ ] QA: Pass / Fail
- [ ] Reason: {{if_fail_explain}}

---
**Status:** ☐ GO ☐ NO-GO ☐ GO WITH CAVEATS
**Completed:** {{date}}
**Agent:** {{agent_id}}
