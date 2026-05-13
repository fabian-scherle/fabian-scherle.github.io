import React from "react";
import { useTranslation } from "react-i18next";
import { Button } from "../../ui/button/button";
import { Container } from "../../ui/container/container";
import { Section } from "../../ui/section/section";
import { useInView } from "../../../hooks/use-in-view";
import "./photo-section.css";
import { Linkedin } from "lucide-react";
import { logFirebaseAnalyticsEvent } from "../../../utils/firebase-analytics-utils";

export const PhotoSection: React.FC = () => {
  const { t, i18n } = useTranslation();
  const { ref, inView } = useInView();

  const getCVPath = () => {
    logFirebaseAnalyticsEvent("download-cv-" + i18n.language.substring(0, 2));
    return `/cv/cv_${i18n.language.substring(0, 2)}.pdf`;
  };

  const goToLinkedin = () => {
    logFirebaseAnalyticsEvent("go-linkeding");
  };

  return (
    <Section id="photo" className="photo-section">
      <Container>
        <div
          ref={ref as React.RefObject<HTMLDivElement>}
          className={`photo-content fade-in-up${inView ? " visible" : ""}`}
        >
          <div className="profile-image-container">
            <img
              src="/images/profile.webp"
              alt="Fabián Scherle - Desarrollador Full Stack y Arquitecto de Software"
              className="profile-image"
              width="400"
              height="400"
              loading="eager"
              decoding="async"
              fetchPriority="high"
            />
          </div>
          <div className="profile-info">
            <h2 className="profile-title">{t("photo.greeting")}</h2>
            <p className="profile-description">{t("photo.description")}</p>
            <div className="profile-actions">
              <Button href={getCVPath()} icon>
                {t("photo.downloadCV")}
              </Button>
              <a
                href="https://www.linkedin.com/in/fabián-scherle-carboneres-5ba3831b5/"
                target="_blank"
                rel="noopener noreferrer"
                className="social-link"
                onClick={goToLinkedin}
              >
                <Linkedin className="social-icon" />
                <span>LinkedIn</span>
              </a>
            </div>
          </div>
        </div>
      </Container>
    </Section>
  );
};
