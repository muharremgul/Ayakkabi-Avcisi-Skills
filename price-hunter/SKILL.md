---
name: price-hunter
description: Search Turkey-wide current shoe prices and verify exact-size availability on live merchant pages. Use for lowest verified price, stock checks, retailer and marketplace comparisons, requested-size searches, and buy/watch/wait decisions. Aggregators and search snippets are discovery leads only.
---

# Price Hunter

## Goal

Find the lowest current, directly verified offer for the correct shoe and requested size in Turkey.

## Required workflow

1. Require or clearly note the requested size system: EU, US, UK, or CM.
2. Generate exact model, SKU, color, gender/version, and size query variants.
3. Search official brands, authorized sports retailers, specialist running/trail/outdoor stores, department/sneaker stores, Turkish marketplaces, and comparison services including Akakçe, Cimri, Epey, and Google Shopping.
4. Use aggregators, snippets, shopping panels, and category listings only to discover candidate URLs.
5. Open each candidate merchant page and run `$product-matcher`.
6. Verify the requested size is selectable and enabled. When safe, confirm with a stock signal or reversible add-to-cart check; never purchase.
7. Record merchant, marketplace seller, variant, size, item price, unavoidable shipping, coupon conditions, return signal, Europe/Istanbul check time, URL, and confidence.
8. Apply [references/live-commerce.md](references/live-commerce.md).

## Stock states

- `live_size_verified`: exact size is selectable/enabled now
- `live_out_of_stock`: direct page shows the exact size unavailable
- `listing_only`: candidate found but exact-size proof is absent
- `blocked_or_unknown`: page could not be verified

Only `live_size_verified` offers compete for “lowest verified price.”

## Output

Provide lowest verified landed price, verified offers, out-of-stock findings, discovery-only/blocked leads, coverage by source group, and remaining gaps.

If no exact-size offer is verified, say “doğrulanmış stok bulunamadı”; never substitute a snippet price.
