# ShoeHunterAI price data

Read current listing state from `ProductListing`:

- `last_price`: latest observed selling price.
- `last_old_price`: latest observed crossed-out/reference price when present.
- `last_sizes_json` and `last_stock_count`: observed size/stock signal.
- `last_checked_at`: freshness timestamp.

Read historical observations from `PriceHistory`: `price`, `old_price`, `in_stock`, `size`, and `checked_at`.

Use a `WatchList` rule only for its `size`, `target_price`, and `enabled` state. A target price is a user preference, not a market-value estimate.
