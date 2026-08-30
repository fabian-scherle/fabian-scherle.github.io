import React from "react";
import { useTranslation } from "react-i18next";
import { ArrowUpRight } from "lucide-react";
import { Container } from "../../ui/container/container";
import { Section } from "../../ui/section/section";
import { Heading } from "../../ui/heading/heading";
import { projects } from "../../../constants/projects";
import { useInView } from "../../../hooks/use-in-view";
import "./projects-section.css";
import { logFirebaseAnalyticsEvent } from "../../../utils/firebase-analytics-utils";

export const ProjectsSection: React.FC = () => {
  const { t } = useTranslation();
  const { ref, inView } = useInView();

  const goToProject = (projectId: string) => {
    logFirebaseAnalyticsEvent("go-project-" + projectId);
  };

  return (
    <Section id="work" className="work-section">
      <Container>
        <Heading label={t("projects.label")}>{t("projects.title")}</Heading>
        <div
          ref={ref as React.RefObject<HTMLDivElement>}
          className={`work-list stagger-children fade-in-up${inView ? " visible" : ""}`}
        >
          {projects.map((project, index) => (
            <a
              key={project.id}
              href={project.link}
              target="_blank"
              rel="noopener noreferrer"
              className="work-row"
              onClick={() => goToProject(project.id)}
            >
              <span className="work-index mono" aria-hidden="true">
                {String(index + 1).padStart(2, "0")}
              </span>
              <span className="work-thumb">
                <img src={project.image} alt="" className="work-thumb-image" />
              </span>
              <h3 className="work-title serif">
                {t(`projects.items.${project.id}.title`)}
              </h3>
              <span className="work-body">
                <span className="work-description">
                  {t(`projects.items.${project.id}.description`)}
                </span>
                <span className="work-tags">
                  {project.technologies.map((tech) => (
                    <span key={tech} className="work-tag">
                      {tech}
                    </span>
                  ))}
                </span>
              </span>
              <span className="work-cta mono">
                {t("projects.viewProject")}
                <ArrowUpRight className="work-cta-icon" aria-hidden="true" />
              </span>
            </a>
          ))}
        </div>
      </Container>
    </Section>
  );
};
