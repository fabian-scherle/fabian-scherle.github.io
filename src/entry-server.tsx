import { renderToStaticMarkup } from "react-dom/server";
import { I18nextProvider, initReactI18next } from "react-i18next";
import { createInstance } from "i18next";
import { resources } from "./i18n/resources";
import App from "./App";

/**
 * Renders the full app to a static HTML string at build time so search engine
 * crawlers receive real, indexable content instead of an empty `<div id="root">`.
 *
 * A dedicated i18n instance with a fixed language (Spanish by default, matching
 * the canonical URL and `<html lang>`) is used so the prerendered output is
 * deterministic and does not depend on browser language detection.
 */
export function render(lng: string = "es"): string {
  const instance = createInstance();
  instance.use(initReactI18next).init({
    resources,
    lng,
    fallbackLng: "en",
    interpolation: { escapeValue: false },
  });

  return renderToStaticMarkup(
    <I18nextProvider i18n={instance}>
      <App />
    </I18nextProvider>,
  );
}
