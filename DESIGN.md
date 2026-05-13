# DESIGN

Design notes for the portfolio site. Source of truth is the code in `src/`; this document summarizes the visual system and component composition.

## Goals

- Single-page, scroll-based personal portfolio with three sections: photo/intro, about, projects.
- Lightweight: no UI framework, no CSS-in-JS, no Tailwind. Plain CSS with CSS custom properties.
- Multilingual (EN / ES / FR) with auto-detection via `i18next-browser-languagedetector`.
- Mobile-first responsive layout with a single `768px` breakpoint (plus `1024px` for the projects grid).

## Visual language

### Color tokens

Defined in `src/global.css` on `:root`:

| Token | Value | Typical use |
| --- | --- | --- |
| `--color-primary` | `#1a1a1a` | Default body text |
| `--color-secondary` | `#4a4a4a` | Reserved (not currently referenced by components) |
| `--color-background` | `#ffffff` | Page background |
| `--color-gray-50` | `#f9fafb` | `about-section` background, `project-card` background |
| `--color-gray-100` | `#f3f4f6` | Header border, hover backgrounds, secondary button |
| `--color-gray-200` | `#e5e7eb` | Hover state for secondary surfaces |
| `--color-gray-600` | `#4b5563` | Muted text, icon color |
| `--color-gray-700` | `#374151` | Skill icons, project link text |
| `--color-gray-800` | `#1f2937` | Primary button hover |
| `--color-gray-900` | `#111827` | Headings, primary button background |

The palette is intentionally monochrome — no accent or brand color. All emphasis comes from contrast between gray shades and the white background.

### Typography

- System font stack declared on `body`: `-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif`.
- No web fonts are loaded — keeps the bundle minimal and first paint fast.
- `line-height: 1.5` on body.
- Type scale (rem, observed in components):
  - Section heading: `1.5rem` mobile → `2rem` ≥ 768px (`heading.css`)
  - Profile title: `2rem`
  - Profile description: `1.125rem`
  - Skill / project titles: `1.125rem`
  - Body / descriptions: `0.875rem` – `1rem`
- Weight: `bold` for headings, `600` for card titles, `500` for buttons.

### Spacing & radius

- Global reset zeroes `margin` / `padding` and sets `box-sizing: border-box` on `*`.
- Section vertical padding: `4rem 0` (`.section` utility and section CSS).
- Card / button radius: `0.5rem`. Profile image is a full circle (`border-radius: 50%`).
- Card inner padding: `1rem` – `1.5rem`.
- Shadows are minimal: `0 1px 2px 0 rgba(0,0,0,0.05)` for resting cards, `0 4px 6px -1px rgba(0,0,0,0.1)` for hover/profile image.

### Motion

- Single transition pattern: `transition: all 0.2s` (or specific property variants) on buttons, links, and cards.
- No keyframed animations.

## Layout system

### Container

`Container` (`src/components/ui/container/container.tsx`) wraps content in a `.container` class defined globally:

- `max-width: 1200px`
- horizontal padding `1.5rem`
- centered with `margin: 0 auto`

### Section

`Section` (`src/components/ui/section/section.tsx`) renders a `<section>` with `py-16` plus an optional id and className. Each section file owns its own background and refined spacing — the wrapper just provides semantics and an anchor target (`#photo`, `#about`, `#projects`).

### Responsive strategy

Mobile-first. Two breakpoints in use:

- `@media (min-width: 768px)` — switches header nav from hidden to inline, photo section from stacked to side-by-side, skills grid to 3 columns, projects grid to 2 columns, heading font scales up.
- `@media (min-width: 1024px)` — projects grid grows to 3 columns.

There is no explicit dark mode; the design is light-theme only.

## Page composition

`App.tsx` mounts the page:

```
IndexLayout
├─ HeaderLayout       (fixed, blurred backdrop)
└─ <main>
   ├─ PhotoSection    (#photo)    — intro, profile image, CV download, LinkedIn
   ├─ AboutSection    (#about)    — 3 skill cards
   └─ ProjectsSection (#projects) — N project cards from constants/projects.ts
```

### Header

`HeaderLayout`:
- `position: fixed`, full width, `z-index: 40`.
- Semi-transparent white background (`rgba(255,255,255,0.9)`) with `backdrop-filter: blur(8px)`.
- 1px bottom border in `--color-gray-100`.
- Desktop (`≥ 768px`): inline `NavLinksLayout` + `LanguageSwitcher`. Hamburger button hidden.
- Mobile (`< 768px`): hamburger only, opens `MobileMenu` overlay. `useScrollLock` freezes body scroll while open.

### Photo section

- Minimum height `70vh`, centered content, extra top padding (`5rem`) to clear the fixed header.
- Layout flips from column (centered) on mobile to row (left-aligned, `gap: 4rem`) at `≥ 768px`.
- Profile image: circular, `8rem × 8rem`, soft shadow.
- Primary CTA: `Button` (renders as `<a download>` when `href` is provided) pointing at `/cv/cv_{lang}.pdf`. Secondary action: LinkedIn external link.

### About section

- `--color-gray-50` background to visually separate from neighbors.
- Three skill cards (Software Development / Cloud / Software Architecture). The TS key `uiUx` is retained for backwards compatibility; the human-facing string is "Cloud". Each card pairs a `lucide-react` icon with title + description, all translated.
- Grid: 1 column on mobile, 3 equal columns at `≥ 768px`.

### Projects section

- White background.
- Cards are data-driven from `src/constants/projects.ts`; copy comes from `projects.items.<id>.{title,description}` in each locale file.
- Card structure: image area (`6rem` tall, centered, white background) over content (title, 3-line clamped description via `-webkit-line-clamp: 3`, external link with `ExternalLink` icon).
- Grid: 1 → 2 (`≥ 768px`) → 3 (`≥ 1024px`) columns.

## UI primitives

Reusable building blocks live in `src/components/ui/`:

| Component | Responsibility | Notes |
| --- | --- | --- |
| `Button` | Primary CTA. Renders `<a download>` if `href` is set, otherwise `<button>`. | Variants: `primary` (dark) / `secondary` (gray). Optional trailing `Download` icon. |
| `Heading` | `<h2 class="heading">` with responsive font size and bottom margin. | Used as the section title. |
| `Section` | Semantic wrapper with `py-16` and optional id/className. | Anchor targets for nav links. |
| `Container` | `.container` width clamp + horizontal padding. | Used inside every section. |
| `LanguageSwitcher` | Globe icon button revealing EN / ES / FR options, syncs `i18n.changeLanguage`. | Active language gets the `.active` class. |
| `MobileMenu` | Full-screen overlay with nav links + language switcher, dismissed on link click. | Returns `null` when `isOpen` is false. |

## Component conventions

- Each component lives in its own kebab-case folder: `<name>/<name>.tsx` plus a co-located `<name>.css`. CSS is imported at the top of the `.tsx` file (e.g. `import './button.css'`).
- Components are exported as named `React.FC` (PascalCase) — no default exports except `App`.
- Props are declared inline with a local `interface` and destructured with explicit type annotations.
- Icons come exclusively from `lucide-react`. Icon sizing uses utility classes `.w-5 / .h-5` (1.25rem) defined in `global.css`, or component-specific classes like `.skill-icon` / `.button-icon`.
- No styling props are accepted beyond an optional `className` passthrough — variants are explicit (e.g. `Button.variant`).

## Internationalization

- `src/i18n/config.ts` configures `i18next` with browser language detection and a fallback of `en`.
- Translation namespaces are flat: `header`, `photo`, `about`, `projects`. All UI strings come from `useTranslation().t(...)`; no hard-coded copy in components except section ids and the developer's name in the LinkedIn URL.
- Project descriptions are looked up dynamically by id: `t(\`projects.items.\${project.id}.title\`)`. Adding a project requires both a `constants/projects.ts` entry **and** matching keys in all three locale files.
- CV file naming mirrors the language code: `/cv/cv_en.pdf`, `/cv/cv_es.pdf`, `/cv/cv_fr.pdf` under `public/`.

## SEO & metadata

- `useMeta` hook (`src/hooks/use-meta.ts`) imperatively sets `document.title` and the `<meta name="description">` content via helpers in `src/utils/seo-utils.ts`. There is no `react-helmet` dependency.
- `App.tsx` calls `useMeta` once on mount with a fixed Spanish description string — this is **not** translated, by design or oversight.

## Analytics

- Firebase Analytics is initialized lazily in `src/config/firebase.ts` from `VITE_FIREBASE_*` env vars.
- Three events are logged today, all via `logFirebaseAnalyticsEvent` in `src/utils/firebase-analytics-utils.ts`:
  - `download-cv-{lang}` when the CV link is clicked.
  - `go-linkeding` (sic) when the LinkedIn link is clicked.
  - `go-project-{projectId}` when a project link is clicked.

## Assets

- Static assets live in `public/` and are referenced with absolute paths from the site root (e.g. `/images/profile.webp`, `/cv/cv_en.pdf`).
- Project thumbnails are external URLs (GitHub avatars / raw images) defined in `constants/projects.ts`. These are not self-hosted, so availability depends on the upstream repos.

## Extending the design

When adding new UI:

1. Create a kebab-case folder under `src/components/{ui|layout|sections}/<name>/` with `<name>.tsx` + `<name>.css`.
2. Reuse color tokens from `:root`; do not introduce new hex values without adding them as variables in `global.css`.
3. Use `Container` for horizontal layout, `Section` for new scroll targets, `Heading` for section titles.
4. Add user-facing strings to all three locale files (`en.ts`, `es.ts`, `fr.ts`) under the matching key.
5. Source icons from `lucide-react` — don't bring in another icon set.
