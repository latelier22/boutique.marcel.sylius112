import React, { useEffect, useRef, useState, } from 'react';
import { Canvas ,useThree } from '@react-three/fiber';
import { OrbitControls , Environment, MeshReflectorMaterial,Text, Float} from '@react-three/drei';
import MugPerso from '../models3d/MugPerso';
// import CarreauChevalet from './CarreauChevalet';
import { fabric } from 'fabric';
import * as THREE from 'three';
import ColorSelector from './ColorSelector';
import ScreenShotController from './ScreenShotController';
import {handleScreenshot} from './utils';




const Scene = () => {
  const canvasRef = useRef(null);
  const fabricCanvasRef = useRef(null);
  const [selectedImage, setSelectedImage] = useState(null);
  const [texture, setTexture] = useState(null);
  const [fitMode, setFitMode] = useState('fit');
  const canvasSizeRef = useRef({ width: 0, height: 0 });
  const [mugColor, setMugColor] = useState('#FFFFFF');
  const [rotate, setRotate] = useState(true);
  const [screenshot, setScreenshot] = useState(null);
  const canvasContainerRef = useRef(null);

  


  const handleColorChange = (color) => {
    setMugColor(color);
  }

  
  
  
  // Petit helper
  function loadImage(src) {
    return new Promise((resolve) => {
      const img = new Image();
      img.onload = () => resolve(img);
      img.src = src;
    });
  }
  
  
  

  const createCanvasTexture = () => {
    if (!canvasRef.current) return null;
    const texture = new THREE.CanvasTexture(canvasRef.current);
    texture.minFilter = THREE.LinearFilter;
    texture.generateMipmaps = false;
    texture.needsUpdate = true;
    return texture;
  };
  const updateCanvasSize = () => {
    const wrapper = document.getElementById('canvas-wrapper-col');
    if (!wrapper || !canvasRef.current || !fabricCanvasRef.current) return;
  
    const maxWidth = wrapper.offsetWidth;
    const width = Math.max(1, maxWidth); // sécurité
    const height = width * (9 / 22); // ratio imprimable
  
    canvasSizeRef.current = { width, height };
  
    canvasRef.current.width = width;
    canvasRef.current.height = height;
    canvasRef.current.style.width = `${width}px`;
    canvasRef.current.style.height = `${height}px`;
  
    fabricCanvasRef.current.setWidth(width);
    fabricCanvasRef.current.setHeight(height);
    fabricCanvasRef.current.setZoom(1);
    fabricCanvasRef.current.renderAll();
  
    const newTexture = new THREE.CanvasTexture(canvasRef.current);
    newTexture.minFilter = THREE.LinearFilter;
    newTexture.generateMipmaps = false;
    newTexture.needsUpdate = true;
    setTexture(newTexture);
  };
  
  
  

  useEffect(() => {
    const img = document.getElementById('associated-image');
    if (img && img.src) {
      setSelectedImage(img.src);
    }

    const mainImageContainer = document.getElementById('main-image');
    if (mainImageContainer) {
      mainImageContainer.style.display = 'none';
    }
    const associatedImageContainer = document.getElementById('associated-image');
    if (associatedImageContainer) {
      associatedImageContainer.style.display = 'none';
    }
  }, []);

  useEffect(() => {
    if (!canvasRef.current) return;

    updateCanvasSize();

    if (!fabricCanvasRef.current) {
      fabricCanvasRef.current = new fabric.Canvas(canvasRef.current, {
        backgroundColor: 'white',
      });

      const background = new fabric.Rect({
        left: 0,
        top: 0,
        width: canvasRef.current.width,
        height: canvasRef.current.height,
        fill: 'red',
        selectable: false,
        evented: false,
      });

      fabricCanvasRef.current.add(background);
      fabricCanvasRef.current.sendToBack(background);
    }

    if (
      selectedImage &&
      fabricCanvasRef.current &&
      fabricCanvasRef.current.getObjects().length === 0
    ) {
      fabric.Image.fromURL(selectedImage, (image) => {
        const canvas = fabricCanvasRef.current;
        const width = canvas.width;
        const height = canvas.height;

        const background = new fabric.Rect({
          left: 0,
          top: 0,
          width,
          height,
          fill: 'white',
          selectable: false,
          evented: false,
        });

        canvas.clear();
        canvas.add(background);
        canvas.sendToBack(background);

        const imgRatio = image.width / image.height;
const canvasRatio = width / height;

let scale;
if (fitMode === 'cover') {
  scale = Math.max(width / image.width, height / image.height);
} else {
  scale = Math.min(width / image.width, height / image.height);
}


image.scale(scale);

// CENTRAGE
image.set({
  left: (width - image.getScaledWidth()) / 2,
  top: (height - image.getScaledHeight()) / 2,
  lockUniScaling: true,
  hasBorders: true,
  hasControls: true,
  crossOrigin: 'anonymous',
});


        canvas.add(image);
        canvas.renderAll();

       // ⏳ Attends un peu avant de créer la texture (le temps que Fabric termine)
        setTimeout(() => {
          const newTexture = createCanvasTexture();
          setTexture(newTexture);
          }, 100); // 50 à 100ms suffit
         });
    }

    const debouncedResize = () => {
      clearTimeout(window.__resizeTimeout);
      window.__resizeTimeout = setTimeout(() => {
        updateCanvasSize();
        const newTexture = createCanvasTexture();
        setTexture(newTexture);
      }, 200);
    };

    window.addEventListener('resize', debouncedResize);

    return () => {
      if (fabricCanvasRef.current) {
        fabricCanvasRef.current.clear();
      }
      window.removeEventListener('resize', debouncedResize);
    };
  }, [selectedImage, fitMode]);

  return (
   // ...
<div className="scene-container">
  <button
    className="ui primary button screenshot-toggle"
    onClick={() => setFitMode(prev => (prev === 'cover' ? 'contain' : 'cover'))}
  >
    Mode : {fitMode === 'cover' ? "CLIQUER POUR VOIR L'IMAGE ENTIERE" : 'CLIQUER POUR REMPLIR LA ZONE IMPRIMABLE'}
  </button>

  <canvas id="canvas" ref={canvasRef} className="fabric-canvas" />

  <label className="color-label">
    Couleur du mug :
    <input
      type="color"
      value={mugColor}
      onChange={(e) => setMugColor(e.target.value)}
      className="color-input"
    />
  </label>

  <ColorSelector
    className="color-selector"
    title="Choisissez la couleur du Mug"
    defaultColor="#000000"
    onColorChange={handleColorChange}
  />

  <button
    onClick={() => handleScreenshot({ canvasContainerRef })}
    className="ui primary button capture-button"
  >
    📸 Capture écran
  </button>

  {screenshot && (
    <img src={screenshot} alt="Screenshot du mug" className="screenshot-preview" />
  )}

  <div id="canvas-wrapper-col" className="canvas-wrapper" ref={canvasContainerRef}>
    <Canvas
      gl={{ preserveDrawingBuffer: true }}
      camera={{ position: [0, 15, 35], fov: 40 }}
      shadows
      dpr={[1, 1.5]}
      className="canvas-3d"
      style={{ width: '100%', height: '500px' }}
    >
      <ambientLight intensity={0.5} />
      <directionalLight position={[10, 10, 10]} intensity={1.5} castShadow />
      <Environment preset="warehouse" intensity={0.5} frames={2} />
      <MugPerso position={[0, 0, 0]} scale={100} texture={texture} color={mugColor} />
      <OrbitControls />
    </Canvas>
  </div>
</div>

  );
};

export default Scene;
