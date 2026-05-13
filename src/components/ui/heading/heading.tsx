import React from "react";
import "./heading.css";

interface HeadingProps {
  children: React.ReactNode;
  className?: string;
}

export const Heading: React.FC<HeadingProps> = ({
  children,
  className = "",
}: HeadingProps) => {
  return (
    <div className={`heading-wrapper ${className}`}>
      <h2 className="heading">{children}</h2>
      <span className="heading-accent" aria-hidden="true" />
    </div>
  );
};
