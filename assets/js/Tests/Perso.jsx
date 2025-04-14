// // assets/react/controllers/Hello.jsx
// import React from 'react';

// export default function (props) {
//     return <div>Hello {props.name}</div>;
// }

import { createRoot } from 'react-dom/client';
import React from 'react';
import Scene from './Scene';


const Perso = ({name}) => {
  

  return (
    <>
      <div>
        HELLO {name}
      </div>
      {/* <Cube /> */}
      <Scene />
    </>
  );
};

class CustomPersoElement extends HTMLElement {
  connectedCallback() {
    const name = this.getAttribute('name'); // ← récupère l'attribut HTML
    const root = createRoot(this);
    root.render(<Perso name={name} />); // ← passe la prop à React
  }
}

customElements.define('perso-component', CustomPersoElement);
