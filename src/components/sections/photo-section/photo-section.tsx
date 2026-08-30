import React from "react";
import { useTranslation } from "react-i18next";
import { Button } from "../../ui/button/button";
import { Container } from "../../ui/container/container";
import { Section } from "../../ui/section/section";
import { useInView } from "../../../hooks/use-in-view";
import "./photo-section.css";
import { logFirebaseAnalyticsEvent } from "../../../utils/firebase-analytics-utils";

export const PhotoSection: React.FC = () => {
  const { t, i18n } = useTranslation();
  const { ref, inView } = useInView();

  const getCVPath = () => {
    logFirebaseAnalyticsEvent("download-cv-" + i18n.language.substring(0, 2));
    return `/cv/fabian-cv-${i18n.language.substring(0, 2)}.pdf`;
  };

  const goToLinkedin = () => {
    logFirebaseAnalyticsEvent("go-linkeding");
  };

  const goToGithub = () => {
    logFirebaseAnalyticsEvent("go-github");
  };

  return (
    <Section id="top" className="hero-section">
      <Container>
        <div
          ref={ref as React.RefObject<HTMLDivElement>}
          className={`hero-content fade-in-up${inView ? " visible" : ""}`}
        >
          <div className="hero-text">
            <p className="eyebrow">{t("hero.role")}</p>
            <h1 className="hero-name serif">
              Fabián
              <br />
              Scherle
            </h1>
            <p className="hero-lead">{t("hero.lead")}</p>
            <div className="hero-actions">
              <Button href={getCVPath()} icon>
                {t("hero.downloadCV")}
              </Button>
              <a
                href="https://github.com/fabbo-repo"
                target="_blank"
                rel="noopener noreferrer"
                className="button button-secondary"
                onClick={goToGithub}
              >
                GitHub
              </a>
              <a
                href="https://www.linkedin.com/in/fabián-scherle-carboneres-5ba3831b5/"
                target="_blank"
                rel="noopener noreferrer"
                className="button button-secondary"
                onClick={goToLinkedin}
              >
                LinkedIn
              </a>
            </div>
          </div>
          <figure className="hero-portrait">
            <img
              src="/images/profile.webp"
              alt={t("hero.portraitAlt")}
              className="hero-portrait-image"
              width="950"
              height="1056"
              loading="eager"
              decoding="async"
              fetchPriority="high"
            />
          </figure>
        </div>
      </Container>
    </Section>
  );
};
