import React from 'react';
import { useTranslation } from 'react-i18next';
import { Code2, Palette, Globe2 } from 'lucide-react';
import { Container } from '../../ui/container/container';
import { Section } from '../../ui/section/section';
import { Heading } from '../../ui/heading/heading';
import './about-section.css';

const skillIcons = {
  webDev: Code2,
  uiUx: Palette,
  global: Globe2,
};

export const AboutSection: React.FC = () => {
  const { t } = useTranslation();

  const skills = [
    {
      key: 'webDev',
      icon: skillIcons.webDev,
      title: t('about.skills.webDev.title'),
      description: t('about.skills.webDev.description'),
    },
    {
      key: 'uiUx',
      icon: skillIcons.uiUx,
      title: t('about.skills.uiUx.title'),
      description: t('about.skills.uiUx.description'),
    },
    {
      key: 'global',
      icon: skillIcons.global,
      title: t('about.skills.global.title'),
      description: t('about.skills.global.description'),
    },
  ];

  return (
    <Section id="about" className="about-section">
      <Container>
        <Heading>{t('about.title')}</Heading>
        <div className="skills-grid">
          {skills.map((skill) => {
            const Icon = skill.icon;
            return (
              <div key={skill.key} className="skill-card">
                <Icon className="skill-icon" />
                <h3 className="skill-title">{skill.title}</h3>
                <p className="skill-description">{skill.description}</p>
              </div>
            );
          })}
        </div>
      </Container>
    </Section>
  );
};