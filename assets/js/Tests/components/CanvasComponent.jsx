import React, { useEffect, Suspense, useRef } from 'react';
import { Canvas } from '@react-three/fiber';
import { OrbitControls, MeshReflectorMaterial } from '@react-three/drei';
import CadreMixte from './CadreMixte';
import PPetImageAnim from './PPetImageAnim';
import { useCadreStore } from './store/useCadreStore';

export default function CanvasComponent() {
  const {
    textureURL, imageSize, imageReady,
    frameColor, PPColor, backgroundColor,
    hauteurBaguette, largeurBaguette, hauteurFeuillure, largeurFeuillure,
    rotationCadreActive, murIsVisible,
    bandePP,
    spotIntensity, spotPosition, spotAngle, spotPenumbra,
    setTexture,
  } = useCadreStore();

  const targetRef = useRef();

  // Chargement automatique depuis l'image #associated-image
  useEffect(() => {
    const mainImageContainer = document.getElementById('main-image');
    if (mainImageContainer) {
      mainImageContainer.style.display = 'none';
    }
    const img = document.getElementById('associated-image');
    if (img && img.src) {
      const image = new Image();
      image.src = img.src;
      image.onload = () => {
        const ratio = image.height / image.width;
        const largeur = 40;
        const hauteur = largeur * ratio;
        setTexture(img.src, largeur, hauteur);
      };
      img.style.display = 'none';
    }
  }, []);

  // Calculs sécurisés
  const safeHauteurBaguette = Math.max(1, hauteurBaguette);
  const safeLargeurBaguette = Math.max(1, largeurBaguette);
  const safeHauteurFeuillure = Math.min(hauteurFeuillure, safeHauteurBaguette - 0.5);
  const safeLargeurFeuillure = Math.min(largeurFeuillure, safeLargeurBaguette - 0.5);
  const safeRotationCadre = rotationCadreActive ? Math.PI : 0;
  const ppZ = safeHauteurFeuillure + 0.05;
  const cadreZ = rotationCadreActive ? hauteurBaguette : 0;

  // Calcul taille du cadre
  const largeurCadreExt = 50;
  const hauteurCadreExt = (imageSize.hauteur / imageSize.largeur) * 40 + 10;
  const largeurOuverturePP = largeurCadreExt - 2 * bandePP;
  const hauteurOuverturePP = hauteurCadreExt - 2 * bandePP;

  return (
    <div className="canvas-container" >
      <Canvas shadows camera={{ position: [-2, 2, 10], fov: 60 }}>
        <color attach="background" args={[backgroundColor]} />

        {/* Target pour spotlight */}
        <mesh ref={targetRef} visible={false} position={[0, 0, 0]} />

        {/* Lumières */}
        <directionalLight position={spotPosition} intensity={spotIntensity} castShadow />
        <ambientLight intensity={spotPenumbra} />
        <spotLight
          position={spotPosition}
          intensity={spotIntensity}
          angle={spotAngle}
          penumbra={spotPenumbra}
          castShadow
          target={targetRef.current}
        />

        {/* Sol */}
        <mesh position={[0, -5, 10]} rotation={[-Math.PI / 2, 0, -Math.PI / 2]} receiveShadow>
          <planeGeometry args={[200, 200]} />
          <MeshReflectorMaterial
            blur={[200, 100]}
            resolution={1024}
            mixStrength={100}
            roughness={0.8}
            color="#111111"
            metalness={0.5}
          />
        </mesh>

        {/* Contenu 3D */}
        <Suspense fallback={null}>
          <CadreMixte
            castShadow
            receiveShadow
            position={[0, 0, cadreZ / 10]}
            rotation={[0, Math.PI / 2 + safeRotationCadre, Math.PI / 2]}
            frameColor={frameColor}
            opacity={0.5}
            CadreExtWidth={hauteurCadreExt + 5}
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
              position={[0, ppZ / 10, 0]}
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
    </div>
  );
}
