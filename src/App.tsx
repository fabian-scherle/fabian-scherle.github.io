import React from "react";
import { useDocumentLang } from "./hooks/use-document-lang";
import { IndexLayout } from "./components/layout/index-layout/index-layout";
import { PhotoSection } from "./components/sections/photo-section/photo-section";
import { AboutSection } from "./components/sections/about-section/about-section";
import { ProjectsSection } from "./components/sections/projects-section/projects-section";

function App(): React.ReactElement {
  useDocumentLang();

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
