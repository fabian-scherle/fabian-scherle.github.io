import React from "react";
import "./heading.css";

interface HeadingProps {
  children: React.ReactNode;
  /** Small letterspaced label set opposite the title. */
  label?: string;
  className?: string;
}

export const Heading: React.FC<HeadingProps> = ({
  children,
  label,
  className = "",
}: HeadingProps) => {
  return (
    <div className={`section-head ${className}`}>
      <h2 className="section-title serif">{children}</h2>
      {label && <p className="section-label eyebrow">{label}</p>}
    </div>
  );
};
