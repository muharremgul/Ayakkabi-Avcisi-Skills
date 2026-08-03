---
name: shoe-recommender
description: Build a user-specific shoe shortlist from the current web market, then verify reviews, fit, Turkey pricing, and requested-size stock. Use when the user asks what shoe to buy for a terrain, distance, stability or cushioning need, fit preference, budget, and size.
---

# Shoe Recommender

## Goal

Recommend purchasable shoes for the user’s actual use rather than a generic popularity list.

## Workflow

1. Capture terrain, weekly distance, use, cushioning/stability/grip priorities, support concerns, fit/width, budget, country, and exact size.
2. Build candidates from current official catalogues and independent sources, not a project-local database.
3. Exclude hard conflicts: wrong terrain, unsuitable stability, unavailable size when availability is required, or material budget miss.
4. For finalists run `$product-matcher`, `$shoe-analyzer`, `$review-summarizer`, and `$price-hunter`.
5. Rank with explicit weights based on user priorities. Keep performance fit separate from availability and price.
6. Apply [references/current-market.md](references/current-market.md).

## Output

Return no more than five finalists with user-fit score, use case, strength, weakness, sizing, community evidence, lowest live size-verified Turkey offer, and confidence.

Name the best choice, safest alternative, and value alternative. If stock is unverified, label it a model recommendation, not a currently purchasable option.
