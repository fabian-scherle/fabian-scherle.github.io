import React from 'react';
import { useTranslation } from 'react-i18next';
import { ExternalLink } from 'lucide-react';
import { Container } from '../../ui/container/container';
import { Section } from '../../ui/section/section';
import { Heading } from '../../ui/heading/heading';
import { projects } from '../../../constants/projects';
import './projects-section.css';
import { logFirebaseAnalyticsEvent } from '../../../utils/firebase-analytics-utils';

export const ProjectsSection: React.FC = () => {
  const { t } = useTranslation();

  const goToProject = (projectId: string) => {
    logFirebaseAnalyticsEvent("go-project-" + projectId);
  };

  return (
    <Section id="projects" className="projects-section">
      <Container>
        <Heading>{t('projects.title')}</Heading>
        <div className="projects-grid">
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
                <a
                  href={project.link}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="project-link"
                  onClick={() => goToProject(project.id)}
                >
                  {t('projects.viewProject')}
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