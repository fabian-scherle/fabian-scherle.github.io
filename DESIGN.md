# DESIGN

Design notes for the portfolio site. Source of truth is the code in `src/`; this
document summarizes the visual system and component composition.

The design this implements was drafted on a canvas first. Its artboards live in
[`design/`](design/README.md), which also records the open decisions.

## Goals

- Single-page, scroll-based personal portfolio: hero, expertise, work,
  experience, contact.
- Lightweight: no UI framework, no CSS-in-JS, no Tailwind. Plain CSS with CSS
  custom properties.
- Multilingual (EN / ES / FR) with auto-detection via
  `i18next-browser-languagedetector`.
- Mobile-first responsive layout with breakpoints at `768px` and `1200px`.
- Editorial rather than card-based: content is separated by 1px rules and
  whitespace, not by boxes and shadows.

## Visual language

### Color tokens

Defined in `src/global.css` on `:root`:

| Token | Value | Typical use |
| --- | --- | --- |
| `--color-paper` | `#f7f4ee` | Page background (on `.app`) |
| `--color-paper-deep` | `#efeae1` | Experience section, row hover |
| `--color-surface` | `#fffdf9` | Project thumbnail wells |
| `--color-ink` | `#17150f` | Headings, keyword band, contact footer, `body` |
| `--color-text` | `#3d392f` | Body copy |
| `--color-text-secondary` | `#5a554a` | Nav links, keyword chips |
| `--color-text-muted` | `#8b8475` | Dates, roles, project tags |
| `--color-on-ink` | `#b9b2a1` | Text on the ink surfaces |
| `--color-rule` | `#ddd6c9` | Every row and section divider |
| `--color-rule-ink` | `#35312a` | Dividers on ink |
| `--color-accent` | `#b04a26` | Eyebrow squares, indices, active nav, hover |
| `--color-accent-hover` | `#8f3a1c` | Reserved for accent-on-accent states |

The accent is deliberately scarce: small squares, two-digit indices, the active
nav underline, and link hover. Nothing large is painted with it.

**`body` is ink, `.app` is paper.** A viewport taller than the document then
reads as more footer rather than as a pale strip under it. Keep that pairing.

### Typography

Three families, loaded from Google Fonts in `index.html` with `display=swap`.
Each has a metric-near fallback so the first paint is readable.

| Token | Family | Used for |
| --- | --- | --- |
| `--font-display` | Instrument Serif, Georgia | Name, section titles, project names |
| `--font-body` | Instrument Sans, Segoe UI | Body copy, buttons, subheadings |
| `--font-mono` | JetBrains Mono, Consolas | Labels, indices, dates, tags, nav |

Type scale at `≥1200px`: name `6.5rem`, section titles `3.25rem`, project names
`1.875rem`, hero lead `1.3125rem`, section body `0.96875rem`, mono labels
`0.6875rem`–`0.75rem` with `0.06em`–`0.16em` tracking.

This is a change from the previous system, which used the platform font stack
and loaded no web fonts. The tradeoff is deliberate: two network requests for
the typographic identity the design rests on.

### Spacing & radius

- `--page-gutter` steps `1.5rem` → `3rem` → `7.5rem`, so a 1440px viewport gives
  1200px of content, matching the artboards.
- `--section-gap` steps `2.75rem` → `4rem` → `5.5rem`, applied by `.section`.
- `--header-height` is the scroll-margin for every anchor target.
- **No border radius anywhere.** Squared corners are part of the direction.
- Shadows are not used. Separation comes from rules and background tone.

### Motion

- `fade-in-up` on scroll via `useInView`, with `stagger-children` delays of 80ms.
- Colour and background transitions of `0.2s` on interactive elements.
- Everything is disabled under `prefers-reduced-motion`.

## Layout system

`Container` clamps to `90rem` and applies `--page-gutter`. The `.container` rule
lives in `global.css` and is the single definition; the component adds nothing.

`Section` renders a `<section>` with `.section` padding, an optional id, and
`scroll-margin-top: var(--header-height)`.

## Page composition

```
IndexLayout
├─ HeaderLayout           (fixed, blurred paper backdrop)
├─ <main>
│  ├─ PhotoSection        (#top)         hero: eyebrow, name, lead, actions, portrait
│  ├─ KeywordBand                        ink strip of product names
│  ├─ AboutSection        (#expertise)   4 typographic rows with keyword chips
│  ├─ ProjectsSection     (#work)        7 numbered project rows
│  └─ ExperienceSection   (#experience)  4 role rows on paper-deep
└─ ContactSection         (#contact)     ink footer, email, links, colophon
```

### Header

- `position: fixed`, `z-index: 40`, paper at 92% with `backdrop-filter: blur(8px)`.
- Desktop (`≥768px`): `NavLinksLayout` + `LanguageSwitcher` inline.
- Mobile: current language code plus a hamburger opening `MobileMenu`.
  `useScrollLock` freezes body scroll while open.
- `NavLinksLayout` tracks the scrolled section with an `IntersectionObserver` and
  underlines it in accent. `SECTION_IDS` is in page order.

### Hero

- Portrait first on mobile, second on desktop, via flex `order`.
- Rectangular, not circular. An offset 1px accent frame sits behind it at
  `≥768px` only, where the gutter has room for the overhang.
- Actions are full width and stacked on mobile, inline from `768px`.

### Expertise

- Four rows from `src/constants/expertise.ts`, driven by id. Titles and
  descriptions are translated; keywords are product names and are not.
- The three lucide icon cards this replaced are gone. No icons in this section.

### Work

- Seven rows from `src/constants/projects.ts`, all at equal weight.
- **The whole row is the anchor**, so the hit target is the full list width.
- Thumbnails render at 72px in a bordered well; images are still the remote URLs
  in `projects.ts`.
- The "view" affordance is hidden below `768px`, where the row itself is the tap
  target and the label would only add noise.

### Experience

- Four roles from `src/constants/experience.ts`, most recent first. Company names
  are fixed; period, role and description are translated so they read naturally.
- `--color-paper-deep` background to pace the scroll between two paper sections.

### Contact

- A `<footer>` on ink, outside `<main>`, carrying the email, GitHub, LinkedIn and
  the CV, plus a colophon.

## UI primitives

| Component | Responsibility | Notes |
| --- | --- | --- |
| `Button` | Primary CTA. Renders `<a download>` if `href` is set. | `primary` (ink fill) / `secondary` (rule outline). Optional `Download` icon. |
| `Heading` | Section head: serif title plus an optional `label` eyebrow. | Stacked on mobile, title and label on one line from `768px`. |
| `Section` | Semantic wrapper with section padding and scroll margin. | Anchor targets for nav links. |
| `Container` | Width clamp plus gutter. | Used inside every section. |
| `KeywordBand` | The ink strip under the hero. | `aria-hidden`: every name is repeated in context below. |
| `LanguageSwitcher` | Three inline codes, EN / ES / FR. | Replaced the globe dropdown: fewer taps for three options. |
| `MobileMenu` | Sheet from the top with nav links and languages. | Dismissed on link click or backdrop click. |

## Component conventions

- Each component lives in its own kebab-case folder: `<name>/<name>.tsx` plus a
  co-located `<name>.css`, imported at the top of the `.tsx`.
- Components are exported as named `React.FC` (PascalCase); no default exports
  except `App`.
- Icons come exclusively from `lucide-react`, sized by a component-scoped class
  (`.menu-icon`, `.work-cta-icon`, `.button-icon`), not by global utilities.
- Tap targets are at least `2.75rem` (44px) on every control.
- Reuse the tokens in `:root`; do not introduce raw hex values in component CSS.

## Internationalization

- `src/i18n/config.ts` configures `i18next` with browser language detection and a
  fallback of `en`.
- Namespaces: `header`, `hero`, `about`, `projects`, `experience`, `contact`.
- List content is looked up by id: `t(\`about.areas.\${area.id}.title\`)`,
  `t(\`experience.items.\${role.id}.period\`)`,
  `t(\`projects.items.\${project.id}.title\`)`. Adding an entry needs both a
  constants entry **and** matching keys in all three locale files.
- Periods are translated strings ("Since 2025" / "Desde 2025" / "Depuis 2025")
  rather than formatted dates, so each locale reads naturally.
- **No em dashes in copy**, by preference. Ranges read "2022 to 2024".
- CV file naming mirrors the language code: `/cv/fabian-cv-{en,es,fr}.pdf`.

## SEO & metadata

- `index.html` carries the title, description, Open Graph, Twitter and JSON-LD.
- `scripts/prerender.mjs` renders the app to static HTML at build time and injects
  it into `dist/index.html` and `dist/404.html`, so crawlers get real content.
  The client uses `createRoot`, not `hydrateRoot`, so the markup is replaced
  rather than hydrated.
- **Open:** the metadata still says "Desarrollador Full Stack y Arquitecto de
  Software" while the page and the CV both say "Software Engineer". Changing the
  `<title>` moves what shows in search results, so it is left as a decision.

## Analytics

- Firebase Analytics is initialized lazily in `src/config/firebase.ts`.
- Events via `logFirebaseAnalyticsEvent`: `download-cv-{lang}`, `go-linkeding`
  (sic), `go-github`, `go-email`, `go-project-{projectId}`.

## Assets

- Static assets live in `public/`, referenced from the site root.
- Project thumbnails are still external URLs (GitHub avatars / raw images) in
  `constants/projects.ts`, so availability depends on the upstream repos. Two
  projects share the generic GitHub logo, which shows more in a single column
  than it did in the old grid.

## Extending the design

1. Create a kebab-case folder under `src/components/{ui|layout|sections}/<name>/`
   with `<name>.tsx` + `<name>.css`.
2. Reuse tokens from `:root`; do not introduce new hex values without adding them
   as variables in `global.css`.
3. Use `Container`, `Section` and `Heading` rather than re-deriving their spacing.
4. Separate with rules and tone, not with cards, radii or shadows.
5. Add strings to all three locale files under the matching key.
6. Source icons from `lucide-react`.
