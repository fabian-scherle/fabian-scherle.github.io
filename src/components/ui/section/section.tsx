import React from "react";

interface SectionProps {
  children: React.ReactNode;
  id?: string;
  className?: string;
}

export const Section: React.FC<SectionProps> = ({
  children,
  id,
  className = "",
}: SectionProps) => {
  return (
    <section
      id={id}
      className={`section ${className}`}
      style={{ scrollMarginTop: "4rem" }}
    >
      {children}
    </section>
  );
};
