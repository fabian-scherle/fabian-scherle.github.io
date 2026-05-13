import { defineConfig, type Plugin } from "vite";
import react from "@vitejs/plugin-react";
import { copyFileSync } from "node:fs";
import { resolve } from "node:path";

/**
 * GitHub Pages serves a SPA from a static host without rewrites.
 * Duplicating index.html as 404.html ensures unknown routes still load the app
 * (and lets GitHub return the SPA shell with a 200-ish flow for shared URLs).
 */
const githubPagesSpaFallback = (): Plugin => ({
  name: "github-pages-spa-fallback",
  apply: "build",
  closeBundle() {
    const outDir = resolve(__dirname, "dist");
    copyFileSync(resolve(outDir, "index.html"), resolve(outDir, "404.html"));
  },
});

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react(), githubPagesSpaFallback()],
  optimizeDeps: {
    exclude: [],
  },
});
