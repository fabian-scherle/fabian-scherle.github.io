import React from 'react';
import { useTranslation } from 'react-i18next';
import { Button } from '../../ui/button/button';
import { Container } from '../../ui/container/container';
import { Section } from '../../ui/section/section';
import './photo-section.css';

export const PhotoSection: React.FC = () => {
  const { t, i18n } = useTranslation();

  const getCVPath = () => {
    return `/cv/cv_${i18n.language}.pdf`;
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
            <Button href={getCVPath()} icon>{t('photo.downloadCV')}</Button>
          </div>
        </div>
      </Container>
    </Section>
  );
};