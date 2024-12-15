import React from 'react';
import { Download } from 'lucide-react';
import './button.css';

interface ButtonProps {
  href?: string;
  children: React.ReactNode;
  variant?: 'primary' | 'secondary';
  icon?: boolean;
  className?: string;
}

export const Button: React.FC<ButtonProps> = ({
  href,
  children,
  variant = 'primary',
  icon = false,
  className = ''
}: ButtonProps) => {
  const classes = `button button-${variant} ${className}`;
  const content = (
    <>
      {children}
      {icon && <Download className="button-icon" />}
    </>
  );

  if (href) {
    return (
      <a href={href} className={classes} download>
        {content}
      </a>
    );
  }

  return (
    <button className={classes}>
      {content}
    </button>
  );
};