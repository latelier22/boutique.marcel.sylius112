// // assets/react/controllers/Hello.jsx
// import React from 'react';

// export default function (props) {
//     return <div>Hello {props.name}</div>;
// }

import { createRoot } from 'react-dom/client';
import React from 'react';
import Scene from './Scene';

const MiniMug = ({slug,code}) => {
  

  return (<>
    <div>
      Mud SLUG:{slug} CODE:{code} 
    </div>
    
  </>
  );
};

class CustomMiniMugElement extends HTMLElement {
  connectedCallback() {
    const slug = this.getAttribute('slug'); // ← récupère l'attribut HTML
    const code = this.getAttribute('code'); // ← récupère l'attribut HTML
    const root = createRoot(this);
    root.render(<MiniMug  slug={slug} code={code} />); // ← passe la prop à React
  }
}

customElements.define('mimimug-component', CustomMiniMugElement);
