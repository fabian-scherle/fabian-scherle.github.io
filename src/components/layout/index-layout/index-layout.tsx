import React from 'react';
import { HeaderLayout } from '../header-layout/header-layout';

interface IndexLayoutProps {
  children: React.ReactNode;
}

export const IndexLayout: React.FC<IndexLayoutProps> = ({ children }) => {
  return (
    <div className="app">
      <HeaderLayout />
      {children}
    </div>
  );
};