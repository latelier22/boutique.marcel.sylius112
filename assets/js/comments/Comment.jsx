import { createRoot } from 'react-dom/client';
import React, { useState, useEffect, useRef } from 'react';
import { Canvas } from '@react-three/fiber';
import { OrbitControls } from '@react-three/drei';
import MugModel from '../models3d/MugPerso'; // Votre modèle de mug
import { ButtonOnOff } from '../ui/ButtonOnOff';
import ProductImages from "./ProductImages";
import { fabric } from 'fabric';

const FabricTest = ({ selectedImage }) => {
  const canvasRef = useRef(null);
  const fabricCanvasRef = useRef(null);

  // Remplir le canvas avec un placeholder au montage
  useEffect(() => {
    if (!fabricCanvasRef.current) {
      fabricCanvasRef.current = new fabric.Canvas(canvasRef.current, {
        height: 200,
        width: 500,
        backgroundColor: 'white', // Couleur de fond par défaut
      });
    }

    // Si une image est sélectionnée, remplacer le placeholder
    if (selectedImage && typeof selectedImage === 'string') {
      fabric.Image.fromURL(selectedImage, (image) => {
        image.set({
          left: 0,
          top: 0,
          scaleX: 1,
          scaleY: 1,
          lockUniScaling: true, // Empêche de déformer l'image
          hasBorders: true,
          hasControls: true,
          crossOrigin: 'anonymous',
        });
        // Ajuste l'image pour qu'elle respecte le ratio sans déformation
        const ratio = image.width / image.height;
        const width = fabricCanvasRef.current.width;
        const height = fabricCanvasRef.current.height;
        if (width / height > ratio) {
          image.scaleToHeight(height);
        } else {
          image.scaleToWidth(width);
        }

        fabricCanvasRef.current.clear();
        fabricCanvasRef.current.add(image);
        fabricCanvasRef.current.renderAll();
      });
    }

    return () => {
      fabricCanvasRef.current.clear();
    };
  }, [selectedImage]); // Exécuter à chaque changement de l'image sélectionnée

  return (
    <div>
      <canvas id="canvas" ref={canvasRef} />
    </div>
  );
};

const CommentsElement = () => {
  const [isRotating, setIsRotating] = useState(true);
  const [selectedImage, setSelectedImage] = useState(null); // L'image sélectionnée

  const toggleRotation = () => {
    setIsRotating(prev => !prev);
  };

  const handleImageClick = (image) => {
    // Vérification et conversion de l'image avant de la mettre à jour
    let imageURL;
  
    // Si l'image est externe
    if (image && image.isExternal) {
      imageURL = image.product_image; // Utilise l'URL externe telle quelle
    } 
    // Si l'image est locale
    else if (image && image.product_image) {
      imageURL = `https://sylius.latelier22.fr/media/image/${image.product_image}`; // Utilise l'URL relative
    }
  
    // Mettre à jour l'image sélectionnée avec l'URL appropriée
    setSelectedImage(imageURL);
  };
  

  return (
    <div style={{ display: 'flex', justifyContent: 'space-between' }}>
      {/* Zone du mug avec le canvas 3D */}
      {/* Zone pour afficher le canvas */}
      <div style={{ width: '50%', padding: '10px' }}>
        <FabricTest selectedImage={selectedImage} />
      </div>
      <div style={{ width: '50%' }}>
        <Canvas
          style={{ width: '100%', height: '500px' }}
          camera={{ position: [-20, 5, 5], fov: 50 }}
          shadows
          gl={{ antialias: true }}
        >
          <ambientLight intensity={2} />
          <directionalLight position={[10, 10, 10]} intensity={5} castShadow />
          <MugModel isRotating={isRotating} />
          <OrbitControls />
        </Canvas>

        {/* Bouton pour contrôler la rotation */}
        <ButtonOnOff toggleRotation={toggleRotation} isRotating={isRotating} />
      </div>

      

      {/* Affichage des images sous forme de cartes */}
      <div style={{ width: '50%' }}>
        <ProductImages taxonCode="TAB" onImageClick={handleImageClick} />
      </div>
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
