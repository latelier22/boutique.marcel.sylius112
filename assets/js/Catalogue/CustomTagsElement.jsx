import React from 'react';
import { createRoot } from 'react-dom/client';
import TagsComponent from './TagsComponent';

// Création du Custom Element
class CustomTagsElement extends HTMLElement {
  connectedCallback() {
    const root = createRoot(this);
    root.render(<TagsComponent />);
  }
}

// Définition du Custom Element
customElements.define('tags-component', CustomTagsElement);
