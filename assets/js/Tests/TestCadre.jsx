// // assets/react/controllers/Hello.jsx
// import React from 'react';

// export default function (props) {
//     return <div>Hello {props.name}</div>;
// }

import { createRoot } from 'react-dom/client';
import React from 'react';
import SceneCadre from './SceneCadre';  


const TestCadre = ({name}) => {

  console.log('TestCadre tableaux');
  

  return (
    <>
    <div>
      Name dans cadre-component : {name}
    </div>
    <SceneCadre />
    </>
  );
  
};

class CustomTestCadreElement extends HTMLElement {
  connectedCallback() {
    const name = this.getAttribute('name'); // ← récupère l'attribut HTML
    
    const root = createRoot(this);
    root.render(<TestCadre name={name}/>); // ← passe la prop à React
  }
}

customElements.define('cadre-component', CustomTestCadreElement);
