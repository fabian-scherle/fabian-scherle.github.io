import React from "react";
import { useTranslation } from "react-i18next";
import { ExternalLink } from "lucide-react";
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
    <Section id="projects" className="projects-section">
      <Container>
        <Heading>{t("projects.title")}</Heading>
        <div
          ref={ref as React.RefObject<HTMLDivElement>}
          className={`projects-grid stagger-children fade-in-up${inView ? " visible" : ""}`}
        >
          {projects.map((project) => (
            <div key={project.id} className="project-card">
              <div className="project-image-container">
                <img
                  src={project.image}
                  alt={t(`projects.items.${project.id}.title`)}
                  className="project-image"
                />
              </div>
              <div className="project-content">
                <h3 className="project-title">
                  {t(`projects.items.${project.id}.title`)}
                </h3>
                <p className="project-description">
                  {t(`projects.items.${project.id}.description`)}
                </p>
                {"technologies" in project &&
                  Array.isArray(project.technologies) && (
                    <div className="project-tags">
                      {(project.technologies as string[]).map((tech) => (
                        <span key={tech} className="project-tag">
                          {tech}
                        </span>
                      ))}
                    </div>
                  )}
                <a
                  href={project.link}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="project-link"
                  onClick={() => goToProject(project.id)}
                >
                  {t("projects.viewProject")}
                  <ExternalLink className="project-link-icon" />
                </a>
              </div>
            </div>
          ))}
        </div>
      </Container>
    </Section>
  );
};
