# Portfolio redesign: "Editorial Ink"

Design sources for the proposed redesign of this site. Nothing here is built or
served: `design/` is outside `tsconfig.app.json`'s `include` (which is just
`src`) and outside Vite's roots, so it has no effect on `pnpm build`.

The live canvas, where the design can be viewed, tweaked element by element and
exported to PNG or PDF:

**https://claude.ai/code/artifact/18e5f21e-5507-472e-80f3-be631de4e5f4**

## What's in here

| File | What it is |
| --- | --- |
| `Main.dc.html` | The redesign, desktop, 1440px wide. The deliverable. |
| `Mobile.dc.html` | The same page at 390px. |
| `Current.dc.html` | Today's site, rebuilt from `src/` at exact values, kept for before/after comparison. |
| `canvas.json` | Frame positions, sizes and the sticky notes on the canvas. |
| `*.png`, `profile.webp` | Downsampled copies of the images the artboards use. |

Each `.dc.html` is a self-contained page and opens in a browser on its own. The
`<script src="./support.js">` line in the head is a placeholder the canvas
runtime swaps out; ignore it, and do not remove it.

The images are local copies so the artboards render standalone. `profile.webp`
is `public/images/profile.webp` scaled to 468x520. The logos are the remote URLs
in `src/constants/projects.ts`, scaled to 160px.

## Regenerating the canvas

The artboards are the source of truth. To change the design, edit them here,
then run `/design` in Claude Code from the repo root and ask it to re-seed the
canvas from `design/` and republish to the URL above. Editing the canvas in the
browser and saving also works, but then these files are behind: pull the changes
back down before the next edit from here, or they get overwritten.

## The visual system

For when this gets implemented in `src/`.

**Type.** Three faces from Google Fonts. Instrument Serif for display
(fallback Georgia), Instrument Sans for body (fallback Segoe UI), JetBrains Mono
for metadata, labels and dates (fallback Cascadia Mono, Consolas).

Scale, desktop: name 104px/0.9, section headings 52px, project names 30px,
lead paragraph 21px, expertise titles 20px, body 15.5px, small body 15px,
mono labels 11px to 12px with 0.09em to 0.16em tracking.

**Colour.**

| Role | Value |
| --- | --- |
| Paper (page) | `#f7f4ee` |
| Paper deep (experience band) | `#efeae1` |
| Card / thumbnail well | `#fffdf9` |
| Ink (headings, dark bands, footer) | `#17150f` |
| Body text | `#3d392f` |
| Secondary text | `#5a554a` |
| Muted text | `#8b8475` |
| Rule | `#ddd6c9` |
| Rule on ink | `#35312a` |
| Text on ink | `#b9b2a1` |
| Accent | `#b04a26` |

The accent is the one lever: it is a tweak chip above the desktop artboard, with
`#b04a26` (rust, current default), `#3033c0` (the site's existing indigo),
`#1f6f5c` (green) and `#7a5c1e` (ochre) as swatches. In the artboard it is set
once as `--accent` on the page wrapper and read as `var(--accent, #b04a26)`
everywhere else, which maps cleanly onto the existing `--color-accent` token in
`src/global.css`.

`body` is ink and the page wrapper is paper, so a frame taller than the content
reads as more footer rather than as a pale strip. Keep that if you change the
artboard heights.

**Layout.** 120px side padding on a 1440px frame, so 1200px of content. Sections
run 88px top and bottom. Rows are separated by 1px rules, not by cards or
shadows. Everything is flex or grid with `gap`.

**Page order.** Bar, hero, keyword band on ink, Expertise (4 rows), Things I've
made (7 project rows), Where I've worked (4 rows), Contact on ink.

## What changes versus the current site

- The three icon cards in `about-section` become four typographic expertise rows
  with keyword chips, no icons.
- The project card grid becomes one numbered list, all seven at equal weight,
  each with its logo in a 72px bordered square.
- **New: an experience section**, from `public/cv/fabian-cv-en.json`.
- **New: a contact footer** with the email address.
- Circular avatar becomes a rectangular portrait with an offset accent frame.

## Still open

- **Copy is English only.** `es.ts` and `fr.ts` need the new keys before this
  ships, including the two new sections.
- **Todo App and Currency Conversion API share the generic GitHub logo** as
  their thumbnail. It shows more in a single column than it did in the grid.
- **The AWS Solutions Architect certification is not on the page.** It was
  removed along with the education and languages block. It is the credential
  most likely to be filtered on by name.
- **The headline does not match the CV.** `en.ts` says "Full Stack Developer and
  Software Architect", the CV says "Software Engineer". The artboards use the
  CV's.
- **The email is now public on the page.** Worth a decision before it ships.
- No em dashes anywhere in the copy, by preference. Date ranges read
  "Since 2025" and "2022 to 2024".
