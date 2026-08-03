---
name: product-matcher
description: Determine whether retailer, marketplace, aggregator, review, and catalogue records refer to the same shoe model and variant. Use before comparing prices, stock, ratings, or reviews across sources, especially when names, colors, gender labels, SKU codes, generations, or seller titles differ.
---

# Product Matcher

## Goal

Prevent false price and review comparisons by matching product identity conservatively.

## Workflow

1. Normalize brand, model family, generation, gender/version, waterproof status, width, colorway, and SKU/style code.
2. Open the source page when current price or stock depends on the match. Do not rely on a search title alone.
3. Prefer identifiers in this order: exact SKU; official product identifier; brand plus exact model/generation/version; reliable visual/spec evidence.
4. Treat size as offer inventory, not product identity.
5. For marketplaces, preserve seller identity separately from marketplace identity.
6. Apply [references/live-evidence.md](references/live-evidence.md).

## Match classes

- `exact_variant`
- `same_model_other_variant`
- `related_not_comparable`
- `insufficient_evidence`

Do not merge another color/width into an exact-variant comparison without labeling it. Never allow insufficient evidence into a “lowest verified price” result.

## Output

Return match class, confidence, matching identifiers, conflicts, missing fields, direct URLs, and the consequence for comparison.
