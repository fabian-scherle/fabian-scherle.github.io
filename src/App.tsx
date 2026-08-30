import React from "react";
import { useDocumentLang } from "./hooks/use-document-lang";
import { IndexLayout } from "./components/layout/index-layout/index-layout";
import { PhotoSection } from "./components/sections/photo-section/photo-section";
import { KeywordBand } from "./components/ui/keyword-band/keyword-band";
import { AboutSection } from "./components/sections/about-section/about-section";
import { ProjectsSection } from "./components/sections/projects-section/projects-section";
import { ExperienceSection } from "./components/sections/experience-section/experience-section";
import { ContactSection } from "./components/sections/contact-section/contact-section";

function App(): React.ReactElement {
  useDocumentLang();

  return (
    <IndexLayout>
      <main>
        <PhotoSection />
        <KeywordBand />
        <AboutSection />
        <ProjectsSection />
        <ExperienceSection />
      </main>
      <ContactSection />
    </IndexLayout>
  );
}

export default App;
