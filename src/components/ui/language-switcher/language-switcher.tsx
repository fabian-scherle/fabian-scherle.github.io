import React, { useState, useRef, useEffect } from "react";
import { useTranslation } from "react-i18next";
import { Globe } from "lucide-react";
import "./language-switcher.css";

const languages = [
  { code: "en", name: "English" },
  { code: "es", name: "Español" },
  { code: "fr", name: "Français" },
];

export const LanguageSwitcher: React.FC = () => {
  const { i18n } = useTranslation();
  const [isOpen, setIsOpen] = useState(false);
  const containerRef = useRef<HTMLDivElement>(null);

  const handleLanguageChange = (languageCode: string) => {
    i18n.changeLanguage(languageCode);
    setIsOpen(false);
  };

  // Close on outside click
  useEffect(() => {
    const handleOutside = (e: MouseEvent) => {
      if (
        containerRef.current &&
        !containerRef.current.contains(e.target as Node)
      ) {
        setIsOpen(false);
      }
    };
    document.addEventListener("mousedown", handleOutside);
    return () => document.removeEventListener("mousedown", handleOutside);
  }, []);

  return (
    <div className="language-switcher" ref={containerRef}>
      <button
        className="language-button"
        onClick={() => setIsOpen((v) => !v)}
        aria-haspopup="listbox"
        aria-expanded={isOpen}
      >
        <Globe className="w-5 h-5" />
        <span>
          {languages.find((lang) => lang.code === i18n.language)?.name}
        </span>
      </button>
      <div
        className={`language-menu${isOpen ? " language-menu--open" : ""}`}
        role="listbox"
      >
        {languages.map((language) => (
          <button
            key={language.code}
            onClick={() => handleLanguageChange(language.code)}
            className={`language-option${i18n.language === language.code ? " active" : ""}`}
            role="option"
            aria-selected={i18n.language === language.code}
          >
            {language.name}
            {i18n.language === language.code && (
              <span className="language-check">✓</span>
            )}
          </button>
        ))}
      </div>
    </div>
  );
};
