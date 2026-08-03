---
name: review-summarizer
description: Research and synthesize shoe reviews from independent publications, Reddit discussions, YouTube videos and transcripts, visible YouTube comments, long-term reviews, and retailer feedback. Use when the user wants real-world positives, negatives, recurring complaints, sizing themes, durability evidence, or a video summary.
---

# Review Summarizer

## Goal

Produce an auditable review synthesis that increases real user evidence without manufacturing consensus.

## Workflow

1. Confirm product identity with `$product-matcher`.
2. Search independent technical and long-term reviews, Reddit, YouTube, and retailer feedback.
3. When Agent Reach is available, run its channel health check. A conservative `warn` or empty `active_backend` is not final when the OpenCLI bridge is connected: run one read-only Reddit search smoke test, then read the strongest relevant threads and comments if it succeeds. Report the authorized route as inaccessible only after the smoke test fails. Indexed excerpts may be shown only as low-confidence leads, never as fully read threads.
4. For YouTube, prefer Agent Reach/yt-dlp transcript and bounded comment extraction. If the health check warns but a live metadata/transcript test succeeds, trust the live test and record the warning as a diagnostic mismatch. Summarize transcript/captions rather than the title; label description-only summaries; collect viewer comments separately with sample count; never infer unextracted claims.
5. Separate creator views, viewer comments, Reddit users, reviewers, and store buyers.
6. Code observations as positive, negative, mixed, or context-dependent. Track recurrence, source count, use case, and counterexamples.
7. Note sponsorship, affiliate links, samples, short test periods, and retailer bias when disclosed.
8. Apply [references/multi-source-evidence.md](references/multi-source-evidence.md).

## Output

Return evidence coverage, recurring positives, recurring negatives, mixed findings, fit/sizing, durability, Reddit synthesis with sample counts, YouTube synthesis with video/transcript/comment counts, contradictions, links, confidence, and inaccessible sources.

Use “recurring” only across multiple independent observations. Never present one comment as community consensus.
