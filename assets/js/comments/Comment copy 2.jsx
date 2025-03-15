import { createRoot } from 'react-dom/client'; // Importer createRoot
import React, { useState } from 'react';
import { Canvas } from '@react-three/fiber'; // Importer Canvas pour afficher la scène 3D
import { OrbitControls } from '@react-three/drei'; // Importer OrbitControls depuis drei
import Cube from './Cube'; // Importer votre composant Cube
import MugModel from '../models3d/MugModel';
import { ButtonOnOff } from '../ui/ButtonOnOff'; // Le bouton pour démarrer/arrêter la rotation

const CommentsElement = () => {
  // État pour contrôler la rotation
  const [isRotating, setIsRotating] = useState(true);

  // Fonction pour inverser l'état de la rotation
  const toggleRotation = () => {
    setIsRotating(prev => !prev);
  };

  return (
    <>
      <Canvas
        style={{ width: '100%', height: '500px' }}
        camera={{ position: [-20, 5, 5], fov: 50 }} // Positionner la caméra
        shadows
        gl={{ antialias: true }} // Active le rendu antialiasé
      >
        {/* Lumière ambiante (lumière générale sans direction) */}
        <ambientLight intensity={2} />

        {/* Lumière directionnelle qui projette des ombres */}
        <directionalLight position={[10, 10, 10]} intensity={5} castShadow />

        {/* Modèle 3D */}
        <MugModel isRotating={isRotating} />

        {/* OrbitControls pour interagir avec la caméra */}
        <OrbitControls position={[0, -5, -5]} />
      </Canvas>

      {/* Bouton pour contrôler la rotation */}
      <ButtonOnOff toggleRotation={toggleRotation} isRotating={isRotating} />
    </>
  );
};

// Enregistrer le composant comme un Custom Element
class CustomCommentsElement extends HTMLElement {
  connectedCallback() {
    const root = createRoot(this);
    root.render(<CommentsElement />);
  }
}

customElements.define('post-comments', CustomCommentsElement);
