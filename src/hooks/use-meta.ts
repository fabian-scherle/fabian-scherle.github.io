import { useEffect } from 'react';
import { getMetaTitle, getMetaDescription } from '../utils/seo-utils';

interface UseMetaProps {
  title?: string;
  description?: string;
}

export const useMeta = ({ title, description }: UseMetaProps) => {
  useEffect(() => {
    if (title) {
      document.title = getMetaTitle(title);
    }
    
    if (description) {
      const metaDescription = document.querySelector('meta[name="description"]');
      if (metaDescription) {
        metaDescription.setAttribute('content', getMetaDescription(description));
      }
    }
  }, [title, description]);
};