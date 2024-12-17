import React from 'react';
import { useMeta } from './hooks/use-meta';
import { IndexLayout } from './components/layout/index-layout/index-layout';
import { PhotoSection } from './components/sections/photo-section/photo-section';
import { AboutSection } from './components/sections/about-section/about-section';
import { ProjectsSection } from './components/sections/projects-section/projects-section';
import ReactGA from 'react-ga4';

function App(): React.ReactElement {
  useMeta({
    title: 'Portfolio',
    description: 'Desarrollador Full Stack y Arquitecto de Software con experiencia en Java, Python, React, Flutter, Django y tecnologías cloud.'
  });

  const TRACKING_ID = "G-8N02HG2VX1";
  ReactGA.initialize(TRACKING_ID);

  return (
    <IndexLayout>
      <main>
        <PhotoSection />
        <AboutSection />
        <ProjectsSection />
      </main>
    </IndexLayout>
  );
}

export default App;