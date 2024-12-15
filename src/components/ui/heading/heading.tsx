import React from 'react';
import './heading.css';

interface HeadingProps {
  children: React.ReactNode;
  className?: string;
}

export const Heading: React.FC<HeadingProps> = ({ children, className = '' }: HeadingProps) => {
  return (
    <h2 className={`heading ${className}`}>
      {children}
    </h2>
  );
};