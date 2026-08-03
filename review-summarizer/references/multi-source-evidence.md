# Multi-source review evidence

## Required source mix

Check the exact model across:

- independent lab/technical sources, including RunRepeat when covered
- specialist reviews such as RoadTrailRun, Doctors of Running, OutdoorGearLab, iRunFar, Believe in the Run, and relevant local specialists
- long-term field tests
- Reddit threads and replies when directly readable
- YouTube transcripts/captions and separately sampled visible comments
- verified-purchase retailer reviews

Absence from one named source is not a failure. Replace it with an equivalent independent source and disclose coverage.

## Counting

Count sources, threads, videos, and comments separately. Deduplicate copied reviews and repeated publisher material. Do not count a search snippet as a read review.

## Theme strength

- isolated: one observation
- repeated: at least two independent observations
- strong recurring: multiple sources and contexts
- disputed: meaningful positive and negative evidence

Always preserve context: runner weight, pace, terrain, distance, fit, and test duration.

## YouTube

Prefer full transcript/captions. Label automatic captions. A title or description is insufficient for detailed claims. Viewer comments are a separate, potentially biased sample.

When Agent Reach is installed, use its YouTube route to extract metadata, captions, and a bounded comment sample. A successful metadata call alone does not mean the transcript or comments were read. If `doctor` warns about configuration but a live extraction succeeds, record the live extraction as working and note the diagnostic mismatch.

## Reddit

Read thread body and comments through an available authorized route. If unavailable, say so and rely on other independent evidence; do not relabel search excerpts as Reddit analysis.

When Agent Reach is installed:

1. run `agent-reach doctor --json`
2. if Reddit is `ok` with an active backend, use it
3. if OpenCLI bridge/extension is connected but Reddit remains `warn` or has no active backend, run one read-only `opencli reddit search` smoke test
4. if search succeeds, use `opencli reddit read POST_ID` for the selected threads and comments
5. if it fails, run the documented retry once and then use the independent-source fallback

Agent Reach routes an existing authorized session but does not create a Reddit login. Never expose cookies or authentication values.

For each Reddit synthesis, report query, threads read, comments sampled, subreddit mix, dates, and recurring/contradictory themes.
