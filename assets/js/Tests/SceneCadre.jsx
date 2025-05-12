"use client";

import React, { useState, useEffect, Suspense } from 'react';
import { useRef } from 'react';
import { Canvas } from '@react-three/fiber';
import { OrbitControls, MeshReflectorMaterial } from '@react-three/drei';
import CadreMixte from './components/CadreMixte';
import PPetImageAnim from './components/PPetImageAnim';
import { cansonColors } from './components/PaletteColors';

import { Leva, useControls } from 'leva';

export default function PageClient() {
  // --- Etats pour configuration principale ---
  const [frameColor, setFrameColor] = useState('#ad5d16');
  const [PPColor, setPPColor] = useState('#222222');
  const [backgroundColor, setBackgroundColor] = useState('#ebe1e0');

  // const [largeurBaguette, setLargeurBaguette] = useState(1);
  // const [hauteurBaguette, setHauteurBaguette] = useState(2);
  // const [largeurFeuillure, setLargeurFeuillure] = useState(1);
  // const [hauteurFeuillure, setHauteurFeuillure] = useState(0.5);

  const [selectedColorIndex, setSelectedColorIndex] = useState(0);
  const [selectedTarget, setSelectedTarget] = useState('Cadre');

  const [textureURL, setTextureURL] = useState(null);

  const [imageSize, setImageSize] = useState({ largeur: 40, hauteur: 40 });
  const [imageReady, setImageReady] = useState(false);

  // Etats pour gérer le Spotlight
  const [spotIntensity, setSpotIntensity] = useState(10);
  const [spotPosition, setSpotPosition] = useState([5, 5, 5]);
  const [spotAngle, setSpotAngle] = useState(0.3);
  const [spotPenumbra, setSpotPenumbra] = useState(1.5);


  const [selectedImage, setSelectedImage] = useState(null);

  const targetRef = useRef();
  





  const [{ hauteurBaguette, hauteurFeuillure, largeurBaguette, largeurFeuillure, rotationCadreActive, murIsVisible, bandePP }, set] = useControls('Réglages Baguette', () => ({
    hauteurBaguette: { value: 2, min: 1, max: 10, step: 0.5 },
    hauteurFeuillure: { value: 0.5, min: 0.5, max: 10, step: 0.5 },
    largeurBaguette: { value: 1, min: 1, max: 15, step: 0.5 },
    largeurFeuillure: { value: 1, min: 0.5, max: 9, step: 0.5 },
    rotationCadreActive: { value: false, label: 'Rotation Cadre' },
    murIsVisible: { value: true, label: 'Mur Visible' },
    bandePP: { value: 7.5, min: 0, max: 15, step: 0.5, label: 'Largeur Bande PP' }, // 👈 ajout ici
  }));
  
  // Sécurisation avant de passer aux composants
const safeHauteurBaguette = Math.max(1, hauteurBaguette || 1);
const safeLargeurBaguette = Math.max(1, largeurBaguette || 1);

// Hauteur feuillure ne peut pas dépasser hauteur baguette - 0.5
const safeHauteurFeuillure = Math.min(hauteurFeuillure || 0.5, safeHauteurBaguette - 0.5);

// Largeur feuillure ne peut pas dépasser largeur baguette - 0.5
const safeLargeurFeuillure = Math.min(largeurFeuillure || 0.5, safeLargeurBaguette - 0.5);

const safeRotationCadre = rotationCadreActive ? Math.PI : 0;


  
  const ppZ = safeHauteurFeuillure + 0.05;
  const cadreZ= rotationCadreActive ? hauteurBaguette : 0

  useEffect(() => {
    const img = document.getElementById('associated-image');
    const mainImageContainer = document.getElementById('main-image');
      if (mainImageContainer) {
        mainImageContainer.style.display = 'none';
      }
    if (img && img.src) {
      const src = img.src;
      const image = new Image();
      image.src = src;
      image.onload = () => {
        const ratio = image.height / image.width;
        const largeur = 40;
        const hauteur = largeur * ratio;
        setTextureURL(src);        // ✅ DIRECTEMENT dans textureURL
        setImageSize({ largeur, hauteur });
        setImageReady(true);       // ✅ Permet de rendre PPetImageAnim
      };
      img.style.display = 'none'; // Cache l'image HTML
    }
  }, []);
  
  

  // --- Fonction pour charger une miniature ---
  const handleThumbnailClick = (src) => {
    const img = new Image();
    img.src = src;
    img.onload = () => {
      const ratio = img.height / img.width;
      const largeur = 40;
      const hauteur = largeur * ratio;
      setTextureURL(src);
      setImageSize({ largeur, hauteur });
      setImageReady(true);
    };
  };

  useEffect(() => {
    if (selectedImage) {
      const img = new Image();
      img.src = selectedImage;
      img.onload = () => {
        const ratio = img.height / img.width;
        const largeur = 40;
        const hauteur = largeur * ratio;
        setImageSize({ largeur, hauteur });
        setImageReady(true);
        setTextureURL(selectedImage); // ✅ utiliser selectedImage
      };
    }
  }, [selectedImage]);

 
  

  // --- Palette de couleurs : clic sur couleur ---
  const handleColorClick = (color, index) => {
    setSelectedColorIndex(index);

    if (selectedTarget === 'Cadre') {
      setFrameColor(color.hex);
    } else if (selectedTarget === 'PP') {
      setPPColor(color.hex);
    } else if (selectedTarget === 'Mur') {
      setBackgroundColor(color.hex);
    }
  };

  // Fonction pour obtenir une couleur de texte lisible sur un fond
  function getContrastColor(hexColor) {
    if (!hexColor) return 'black';
    const r = parseInt(hexColor.substr(1, 2), 16);
    const g = parseInt(hexColor.substr(3, 2), 16);
    const b = parseInt(hexColor.substr(5, 2), 16);
    const brightness = (r * 299 + g * 587 + b * 114) / 1000;
    return brightness > 128 ? 'black' : 'white';
  }

  const hauteurCadreExt = imageSize.hauteur / imageSize.largeur * 40 + 10;
const largeurCadreExt = 50;

const largeurOuverturePP = largeurCadreExt - 2 * bandePP;
const hauteurOuverturePP = hauteurCadreExt - 2 * bandePP;


  return (
    <div className="container">
      {/* --- Canvas 3D --- */}
      <div className="espace-carre">
        <Canvas shadows camera={{ position: [-2, 2, 10], fov: 60 }}>
          <color attach="background" args={[backgroundColor]} />

          <mesh ref={targetRef} position={[0, 0, 0]} visible={false} />

          {/* Lumières */}
          <directionalLight
            position={spotPosition}
            intensity={spotIntensity}
            castShadow
            shadow-mapSize-width={1024}
            shadow-mapSize-height={1024}
            shadow-camera-near={1}
            shadow-camera-far={20}
            shadow-camera-left={-10}
            shadow-camera-right={10}
            shadow-camera-top={10}
            shadow-camera-bottom={-10}
            
          />
          <ambientLight intensity={spotPenumbra} />

          {/* Lumière Spot */}
          {/* SpotLight haut-gauche */}
          <spotLight
            position={spotPosition}
            intensity={spotIntensity}
            angle={spotAngle}
            penumbra={spotPenumbra}
            castShadow
            target={targetRef.current}
          />


          {/* Sol Réfléchissant */}
          <mesh position={[0, -5, 10]} rotation={[-Math.PI / 2, 0, -Math.PI / 2]} receiveShadow>
            <planeGeometry args={[200, 200]} />
            <MeshReflectorMaterial
              blur={[200, 100]}
              resolution={1024}
              mixBlur={1}
              mixStrength={100}
              roughness={0.8}
              depthScale={1.1}
              minDepthThreshold={0.3}
              maxDepthThreshold={0.6}
              color="#111111"
              metalness={0.5}
            />
          </mesh>

          {/* Contenu 3D */}
          <Suspense fallback={null}>
          <CadreMixte
  castShadow
  receiveShadow
  position={[0, 0, cadreZ/10]}
  rotation={[0, Math.PI/2 + safeRotationCadre, Math.PI / 2]}
  frameColor={frameColor}
  opacity={0.5}
  CadreExtWidth={imageSize.hauteur / imageSize.largeur * 40 + 15}
  CadreExtHeight={55}
  BaguetteWidth={safeLargeurBaguette}
  BaguetteHeight={safeHauteurBaguette}
  RabateWidth={safeLargeurFeuillure}
  RabateHeight={safeHauteurFeuillure}
  BaguetteSeule={false}
  scale={0.1}
/>

             {imageReady && (
              <PPetImageAnim
               receiveShadow
                animation={false}
                textureURL={textureURL}
              
                largeurPP={largeurOuverturePP}
                hauteurPP={hauteurOuverturePP}
                largeur={largeurCadreExt}
                hauteur={hauteurCadreExt}
                scale={0.1}
                rotation={[0, -Math.PI / 2, -Math.PI / 2]}
                colorPP={PPColor}
                position={[0,  ppZ/10,0]} // 👈 nouveau
              />
            )}

            {murIsVisible && (
            <mesh position={[0, 0, -0.6]} castShadow receiveShadow>
              <boxGeometry args={[10, 10, 1]} />
              <meshStandardMaterial color={backgroundColor} />
            </mesh>
            )}
          </Suspense>

          <OrbitControls />
        </Canvas>

        {/* --- Choix cible couleur --- */}
        <div style={{ display: 'flex', alignItems: 'justify-center', marginTop: '10px' , padding: '10px'}}>
          <button
            onClick={() => setSelectedTarget('Cadre')}
            style={{
              flex: 1,
              backgroundColor: frameColor,
              color: getContrastColor(frameColor),
              padding: '10px',
            }}
          >
            Couleur du cadre
          </button>

          <button
            onClick={() => setSelectedTarget('PP')}
            style={{
              flex: 1,
              backgroundColor: PPColor,
              color: getContrastColor(PPColor),
              padding: '10px'
            }}
          >
            Couleur du PP
          </button>

          <button
            onClick={() => setSelectedTarget('Mur')}
            style={{
              flex: 1,
              backgroundColor: backgroundColor,
              color: getContrastColor(backgroundColor),
              padding: '10px'
            }}
          >
            Couleur du mur
          </button>
        </div>
        <Leva collapsed={false} />
       


        {/* Contrôles du SpotLight */}
<div style={{ marginTop: '20px' }}>
<h3>TYPE DE BAGUETTES</h3>
{/* <label>Hauteur baguette: {hauteurBaguette.toFixed(2)}</label>
<input
  type="range"
  min="1"
  max="5"
  step="0.5"
  value={hauteurBaguette}
  onChange={(e) => handleHauteurBaguetteChange(e.target.value)}
/>
<label>Hauteur feuillure: {hauteurFeuillure.toFixed(2)}</label>
<input
  type="range"
  min="0.5"
  max="5"
  step="0.5"
  value={hauteurFeuillure}
  onChange={(e) => handleHauteurFeuillureChange(e.target.value)}
/>

<label>Largeur baguette: {largeurBaguette.toFixed(2)}</label>
<input
  type="range"
  min="1"
  max="15"
  step="0.5"
  value={largeurBaguette}
  onChange={(e) => setLargeurBaguette(parseFloat(e.target.value))}
/>
<label>Largeur feuillure: {largeurFeuillure.toFixed(2)}</label>
<input
  type="range"
  min="0.5"
  max="9"
  step="0.5"
  value={largeurFeuillure}
  onChange={(e) => setLargeurFeuillure(parseFloat(e.target.value))}
/> */}
<div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: '10px' }}>
  <h3>Spotlight Settings</h3>
  
  <label>Intensité : {spotIntensity.toFixed(2)}</label>
  <input 
    type="range" 
    min="0" 
    max="10" 
    step="0.1" 
    value={spotIntensity} 
    onChange={(e) => setSpotIntensity(parseFloat(e.target.value))} 
    style={{ width: '100%' }}
  />

  <label>Position X : {spotPosition[0]}</label>
  <input 
    type="range" 
    min="-20" 
    max="20" 
    step="0.5" 
    value={spotPosition[0]} 
    onChange={(e) => setSpotPosition([parseFloat(e.target.value), spotPosition[1], spotPosition[2]])}
    style={{ width: '100%' }}
  />

  <label>Position Y : {spotPosition[1]}</label>
  <input 
    type="range" 
    min="0" 
    max="20" 
    step="0.5" 
    value={spotPosition[1]} 
    onChange={(e) => setSpotPosition([spotPosition[0], parseFloat(e.target.value), spotPosition[2]])}
    style={{ width: '100%' }}
  />

  <label>Position Z : {spotPosition[2]}</label>
  <input 
    type="range" 
    min="-10" 
    max="20" 
    step="0.5" 
    value={spotPosition[2]} 
    onChange={(e) => setSpotPosition([spotPosition[0], spotPosition[1], parseFloat(e.target.value)])}
    style={{ width: '100%' }}
  />

  <label>Angle : {spotAngle.toFixed(2)}</label>
  <input 
    type="range" 
    min="0.1" 
    max="1" 
    step="0.05" 
    value={spotAngle} 
    onChange={(e) => setSpotAngle(parseFloat(e.target.value))}
    style={{ width: '100%' }}
  />

  <label>Pénombre : {spotPenumbra.toFixed(2)}</label>
  <input 
    type="range" 
    min="0" 
    max="3" 
    step="0.1" 
    value={spotPenumbra} 
    onChange={(e) => setSpotPenumbra(parseFloat(e.target.value))}
    style={{ width: '100%' }}
  />
</div>
</div>
        <div className="miniatures-wrap">
          {[
            'TAB0002', 'TAB0003', 'TAB0006', 'TAB0007', 'TAB0008', 'TAB0009',
            'TAB0010', 'TAB0011', 'TAB0012', 'TAB0013', 'TAB0014', 'TAB0015',
            'TAB0017', 'TAB0018', 'TAB0019', 'TAB0021', 'TAB0022'
          ].map((code) => {
            const src = `/media/image/TAB/${code}.webp`;
            return (
              <img
                key={code}
                src={src}
                className="miniature"
                onClick={() => handleThumbnailClick(src)}
                alt={code}
              />
            );
          })}
        </div>
      </div>

      {/* --- Palette verticale de couleurs --- */}
      <div className="palette-scroll-container">
        <div className="palette-scroll">
          {cansonColors.map((color, index) => (
            <div
              key={index}
              onClick={() => handleColorClick(color, index)}
              style={{
                height: '50px',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                background: color.hex,
                color: index === selectedColorIndex ? 'black' : 'white',
                fontWeight: index === selectedColorIndex ? 'bold' : 'normal',
                fontSize: index === selectedColorIndex ? '1.2rem' : '0.8rem',
                transition: 'all 0.3s ease-in-out',
                cursor: 'pointer',
                flexShrink: 0
              }}
            >
              {color.name}
            </div>
          ))}
        </div>
      </div>

      {/* --- Miniatures images --- */}

    </div>
  );
}
