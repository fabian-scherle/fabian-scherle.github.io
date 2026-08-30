import React from "react";
import { useTranslation } from "react-i18next";
import { Container } from "../../ui/container/container";
import { Section } from "../../ui/section/section";
import { Heading } from "../../ui/heading/heading";
import { expertise } from "../../../constants/expertise";
import { useInView } from "../../../hooks/use-in-view";
import "./about-section.css";

export const AboutSection: React.FC = () => {
  const { t } = useTranslation();
  const { ref, inView } = useInView();

  return (
    <Section id="expertise" className="expertise-section">
      <Container>
        <Heading label={t("about.label")}>{t("about.title")}</Heading>
        <div
          ref={ref as React.RefObject<HTMLDivElement>}
          className={`expertise-list stagger-children fade-in-up${inView ? " visible" : ""}`}
        >
          {expertise.map((area, index) => (
            <article key={area.id} className="expertise-row">
              <span className="expertise-index mono" aria-hidden="true">
                {String(index + 1).padStart(2, "0")}
              </span>
              <h3 className="expertise-title">
                {t(`about.areas.${area.id}.title`)}
              </h3>
              <div className="expertise-body">
                <p className="expertise-description">
                  {t(`about.areas.${area.id}.description`)}
                </p>
                <ul className="expertise-keywords">
                  {area.keywords.map((keyword) => (
                    <li key={keyword} className="expertise-keyword">
                      {keyword}
                    </li>
                  ))}
                </ul>
              </div>
            </article>
          ))}
        </div>
      </Container>
    </Section>
  );
};
