// MiniMugPreview.jsx
import React, { useEffect, useRef, useState } from 'react';
import { Canvas } from '@react-three/fiber';
import { OrbitControls, Environment } from '@react-three/drei';
import MugPerso from '../models3d/MugPerso';

const MiniMugPreview = ({ slug, code }) => {
  const [texture, setTexture] = useState(null);
  const canvasRef = useRef(null);

  useEffect(() => {
    const key = `fabricImageState_${slug}_${code}`;
    const state = JSON.parse(localStorage.getItem(key));
    const img = new Image();

    // on peut imaginer que tu as stocké un dataURL ou une image persistée
    img.src = state?.preview || '/default-preview.png';
    img.onload = () => {
      const canvas = document.createElement('canvas');
      canvas.width = img.width;
      canvas.height = img.height;
      const ctx = canvas.getContext('2d');
      ctx.drawImage(img, 0, 0);
      const tex = new THREE.CanvasTexture(canvas);
      setTexture(tex);
    };
  }, [slug, code]);

  return (
    <div className="card">
      <div className="content">
        <div className="header">{slug}</div>
        <div className="meta">{code}</div>
      </div>
      <div className="image" style={{ height: 200 }}>
        <Canvas
          dpr={[1, 2]}
          camera={{ position: [0, 15, 35], fov: 40 }}
          gl={{ preserveDrawingBuffer: true }}
        >
          <ambientLight intensity={0.6} />
          <directionalLight position={[10, 10, 10]} />
          <Environment preset="city" />
          <MugPerso position={[0, 0, 0]} scale={100} texture={texture} />
          <OrbitControls enableZoom={false} enablePan={false} autoRotate />
        </Canvas>
      </div>
    </div>
  );
};

export default MiniMugPreview;
