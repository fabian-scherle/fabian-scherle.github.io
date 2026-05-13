import React, { useState, useEffect } from "react";
import { useTranslation } from "react-i18next";
import "./nav-links-layout.css";

const SECTION_IDS = ["photo", "about", "projects"];

export const NavLinksLayout: React.FC = () => {
  const { t } = useTranslation();
  const [activeSection, setActiveSection] = useState("photo");

  useEffect(() => {
    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            setActiveSection(entry.target.id);
          }
        });
      },
      { rootMargin: "-20% 0px -60% 0px", threshold: 0 },
    );

    SECTION_IDS.forEach((id) => {
      const el = document.getElementById(id);
      if (el) observer.observe(el);
    });

    return () => observer.disconnect();
  }, []);

  const links = [
    { href: "#photo", id: "photo", label: t("header.photo") },
    { href: "#about", id: "about", label: t("header.about") },
    { href: "#projects", id: "projects", label: t("header.projects") },
  ];

  return (
    <div className="nav-links">
      {links.map((link) => (
        <a
          key={link.href}
          href={link.href}
          className={`nav-link${activeSection === link.id ? " nav-link--active" : ""}`}
        >
          {link.label}
        </a>
      ))}
    </div>
  );
};
