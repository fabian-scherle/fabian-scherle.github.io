import React from 'react';
import { useTranslation } from 'react-i18next';
import { X } from 'lucide-react';
import { LanguageSwitcher } from '../language-switcher/language-switcher';
import './mobile-menu.css';

interface MobileMenuProps {
  isOpen: boolean;
  onClose: () => void;
}

export const MobileMenu: React.FC<MobileMenuProps> = ({ isOpen, onClose }: MobileMenuProps) => {
  const { t } = useTranslation();

  const navLinks = [
    { href: '#photo', label: t('header.photo') },
    { href: '#about', label: t('header.about') },
    { href: '#projects', label: t('header.projects') }
  ];

  if (!isOpen) return null;

  return (
    <div className="mobile-menu-overlay">
      <div className="mobile-menu">
        <div className="mobile-menu-header">
          <h2 className="mobile-menu-title">Menu</h2>
          <button
            onClick={onClose}
            className="mobile-menu-close"
            aria-label="Close menu"
          >
            <X className="w-5 h-5" />
          </button>
        </div>
        <nav className="mobile-menu-nav">
          <ul className="mobile-menu-list">
            {navLinks.map((link) => (
              <li key={link.href} className="mobile-menu-item">
                <a
                  href={link.href}
                  onClick={onClose}
                  className="mobile-menu-link"
                >
                  {link.label}
                </a>
              </li>
            ))}
          </ul>
          <div className="mobile-menu-divider" />
          <LanguageSwitcher />
        </nav>
      </div>
    </div>
  );
};