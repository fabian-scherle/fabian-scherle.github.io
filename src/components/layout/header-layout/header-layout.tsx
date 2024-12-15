import React, { useState } from 'react';
import { Menu } from 'lucide-react';
import { Container } from '../../ui/container/container';
import { LanguageSwitcher } from '../../ui/language-switcher/language-switcher';
import { NavLinksLayout } from '../nav-links-layout/nav-links-layout';
import { MobileMenu } from '../../ui/mobile-menu/mobile-menu';
import { useScrollLock } from '../../../hooks/use-scroll-lock';
import './header-layout.css';

export const HeaderLayout: React.FC = () => {
  const [isMobileMenuOpen, setIsMobileMenuOpen] = useState(false);
  useScrollLock(isMobileMenuOpen);

  return (
    <header className="header">
      <Container>
        <nav className="header-nav">
          <div className="header-content">
            <h1 className="header-title"></h1>
            <div className="header-links">
              <NavLinksLayout />
              <LanguageSwitcher />
            </div>
            <button
              className="menu-button"
              onClick={() => setIsMobileMenuOpen(true)}
              aria-label="Open menu"
            >
              <Menu className="w-5 h-5" />
            </button>
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