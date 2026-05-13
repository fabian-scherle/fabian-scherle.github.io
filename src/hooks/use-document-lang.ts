import { useEffect } from "react";
import { useTranslation } from "react-i18next";

/**
 * Keeps the <html lang="..."> attribute in sync with the active i18n language.
 * Improves SEO (correct language signal) and accessibility.
 */
export const useDocumentLang = (): void => {
  const { i18n } = useTranslation();

  useEffect(() => {
    const lang = i18n.language?.substring(0, 2) || "en";
    if (document.documentElement.lang !== lang) {
      document.documentElement.lang = lang;
    }
  }, [i18n.language]);
};
