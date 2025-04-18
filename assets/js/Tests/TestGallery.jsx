// // assets/react/controllers/Hello.jsx
// import React from 'react';

// export default function (props) {
//     return <div>Hello {props.name}</div>;
// }

import { createRoot } from 'react-dom/client';
import React from 'react';


const TestGallery = ({name, tableaux }) => {

  console.log('TestGallery tableaux', tableaux);
  

  return (<>
    <div>
      TITRE : {name}
    </div>
  </>
  );
};

class CustomTestGalleryElement extends HTMLElement {
  connectedCallback() {
    const name = this.getAttribute('name'); // ← récupère l'attribut HTML
    const tableaux = JSON.parse(this.getAttribute('tableaux') || '[]');
    const root = createRoot(this);
    root.render(<TestGallery name={name} tableaux={tableaux}/>); // ← passe la prop à React
  }
}

customElements.define('test-gallery', CustomTestGalleryElement);
