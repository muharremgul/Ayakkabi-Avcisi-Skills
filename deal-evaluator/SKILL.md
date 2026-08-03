---
name: deal-evaluator
description: Evaluate whether a current shoe offer is worth buying now using live exact-size stock, verified landed price, seller and return risk, target budget, competing offers, and available price history. Use for al, izle, bekle, or alma decisions.
---

# Deal Evaluator

## Goal

Turn verified price evidence into a cautious purchase decision.

## Workflow

1. Run `$product-matcher` and reject identity mismatches.
2. Run `$price-hunter` for the exact requested size.
3. Use only `live_size_verified` offers as purchasable options.
4. Calculate landed price from item price plus unavoidable shipping. Count coupons only when requirements are verified.
5. Evaluate seller identity, authorization, returns, warranty, condition, delivery, and marketplace risk.
6. Use genuine price history when available. Without history, do not invent a discount baseline or trend.
7. Apply [references/live-decision.md](references/live-decision.md).

## Decision classes

- `al`: strong fit, within budget, exact size verified, favorable price/risk
- `izle`: acceptable but price, seller, or stock confidence is incomplete
- `bekle`: budget miss, weak value, or incomplete verification
- `alma`: material identity, seller, condition, return, or product-fit risk

## Output

State the decision first, then verified offer, budget difference, price context, seller/return risk, what would change the decision, check time, and confidence.
