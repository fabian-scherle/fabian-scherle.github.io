import React from "react";
import { useTranslation } from "react-i18next";
import { Container } from "../../ui/container/container";
import { Section } from "../../ui/section/section";
import { Heading } from "../../ui/heading/heading";
import { experience } from "../../../constants/experience";
import { useInView } from "../../../hooks/use-in-view";
import "./experience-section.css";

export const ExperienceSection: React.FC = () => {
  const { t } = useTranslation();
  const { ref, inView } = useInView();

  return (
    <Section id="experience" className="experience-section">
      <Container>
        <Heading label={t("experience.label")}>{t("experience.title")}</Heading>
        <div
          ref={ref as React.RefObject<HTMLDivElement>}
          className={`experience-list stagger-children fade-in-up${inView ? " visible" : ""}`}
        >
          {experience.map((role) => (
            <article key={role.id} className="experience-row">
              <p className="experience-period mono">
                {t(`experience.items.${role.id}.period`)}
              </p>
              <div className="experience-role">
                <h3 className="experience-company">{role.company}</h3>
                <p className="experience-position mono">
                  {t(`experience.items.${role.id}.role`)}
                </p>
              </div>
              <p className="experience-description">
                {t(`experience.items.${role.id}.description`)}
              </p>
            </article>
          ))}
        </div>
      </Container>
    </Section>
  );
};
