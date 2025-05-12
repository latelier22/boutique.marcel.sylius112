import React, { useEffect, useRef, useState, } from 'react';
import { Canvas, useThree } from '@react-three/fiber';
import { OrbitControls, Environment, MeshReflectorMaterial, Text, Float } from '@react-three/drei';
import MugPerso from '../models3d/MugPerso';
// import CarreauChevalet from './CarreauChevalet';
import { fabric } from 'fabric';
import * as THREE from 'three';
import ColorSelector from './ColorSelector';
import ScreenShotController from './ScreenShotController';
import { handleScreenshot } from './utils';
import { getSavedImageState, saveImageState } from './utils';
import { getProductSlugAndCode } from './utils'; // si elle est là


const Scene = () => {
  const canvasRef = useRef(null);
  const fabricCanvasRef = useRef(null);
  const [selectedImage, setSelectedImage] = useState(null);
  const [texture, setTexture] = useState(null);
  const [fitMode, setFitMode] = useState('contain');
  const canvasSizeRef = useRef({ width: 0, height: 0 });
  const [mugColor, setMugColor] = useState('#FFFFFF');
  const [rotate, setRotate] = useState(true);
  const [screenshot, setScreenshot] = useState(null);
  const canvasContainerRef = useRef(null);

  const { slug, code: variantCode } = getProductSlugAndCode();
  const configKey = `fabricImageState_${slug}_${variantCode}`;
  
  // console.log('slug', slug);
  // console.log('variantCode', variantCode);  
  

//   const saved = getSavedImageState(slug, variantCode);
// if (saved) {
//   image.set(saved);
// }




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
    const gallery = document.getElementById('screenshot-gallery');
    if (!gallery) return;
  
    const key = `fabricImageState_${slug}_${variantCode}`;
    const captures = JSON.parse(localStorage.getItem(key) || '[]');
  
    if (!Array.isArray(captures)) return;
  
    captures.forEach(({ id, previewUrl }) => {
      const wrapper = document.createElement('div');
      wrapper.className = 'screenshot-box';
  
      const img = new Image();
      img.src = previewUrl;
      img.className = 'screenshot-thumb';
  
      const closeBtn = document.createElement('span');
      closeBtn.innerText = '❌';
      closeBtn.className = 'screenshot-close';
      closeBtn.addEventListener('click', () => {
        wrapper.remove();
  
        const updated = captures.filter((entry) => entry.id !== id);
        localStorage.setItem(key, JSON.stringify(updated));
      });
  
      const downloadBtn = document.createElement('a');
      downloadBtn.href = previewUrl;
      downloadBtn.download = `${id}_preview.png`;
      downloadBtn.innerText = '💾';
      downloadBtn.className = 'screenshot-download';
  
      img.addEventListener('click', () => {
        const overlay = document.createElement('div');
        overlay.className = 'screenshot-overlay';
  
        const zoomed = new Image();
        zoomed.src = previewUrl;
        zoomed.className = 'screenshot-zoomed';
  
        overlay.appendChild(zoomed);
        document.body.appendChild(overlay);
        overlay.addEventListener('click', () => overlay.remove());
      });
  
      wrapper.appendChild(img);
      wrapper.appendChild(closeBtn);
      wrapper.appendChild(downloadBtn);
      gallery.appendChild(wrapper);
    });
  }, []);
  

  useEffect(() => {
    const canvas = fabricCanvasRef.current;
    if (!canvas) return;
  
    const image = canvas.getObjects().find(obj => obj.type === 'image');
    if (!image) return;
  
    const { width, height } = canvas;
    const imgRatio = image.width / image.height;
    const canvasRatio = width / height;
  
    let scale;
    if (fitMode === 'cover') {
      scale = Math.max(width / image.width, height / image.height);
    } else {
      scale = Math.min(width / image.width, height / image.height);
    }
  
    image.scale(scale);
    image.set({
      left: (width - image.getScaledWidth()) / 2,
      top: (height - image.getScaledHeight()) / 2,
  
      // ✅ Réapplique les propriétés interactives :
      lockUniScaling: true,
      hasBorders: true,
      hasControls: true,
      evented: true,
      selectable: true,
    });
  
    canvas.setActiveObject(image);
    canvas.renderAll();
  
    saveImageState(slug, variantCode, image);
  }, [fitMode]);
  
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

        image.set({
          left: (width - image.getScaledWidth()) / 2,
          top: (height - image.getScaledHeight()) / 2,
          lockUniScaling: true,
          hasBorders: true,
          hasControls: true,
          crossOrigin: 'anonymous',
        });

        const saved = getSavedImageState(slug, variantCode);

        if (saved) {
          image.set(saved);
        } else {
          // sauvegarder l'état par défaut si jamais il n'existe pas encore
          saveImageState(slug, variantCode, image);
        }
        

        canvas.add(image);
        canvas.renderAll();

        // 💾 Enregistrer quand on modifie l'image
        canvas.on('object:modified', () => {
          const [img] = canvas.getObjects('image');
          if (img) {
            saveImageState(slug, variantCode, img);
          }
        });
        

        setTimeout(() => {
          const newTexture = createCanvasTexture();
          setTexture(newTexture);
        }, 100);
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
  onClick={() => handleScreenshot({
    canvasContainerRef,
    fabricCanvasRef
  })}
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
          {/* <Environment  intensity={0.5} frames={2} /> */}
          <MugPerso position={[0, 0, 0]} scale={100} texture={texture} color={mugColor} />
          <OrbitControls />
        </Canvas>
      </div>
    </div>

  );
};

export default Scene;
