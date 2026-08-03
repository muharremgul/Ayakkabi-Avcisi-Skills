---
name: shoe-analyzer
description: Analyze a running, trail, hiking, or daily shoe for a specific user using current official specifications, independent reviews, Reddit and YouTube evidence when accessible, and live Turkey price/size verification. Use when the user asks whether a shoe fits their terrain, distance, priorities, foot needs, budget, or requested size.
---

# Shoe Analyzer

## Goal

Produce a current, user-specific buying analysis. Treat manufacturer claims, reviewer observations, community experience, and live commerce evidence as separate evidence classes.

## Required workflow

1. Capture terrain, weekly distance, use, priorities, stability needs, fit/width, budget, country, and requested size.
2. Confirm product identity with `$product-matcher`. Do not mix generations, gender versions, GTX/non-GTX editions, or similarly named models.
3. Research official specifications and at least two independent technical review sources when available.
4. Run `$review-summarizer` for Reddit, YouTube transcripts, visible YouTube comments, long-term reviews, and retailer reviews. Report inaccessible channels.
5. Run `$price-hunter` with the user’s country and exact size. A search snippet or aggregator result never proves stock.
6. If price history or a target price is available, run `$deal-evaluator`.
7. Apply [references/research-protocol.md](references/research-protocol.md).

## Analysis model

Score only factors supported by evidence: cushioning, stability, grip by surface, fit, responsiveness, durability, value, and suitability for the user’s terrain and load.

Never convert marketing language directly into a performance score. Explain uncertainty and conflicting reports.

## Output

Return:

1. short verdict: buy, conditional buy, compare first, wait, or avoid
2. user-fit score with factor reasons
3. where it works and struggles on the user’s terrain
4. positive, negative, and mixed evidence with source counts
5. fit and size warning
6. Turkey live offers; discovery-only leads stay separate
7. meaningful alternatives
8. confidence and evidence gaps

Use “in stock” only for an exact size verified live on the merchant page during the current run.
