import { readFileSync, writeFileSync, rmSync } from "node:fs";
import { resolve, dirname } from "node:path";
import { fileURLToPath, pathToFileURL } from "node:url";

/**
 * Post-build step: takes the SSR bundle (dist-ssr/entry-server.js), renders the
 * app to an HTML string, and injects it into the client `index.html` (and the
 * GitHub Pages `404.html` fallback). This gives crawlers fully rendered content
 * on the first request; React then takes over `#root` in the browser as usual.
 */
const __dirname = dirname(fileURLToPath(import.meta.url));
const root = resolve(__dirname, "..");
const distDir = resolve(root, "dist");
const ssrEntry = resolve(root, "dist-ssr/entry-server.js");

const { render } = await import(pathToFileURL(ssrEntry).href);
const appHtml = render("es");

const rootMarker = '<div id="root"></div>';
const indexPath = resolve(distDir, "index.html");
const template = readFileSync(indexPath, "utf-8");

if (!template.includes(rootMarker)) {
  throw new Error(
    `Prerender aborted: '${rootMarker}' not found in dist/index.html`,
  );
}

const html = template.replace(rootMarker, `<div id="root">${appHtml}</div>`);

writeFileSync(indexPath, html);
writeFileSync(resolve(distDir, "404.html"), html);

// The SSR bundle is only needed for this step; drop it from the output.
rmSync(resolve(root, "dist-ssr"), { recursive: true, force: true });

console.log(
  "✓ Prerendered content injected into dist/index.html and dist/404.html",
);
