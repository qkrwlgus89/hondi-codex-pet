# Hondi — Jeju Dog Codex Pet

[한국어](README.md) · [English](README.en.md) · [日本語](README.ja.md) · [简体中文](README.zh-CN.md)

![Hondi animation preview](assets/previews/all-states.gif)

Hondi is a custom Codex/ChatGPT Work pet based on the native Jeju dog mascot from **Omeong Gameong**, a pet-friendly travel service for Jeju Island.

Only the fur immediately around the mouth is slightly darker. When idle, Hondi sits and gently nods off. When dragged, Hondi walks while carrying a tangerine in its mouth.

> This is an independently created custom pet. It is not an official OpenAI character or official OpenAI distribution.

## Key animations

| Context | Animation |
|---|---|
| Idle | Sits, slowly closes its eyes, and gently nods off |
| Drag right | Walks toward screen-right with a tangerine in its mouth |
| Drag left | Uses the same gait and tangerine while moving screen-left |
| Waiting for input | Raises one front paw and patiently waits |
| Working | Stays seated and makes small focused eye and paw movements |
| Review | Leans and tilts its head to inspect the result |
| Look tracking | Sixteen clockwise look directions |

### Requested animation previews

| Sitting and dozing | Walking with a tangerine |
|---|---|
| ![Idle dozing](assets/previews/idle-dozing.gif) | ![Tangerine walk](assets/previews/drag-right-tangerine.gif) |

## Repository contents

```text
.
├── README.md
├── README.en.md
├── README.ja.md
├── README.zh-CN.md
├── LICENSE.md
├── CHANGELOG.md
├── pet-metadata.json
├── assets/
│   ├── hondi-spritesheet-v2.png
│   ├── hondi-contact-sheet.png
│   ├── previews/
│   └── stills/
└── docs/
    ├── SPRITE_SPEC.md
    ├── validation.json
    └── quality-report.json
```

## Sprite specification

| Item | Value |
|---|---|
| Version | ChatGPT Pet Sprite v2 |
| Format | Transparent PNG |
| Atlas size | 1536 × 2288 px |
| Grid | 8 columns × 11 rows |
| Cell size | 192 × 208 px |
| Required frames | 73 |
| Standard states | 9 |
| Look directions | 16 |
| SHA-256 | `8b2de2ac6ef0e65a03557fb95b2c25ba4c2b8b04747e55f8827241367cf62ace` |

See [SPRITE_SPEC.md](docs/SPRITE_SPEC.md) for row order and frame timing.

## Usage

1. Download the [final sprite sheet](assets/hondi-spritesheet-v2.png).
2. Select the PNG in a Codex/ChatGPT Work environment that supports custom pet uploads.
3. Do not resize the image or remove its transparency before upload.
4. Use the GIF or MP4 files under `assets/previews` to review the motion.

## Validation

- Passed v2 structural validation
- All 73 required frames are populated
- All 15 unused cells are fully transparent
- 34 px jump lift and 0 px landing-baseline error
- Maximum look-direction center drift: 4 px
- Passed the final Pets preflight

Detailed results are included in [validation.json](docs/validation.json) and [quality-report.json](docs/quality-report.json).

## License

No open-source license is currently granted for the character or image assets. Redistribution, commercial use, and derivative works require permission from the rights holder. See [LICENSE.md](LICENSE.md).

## Credits

- Character: Hondi
- Project: Omeong Gameong
- Concept: Pet-friendly travel on Jeju Island
- Artwork workflow: AI-assisted generation and manual QA
