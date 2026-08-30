import React from "react";

interface ContainerProps {
  children: React.ReactNode;
  className?: string;
}

/** Width clamp plus the page gutter. `.container` lives in `global.css`. */
export const Container: React.FC<ContainerProps> = ({
  children,
  className = "",
}: ContainerProps) => {
  return <div className={`container ${className}`}>{children}</div>;
};
