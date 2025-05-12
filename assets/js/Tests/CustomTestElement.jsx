import React from 'react';
import { createRoot } from 'react-dom/client';
import TestComponent from './Test';

// Création du Custom Element
class CustomTestElement extends HTMLElement {
  connectedCallback() {
    const root = createRoot(this);
    root.render(<TestComponent />);
  }
}

// Définition du Custom Element
customElements.define('test-component', CustomTestElement);
