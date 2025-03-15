import { createRoot } from 'react-dom/client';  // Import createRoot from react-dom/client
import React from 'react';

function Comments() {
  return <div>Bonjour les gens</div>;
}

class CommentsElement extends HTMLElement {
  connectedCallback() {
    // Create a root and render the component using createRoot
    const root = createRoot(this);  // Create the root on this element
    root.render(<Comments />);  // Render the Comments component
  }
}

customElements.define('post-comments', CommentsElement);





// import {render} from 'react-dom'
// import React from 'react'

// function Comments() {
//   return <div>Bonjour les gens</div>
// }

// class CommentsElement extends HTMLElement {



//   connectedCallback () {
    
//     render(<Comments/>, this)
//   }

// }

// customElements.define('post-comments', CommentsElement)
