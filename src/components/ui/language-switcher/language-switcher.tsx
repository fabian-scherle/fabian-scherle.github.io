import React from 'react';
import { useTranslation } from 'react-i18next';
import { Globe } from 'lucide-react';
import './language-switcher.css';

const languages = [
  { code: 'en', name: 'English' },
  { code: 'es', name: 'Español' },
  { code: 'fr', name: 'Français' },
];

export const LanguageSwitcher: React.FC = () => {
  const { i18n } = useTranslation();

  const handleLanguageChange = (languageCode: string) => {
    i18n.changeLanguage(languageCode);
  };

  return (
    <div className="language-switcher">
      <button className="language-button">
        <Globe className="w-5 h-5" />
        <span>{languages.find(lang => lang.code === i18n.language)?.name}</span>
      </button>
      <div className="language-menu">
        {languages.map((language) => (
          <button
            key={language.code}
            onClick={() => handleLanguageChange(language.code)}
            className={`language-option ${i18n.language === language.code ? 'active' : ''
              }`}
          >
            {language.name}
          </button>
        ))}
      </div>
    </div>
  );
};