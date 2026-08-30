import React from "react";
import { useTranslation } from "react-i18next";
import "./language-switcher.css";

const languages = [
  { code: "en", label: "EN", name: "English" },
  { code: "es", label: "ES", name: "Español" },
  { code: "fr", label: "FR", name: "Français" },
];

/**
 * Three inline codes rather than a dropdown: with only three languages the
 * menu cost more taps than it saved, and the row fits the header rule.
 */
export const LanguageSwitcher: React.FC = () => {
  const { i18n } = useTranslation();
  const current = i18n.language.substring(0, 2);

  return (
    <div className="language-switcher">
      {languages.map((language) => (
        <button
          key={language.code}
          type="button"
          onClick={() => i18n.changeLanguage(language.code)}
          className={`language-option${current === language.code ? " language-option--active" : ""}`}
          aria-label={language.name}
          aria-current={current === language.code ? "true" : undefined}
        >
          {language.label}
        </button>
      ))}
    </div>
  );
};
