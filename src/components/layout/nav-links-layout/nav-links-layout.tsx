import React from 'react';
import { useTranslation } from 'react-i18next';
import './nav-links-layout.css';

export const NavLinksLayout: React.FC = () => {
  const { t } = useTranslation();

  const links = [
    { href: '#photo', label: t('header.photo') },
    { href: '#about', label: t('header.about') },
    { href: '#projects', label: t('header.projects') }
  ];

  return (
    <div className="nav-links">
      {links.map((link) => (
        <a
          key={link.href}
          href={link.href}
          className="nav-link"
        >
          {link.label}
        </a>
      ))}
    </div>
  );
};