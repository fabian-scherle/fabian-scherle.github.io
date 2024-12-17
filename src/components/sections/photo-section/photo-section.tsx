import React from 'react';
import { useTranslation } from 'react-i18next';
import { Button } from '../../ui/button/button';
import { Container } from '../../ui/container/container';
import { Section } from '../../ui/section/section';
import './photo-section.css';
import { Linkedin } from 'lucide-react';
import { useAnalyticsEventTracker } from '../../../hooks/use-analytics-event-tracker';

export const PhotoSection: React.FC = () => {
  const { t, i18n } = useTranslation();

  const gaEventTracker = useAnalyticsEventTracker("Photo Section");

  const getCVPath = () => {
    gaEventTracker("Download CV", i18n.language.substring(0, 2));

    return `/cv/cv_${i18n.language.substring(0, 2)}.pdf`;
  };

  const goToLinkedin = () => {
    gaEventTracker("Linkedin", "");
  };

  return (
    <Section id="photo" className="photo-section">
      <Container>
        <div className="photo-content">
          <div className="profile-image-container">
            <img
              src="/images/profile.webp"
              alt="Profile"
              className="profile-image"
            />
          </div>
          <div className="profile-info">
            <h2 className="profile-title">{t('photo.greeting')}</h2>
            <p className="profile-description">{t('photo.description')}</p>
            <div className="profile-actions">
              <Button href={getCVPath()} icon>{t('photo.downloadCV')}</Button>
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
