# Trading Release Gate - Output Schema

## File Structure
```
trading/releases/{{date}}-{{strategy_version}}/
├── gate_report.md
├── backtest_results.json
├── risk_check.md
└── deployment_checklist.md
```

## gate_report.md

```markdown
# Trading Release Gate Report
**Strategy:** {{strategy_version}}
**Release Type:** {{release_type}}
**Date:** {{date}}

## Decision: ☐ GO ☐ NO-GO ☐ GO WITH CAVEATS

## Backtest Summary
| Metric | Value | Threshold | Status |
|--------|-------|-----------|--------|
| Sharpe Ratio | {{value}} | > 1.0 | ✅/❌ |
| Max Drawdown | {{value}}% | < 10% | ✅/❌ |
| Win Rate | {{value}}% | > 40% | ✅/❌ |
| Profit Factor | {{value}} | > 1.2 | ✅/❌ |
| Total Trades | {{n}} | > 30 | ✅/❌ |

## Risk Validation
{{summary_of_risk_check}}

## Paper Trading
- Duration: {{days}} days
- Status: ✅/❌
- Issues: {{any}}

## Blockers
{{list_if_any}}

## Deployment Commands
```bash
# If GO decision:
./deploy.sh {{strategy_version}} --env=live
```
```

## backtest_results.json

```json
{
  "strategy_version": "{{version}}",
  "backtest_period": "{{start}} to {{end}}",
  "symbols": ["BTC/USDT", "ETH/USDT"],
  "metrics": {
    "sharpe_ratio": {{n}},
    "max_drawdown_pct": {{n}},
    "win_rate_pct": {{n}},
    "profit_factor": {{n}},
    "total_return_pct": {{n}},
    "total_trades": {{n}},
    "avg_trade_return_pct": {{n}}
  },
  "monthly_breakdown": [...],
  "equity_curve": [...]
}
```

## risk_check.md

```markdown
# Risk Validation

## Position Limits
- [ ] Max position per trade: {{value}} ≤ {{limit}}
- [ ] Max concurrent positions: {{value}} ≤ {{limit}}
- [ ] Max total exposure: {{value}} ≤ {{limit}}

## Drawdown Controls
- [ ] Daily loss limit configured
- [ ] Circuit breaker at {{drawdown}}% drawdown
- [ ] Automatic position sizing enabled

## Operational Risk
- [ ] API keys rotated within 90 days
- [ ] Emergency stop documented
- [ ] Monitoring alerts configured
```
