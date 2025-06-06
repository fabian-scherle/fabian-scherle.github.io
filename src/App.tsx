import React from 'react';
import { useMeta } from './hooks/use-meta';
import { IndexLayout } from './components/layout/index-layout/index-layout';
import { PhotoSection } from './components/sections/photo-section/photo-section';
import { AboutSection } from './components/sections/about-section/about-section';
import { ProjectsSection } from './components/sections/projects-section/projects-section';

function App(): React.ReactElement {
  useMeta({
    title: 'Portfolio',
    description: 'Desarrollador Full Stack y Arquitecto de Software con experiencia en Java, Python, React, Flutter, Django y tecnologías cloud.'
  });

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