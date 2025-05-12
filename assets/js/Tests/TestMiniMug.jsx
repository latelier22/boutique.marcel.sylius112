// // assets/react/controllers/Hello.jsx
// import React from 'react';

// export default function (props) {
//     return <div>Hello {props.name}</div>;
// }

import { createRoot } from 'react-dom/client';
import React from 'react';
// import MiniMugView from './MiniMugView';
import MiniMugPreview from './MiniMugPreview';

const extractColorFromSlug = (slug) => {
  const COLOR_MAP = ['rouge', 'noir', 'blanc', 'bleu', 'vert', 'jaune', 'gris', 'orange'];
  for (const color of COLOR_MAP) {
    if (slug.includes(`-${color}`)) {
      return color;
    }
  }
  return 'blanc'; // Couleur par défaut
};

const TestMiniMug = ({slug, code, imageTextureUrl }) => {

  console.log('test minimug slug',slug,'code',code);
  const color = extractColorFromSlug(slug);
  console.log('test minimug color',color);
  
  return (
    <div style={{ width: '100%', height: '100%' }}>
  <MiniMugPreview slug={slug} code={code}  color={color} imageTextureUrl={imageTextureUrl} />
</div>

  );
};

class CustomTestMiniMugElement extends HTMLElement {
  connectedCallback() {
    const slug = this.getAttribute('slug'); // ← récupère l'attribut HTML
    const code = this.getAttribute('code'); // ← récupère l'attribut HTML
    const imageTextureUrl = this.getAttribute('imageTextureUrl'); // ← récupère l'attribut HTML
    const color = this.getAttribute('color') || 'blanc';
    const root = createRoot(this);
    root.render(<TestMiniMug slug={slug} code={code} color={color} imageTextureUrl={imageTextureUrl}/>); 
  }
}

customElements.define('test-minimug', CustomTestMiniMugElement);
export default TestMiniMug;