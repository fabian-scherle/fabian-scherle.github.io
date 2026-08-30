import React from "react";
import { Container } from "../container/container";
import { stackBand } from "../../../constants/expertise";
import "./keyword-band.css";

/**
 * The ink-coloured strip of product names between the hero and the expertise
 * section. Decorative in the sense that every name is repeated in context
 * further down, so it is hidden from assistive technology.
 */
export const KeywordBand: React.FC = () => {
  return (
    <div className="keyword-band" aria-hidden="true">
      <Container>
        <div className="keyword-band-list">
          {stackBand.map((keyword) => (
            <span key={keyword} className="keyword-band-item">
              {keyword}
            </span>
          ))}
        </div>
      </Container>
    </div>
  );
};
