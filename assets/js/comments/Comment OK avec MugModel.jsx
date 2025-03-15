import { createRoot } from 'react-dom/client';
import React, { useState } from 'react';
import { Canvas } from '@react-three/fiber';
import { OrbitControls } from '@react-three/drei';
import MugModel from '../models3d/MugModel';
import { ButtonOnOff } from '../ui/ButtonOnOff';
import ProductImages from "./ProductImages";

const CommentsElement = () => {
  // État pour contrôler la rotation du mug
  const [isRotating, setIsRotating] = useState(true);

  // Image placeholder par défaut
  const placeholderImage = {
    product_image: "https://placehold.co/400x400?text=Cliquez%20sur%20un%20tableau%0A%20%0Apour%20personnaliser%20le%20mug"
  };

  // État pour l'image sélectionnée
  const [selectedImage, setSelectedImage] = useState(placeholderImage);

  // Fonction pour inverser l'état de la rotation
  const toggleRotation = () => {
    setIsRotating(prev => !prev);
  };

  // Fonction de gestion du clic sur une image
  const handleImageClick = (image) => {
    setSelectedImage(image); // Mettre à jour l'image sélectionnée
  };

  // Fonction pour obtenir l'URL correcte de l'image (pour gérer le placeholder vs image locale)
  const getImageUrl = (image) => {
    // Si l'URL de l'image commence par 'http', on retourne l'URL telle quelle (pour les images externes)
    if (image.product_image.startsWith('http')) {
      return image.product_image;
    }
    // Sinon, on considère que c'est une image locale et on ajoute '/media/'
    return `/media/image/${image.product_image}`;
  };

  return (
    <div style={{ display: 'flex', justifyContent: 'space-between' }}>
      {/* Zone du mug avec le canvas */}
      <div style={{ width: '50%' }}>
        <Canvas
          style={{ width: '100%', height: '500px' }}
          camera={{ position: [-20, 5, 5], fov: 50 }} // Positionner la caméra
          shadows
          gl={{ antialias: true }} // Active le rendu antialiasé
        >
          <ambientLight intensity={2} />
          <directionalLight position={[10, 10, 10]} intensity={5} castShadow />
          <MugModel isRotating={isRotating} />
          <OrbitControls />
        </Canvas>

        {/* Bouton pour contrôler la rotation */}
        <ButtonOnOff toggleRotation={toggleRotation} isRotating={isRotating} />
      </div>

      {/* Zone pour afficher l'image sélectionnée */}
      <div style={{ width: '50%', padding: '10px' }}>
        <img
          src={getImageUrl(selectedImage)} // Appel de la fonction pour obtenir l'URL de l'image
          alt="Selected Product"
          style={{
            width: '100%',
            height: '500px',
            objectFit: 'cover', // Garantir que l'image remplit bien la zone sans déformation
          }}
        />
      </div>

      {/* Affichage des images sous forme de cartes */}
      <ProductImages taxonCode="TAB" onImageClick={handleImageClick} />
    </div>
  );
};

class CustomCommentsElement extends HTMLElement {
  connectedCallback() {
    const root = createRoot(this);
    root.render(<CommentsElement />);
  }
}

customElements.define('post-comments', CustomCommentsElement);
