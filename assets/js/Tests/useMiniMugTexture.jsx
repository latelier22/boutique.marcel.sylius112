import { useEffect, useState } from 'react';
import * as THREE from 'three';

const useMiniMugTexture = (imageUrl) => {
  const [texture, setTexture] = useState(null);

  useEffect(() => {
    if (!imageUrl) return;

    const canvas = document.createElement('canvas');
    const ratio = 8 / 22;
    const width = 1100;
    const height = Math.floor(width * ratio);
    canvas.width = width;
    canvas.height = height;

    const ctx = canvas.getContext('2d');
    ctx.fillStyle = '#ffffff';
    ctx.fillRect(0, 0, width, height);

    const img = new Image();
    img.crossOrigin = 'anonymous';
    img.onload = () => {
      const imgRatio = img.width / img.height;
      const canvasRatio = width / height;

      let drawWidth, drawHeight;

      if (imgRatio > canvasRatio) {
        drawWidth = width;
        drawHeight = width / imgRatio;
      } else {
        drawHeight = height;
        drawWidth = height * imgRatio;
      }

      const offsetX = (width - drawWidth) / 2;
      const offsetY = (height - drawHeight) / 2;
      ctx.drawImage(img, offsetX, offsetY, drawWidth, drawHeight);

      const tex = new THREE.CanvasTexture(canvas);
      tex.needsUpdate = true;
      tex.minFilter = THREE.LinearFilter;
      setTexture(tex);
    };
    img.src = imageUrl;

  }, [imageUrl]);

  return texture;
};

export default useMiniMugTexture;
