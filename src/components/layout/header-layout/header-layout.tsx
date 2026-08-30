import React, { useState } from "react";
import { useTranslation } from "react-i18next";
import { Menu } from "lucide-react";
import { Container } from "../../ui/container/container";
import { LanguageSwitcher } from "../../ui/language-switcher/language-switcher";
import { NavLinksLayout } from "../nav-links-layout/nav-links-layout";
import { MobileMenu } from "../../ui/mobile-menu/mobile-menu";
import { useScrollLock } from "../../../hooks/use-scroll-lock";
import "./header-layout.css";

export const HeaderLayout: React.FC = () => {
  const { i18n } = useTranslation();
  const [isMobileMenuOpen, setIsMobileMenuOpen] = useState(false);
  useScrollLock(isMobileMenuOpen);

  return (
    <header className="header">
      <Container>
        <nav className="header-nav">
          <div className="header-content">
            <a href="#top" className="header-title">
              Fabián Scherle
            </a>
            <div className="header-links">
              <NavLinksLayout />
              <LanguageSwitcher />
            </div>
            <div className="header-mobile">
              <span className="header-lang-current">
                {i18n.language.substring(0, 2).toUpperCase()}
              </span>
              <button
                className="menu-button"
                onClick={() => setIsMobileMenuOpen(true)}
                aria-label="Open menu"
              >
                <Menu className="menu-icon" />
              </button>
            </div>
          </div>
        </nav>
      </Container>
      <MobileMenu
        isOpen={isMobileMenuOpen}
        onClose={() => setIsMobileMenuOpen(false)}
      />
    </header>
  );
};
