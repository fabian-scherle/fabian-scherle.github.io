import React from "react";
import { useTranslation } from "react-i18next";
import { Container } from "../../ui/container/container";
import "./contact-section.css";
import { logFirebaseAnalyticsEvent } from "../../../utils/firebase-analytics-utils";

const EMAIL = "fabianscherle99@gmail.com";

export const ContactSection: React.FC = () => {
  const { t, i18n } = useTranslation();

  const getCVPath = () => {
    logFirebaseAnalyticsEvent("download-cv-" + i18n.language.substring(0, 2));
    return `/cv/fabian-cv-${i18n.language.substring(0, 2)}.pdf`;
  };

  return (
    <footer id="contact" className="contact-section">
      <Container>
        <div className="contact-main">
          <div className="contact-lead">
            <p className="eyebrow">{t("contact.label")}</p>
            <h2 className="contact-title serif">{t("contact.title")}</h2>
            <a
              href={`mailto:${EMAIL}`}
              className="contact-email serif"
              onClick={() => logFirebaseAnalyticsEvent("go-email")}
            >
              {EMAIL}
            </a>
          </div>
          <div className="contact-links mono">
            <a
              href="https://github.com/fabbo-repo"
              target="_blank"
              rel="noopener noreferrer"
              onClick={() => logFirebaseAnalyticsEvent("go-github")}
            >
              {t("contact.github")}
            </a>
            <a
              href="https://www.linkedin.com/in/fabián-scherle-carboneres-5ba3831b5/"
              target="_blank"
              rel="noopener noreferrer"
              onClick={() => logFirebaseAnalyticsEvent("go-linkeding")}
            >
              LinkedIn
            </a>
            <a href={getCVPath()} download>
              {t("contact.downloadCV")}
            </a>
          </div>
        </div>
        <div className="contact-colophon mono">
          <span>{t("contact.location")}</span>
          <span>© {new Date().getFullYear()} Fabián Scherle Carboneres</span>
          <span className="contact-langs">EN / ES / FR</span>
        </div>
      </Container>
    </footer>
  );
};
