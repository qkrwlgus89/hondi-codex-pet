# Hondi Sprite Specification

This repository uses the ChatGPT Pet Sprite v2 atlas layout.

## Atlas geometry

| Property | Value |
|---|---:|
| Atlas size | 1536 × 2288 px |
| Columns | 8 |
| Rows | 11 |
| Cell size | 192 × 208 px |
| Required cells | 73 |
| Unused cells | 15, fully transparent |
| Background | Transparent |
| Format | PNG |

## Row map

| Row | State | Used columns | Frames | Timing / direction |
|---:|---|---:|---:|---|
| 0 | idle | 0–5 | 6 | 280, 110, 110, 140, 140, 320 ms |
| 1 | running-right | 0–7 | 8 | 120 ms each, final frame 220 ms |
| 2 | running-left | 0–7 | 8 | 120 ms each, final frame 220 ms |
| 3 | waving | 0–3 | 4 | 140 ms each, final frame 280 ms |
| 4 | jumping | 0–4 | 5 | 140 ms each, final frame 280 ms |
| 5 | failed | 0–7 | 8 | 140 ms each, final frame 240 ms |
| 6 | waiting | 0–5 | 6 | 150 ms each, final frame 260 ms |
| 7 | running | 0–5 | 6 | 120 ms each, final frame 220 ms |
| 8 | review | 0–5 | 6 | 150 ms each, final frame 280 ms |
| 9 | look directions A | 0–7 | 8 | 000° through 157.5° clockwise |
| 10 | look directions B | 0–7 | 8 | 180° through 337.5° clockwise |

## Hondi-specific state design

- **idle:** seated dozing loop with eyelid closure and a gentle head dip.
- **running-right / running-left:** directional walking while holding one tangerine in the mouth.
- **waving:** a friendly front-paw greeting.
- **jumping:** anticipation, lift, airborne peak, descent, and landing.
- **failed:** ears and head droop before returning to neutral.
- **waiting:** one front paw is raised in an expectant pose.
- **running:** focused seated task-processing motion; it is not literal running.
- **review:** subtle lean, blink, and head tilt.
- **look directions:** seated body stays anchored while the eyes, nose, head, and ears follow the target.

## Integrity checks

- Do not resize the atlas.
- Do not crop transparent padding around the atlas.
- Do not populate unused cells.
- Do not change cell order.
- Preserve the alpha channel.
- Re-run structural validation after any image edit.

## Final file

- Path: `assets/hondi-spritesheet-v2.png`
- SHA-256: `8b2de2ac6ef0e65a03557fb95b2c25ba4c2b8b04747e55f8827241367cf62ace`
