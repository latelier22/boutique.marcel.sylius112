// // assets/react/controllers/Hello.jsx
// import React from 'react';

// export default function (props) {
//     return <div>Hello {props.name}</div>;
// }

import { createRoot } from 'react-dom/client';
import React from 'react';
import TableauxGallery from './TableauxGallery';


const Gallery = ({tableaux, taxonsTableaux}) => {
  

  return (<>
    <div>
     GALLERY REACT
    </div>
    <TableauxGallery tableaux={tableaux}  taxonsTableaux={taxonsTableaux} />
  </>
  );
};

class CustomGalleryElement extends HTMLElement {
    connectedCallback() {
      const title = this.getAttribute('title') || 'GALLERY REACT';
      const tableaux = JSON.parse(this.getAttribute('tableaux') || '[]');
      const taxonsTableaux = JSON.parse(this.getAttribute('taxonsTableaux') || '[]');
      const root = createRoot(this);
      root.render(<Gallery title ={title} tableaux={tableaux} taxonsTableaux={taxonsTableaux} />);
    }
  }
customElements.define('gallery-component', CustomGalleryElement);


{/* <gallery-component tableaux="{{tableauxAvecTaxons}}"  taxons="{{taxonsTableaux}}" >Chargement Gallery de Tableaux</gallery-component> */}