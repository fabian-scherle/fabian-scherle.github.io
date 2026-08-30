import React from "react";
import { useTranslation } from "react-i18next";
import { X } from "lucide-react";
import { LanguageSwitcher } from "../language-switcher/language-switcher";
import "./mobile-menu.css";

interface MobileMenuProps {
  isOpen: boolean;
  onClose: () => void;
}

const SECTION_IDS = ["expertise", "work", "experience", "contact"];

export const MobileMenu: React.FC<MobileMenuProps> = ({
  isOpen,
  onClose,
}: MobileMenuProps) => {
  const { t } = useTranslation();

  const navLinks = SECTION_IDS.map((id) => ({
    href: `#${id}`,
    label: t(`header.${id}`),
  }));

  return (
    <div
      className={`mobile-menu-overlay${isOpen ? " mobile-menu-overlay--open" : ""}`}
      aria-hidden={!isOpen}
      onClick={(e) => {
        if (e.target === e.currentTarget) onClose();
      }}
    >
      <div
        className={`mobile-menu${isOpen ? " mobile-menu--open" : ""}`}
        role="dialog"
        aria-modal="true"
      >
        <div className="mobile-menu-header">
          <span className="mobile-menu-title">Fabián Scherle</span>
          <button
            onClick={onClose}
            className="mobile-menu-close"
            aria-label="Close menu"
          >
            <X className="mobile-menu-close-icon" />
          </button>
        </div>
        <nav className="mobile-menu-nav">
          <ul className="mobile-menu-list">
            {navLinks.map((link) => (
              <li key={link.href}>
                <a
                  href={link.href}
                  onClick={onClose}
                  className="mobile-menu-link serif"
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
