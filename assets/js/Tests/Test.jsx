// // assets/react/controllers/Hello.jsx
// import React from 'react';

// export default function (props) {
//     return <div>Hello {props.name}</div>;
// }

import { createRoot } from 'react-dom/client';
import React from 'react';
import Scene from './Scene';

const Test = ({name}) => {
  

  return (<>
    <div>
      HELLO2 {name}
    </div>
    <Scene />
  </>
  );
};

class CustomTestElement extends HTMLElement {
  connectedCallback() {
    const name = this.getAttribute('name'); // ← récupère l'attribut HTML
    const root = createRoot(this);
    root.render(<Test name={name} />); // ← passe la prop à React
  }
}

customElements.define('test-component', CustomTestElement);
