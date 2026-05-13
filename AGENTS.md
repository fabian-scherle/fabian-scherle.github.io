# AGENTS.md

Vite + React 18 + TypeScript portfolio site. Single-page app deployed to GitHub Pages.

## Commands

- `npm run dev` — Vite dev server
- `npm run build` — runs `tsc -b` then `vite build`. **Type errors fail the build** (no separate typecheck script).
- `npm run lint` — ESLint (flat config in `eslint.config.js`)
- `npm run preview` — preview built `dist/`

No test framework is configured. Do not invent `npm test`.

Node 20.18 (see `README.md` and CI).

## Deployment

`.github/workflows/publish.yaml` builds on push to `main` and publishes `dist/` to the **`web-page`** branch (not `gh-pages`) via `s0/git-publish-subdir-action`. Do not rename that branch without updating the workflow.

## Project layout

- `src/App.tsx` — root component, composes layout + sections
- `src/main.tsx` — entry, imports `./i18n/config` for side-effect init
- `src/components/{layout,sections,ui}/<name>/<name>.tsx` — every component lives in its own kebab-case folder with a co-located `<name>.css`. Follow this pattern when adding components.
- `src/i18n/resources/{en,es,fr}.ts` — translation strings; `index.ts` aggregates them
- `src/config/firebase.ts` — Firebase Analytics init from `VITE_FIREBASE_*` env vars
- `src/constants/projects.ts` — project list data
- `src/hooks/`, `src/utils/` — small helpers

## Conventions

- Kebab-case for files and folders, PascalCase for exported components.
- Plain CSS (no CSS-in-JS, no Tailwind). Global styles in `src/global.css`; component styles co-located.
- i18n: use `react-i18next` `useTranslation`; add new keys to all three of `en.ts`, `es.ts`, `fr.ts`.
- Icons from `lucide-react`.

## Environment

`.env` is committed and contains `VITE_FIREBASE_*` keys (public Firebase web config, safe to expose). Vite only exposes `VITE_`-prefixed vars to the client.
