# ShoeHunterAI listing data

Use this project model when linking product listings.

- `Product`: canonical product identity: `brand`, `model`, `gender`, `category`.
- `Store`: merchant identity and `driver_key`. A missing `driver_key` means no verified parser is registered.
- `ProductListing`: a store URL linked to one product. Preserve `url`, `last_title`, `last_price`, `last_old_price`, `last_sizes_json`, `last_stock_count`, and `last_checked_at`.

Create or change records only after the user or application workflow authorizes it. Preserve original merchant title and URL for auditability.
