'use client';
import React, { useEffect, useMemo, useRef, useState } from 'react';
import { useGLTF, useTexture } from '@react-three/drei';
import { useSpringValue, a } from '@react-spring/three';
import * as THREE from 'three';

export default function PPetImageAnim({
  largeur = 20,
  hauteur = 20,
  largeurPP = 10,
  hauteurPP = 10,
  textureURL = '/tableau.webp',
  scale = 1,
  colorPP = '#ffffff',
  animation = true,
  ...props
}) {
  const { nodes, materials } = useGLTF('/PPetImage.gltf');
  const geometry1 = useMemo(() => nodes.Plane_1.geometry.clone(), [nodes]);
  const geometry2 = useMemo(() => nodes.Plane_2.geometry.clone(), [nodes]);
  const texture = useTexture(textureURL);
  const [ppColor, setPpColor] = useState(colorPP);
  // Préparer texture
  texture.center.set(0.5, 0.5);
  texture.rotation = Math.PI;
  texture.needsUpdate = true;

  // Constants
  const defaultSize = 20;
  const scaleX = largeur / defaultSize;
  const scaleZ = hauteur / defaultSize;
  const halfPPX = largeurPP / 2;
  const halfPPZ = hauteurPP / 2;
  const biseauRatio = 0.57639 / 0.58988;
  const epaisseur = 0.03;

  const planRef = useRef();



  // const randomColor = cansonColors[Math.floor(Math.random() * cansonColors.length)].hex;


  // useEffect(() => {
  //   const interval = setInterval(() => {
  //     setPpColor('#' + Math.floor(Math.random() * 16777215).toString(16).padStart(6, '0'));
  //   }, 1000); // toutes les secondes

  //   return () => clearInterval(interval);
  // }, []);


  // useEffect(() => {
  //   const interval = setInterval(() => {
  //     const num = Math.floor(Math.random() * cansonColors.length);
  //     console.log(cansonColors[num].name);
  //     setPpColor(cansonColors[num].hex);
  //   }, 1000); // toutes les secondes


  //   return () => clearInterval(interval);
  // }, []);




  // Set geometry transformations
  useEffect(() => {
    const move = (geometry, indices, getX, getZ) => {
      const pos = geometry.attributes.position.array;
      indices.forEach(index => {
        const i = index * 3;
        pos[i] = getX(pos[i]);
        pos[i + 2] = getZ(pos[i + 2]);
      });
      geometry.attributes.position.needsUpdate = true;
    };

    const OUTER_TOP = [
      { geometry: geometry1, indices: [0, 1, 2, 3, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39] },
      { geometry: geometry2, indices: [4, 5, 6, 7] },
    ];
    const OUTER_BOTTOM = [
      { geometry: geometry1, indices: [48, 49, 50, 51, 52, 53, 54, 55] },
      { geometry: geometry2, indices: [17, 18, 19, 20, 21, 22, 23, 24, 25] },
    ];
    const INNER_TOP = [
      { geometry: geometry1, indices: Array.from({ length: 24 }, (_, i) => i + 4) },
      { geometry: geometry2, indices: [0, 1, 2, 3] },
    ];
    const INNER_BOTTOM = [
      { geometry: geometry1, indices: [40, 41, 42, 43, 44, 45, 46, 47] },
      { geometry: geometry2, indices: [8, 9, 10, 11, 12, 13, 14, 15, 16] },
    ];

    [...OUTER_TOP, ...OUTER_BOTTOM].forEach(({ geometry, indices }) =>
      move(geometry, indices, x => Math.sign(x) * scaleX, z => Math.sign(z) * scaleZ)
    );
    INNER_TOP.forEach(({ geometry, indices }) =>
      move(geometry, indices, x => Math.sign(x) * halfPPX / 10, z => Math.sign(z) * halfPPZ / 10)
    );
    INNER_BOTTOM.forEach(({ geometry, indices }) =>
      move(geometry, indices,
        x => Math.sign(x) * halfPPX / 10 * biseauRatio,
        z => Math.sign(z) * halfPPZ / 10 * biseauRatio
      )
    );

    // Positionnement image
    if (planRef.current) {
      let minX = Infinity, maxX = -Infinity;
      let minZ = Infinity, maxZ = -Infinity;
      INNER_TOP.forEach(({ geometry, indices }) => {
        const pos = geometry.attributes.position.array;
        indices.forEach(index => {
          const i = index * 3;
          const x = pos[i];
          const z = pos[i + 2];
          if (x < minX) minX = x;
          if (x > maxX) maxX = x;
          if (z < minZ) minZ = z;
          if (z > maxZ) maxZ = z;
        });
      });
      const centerX = (minX + maxX) / 2;
      const centerZ = (minZ + maxZ) / 2;
      const width = maxX - minX;
      const height = maxZ - minZ;
      planRef.current.position.set(centerX, 0, centerZ);
      planRef.current.scale.set(width, height, 1);
    }
  }, [largeur, hauteur, largeurPP, hauteurPP, geometry1, geometry2]);

  // 🔁 Animations
  const rotationZ = useSpringValue(0);
  const offset = useSpringValue(0);

  useEffect(() => {
    let cancel = false;
    let running = false;

    const runAnimation = async () => {
      running = true;
      while (!cancel && animation) {
        await rotationZ.start({ to: Math.PI / 3, config: { duration: 3000 } });
        if (!animation || cancel) break;

        await offset.start({ to: epaisseur * 10, config: { duration: 1000 } });
        if (!animation || cancel) break;

        await rotationZ.start({ to: 0, config: { duration: 1000 } });
        if (!animation || cancel) break;

        await offset.start({ to: 0, config: { duration: 1000 } });
        if (!animation || cancel) break;

        await rotationZ.start({ to: -Math.PI / 3, config: { duration: 3000 } });
        if (!animation || cancel) break;

        await offset.start({ to: epaisseur * 10, config: { duration: 1000 } });
        if (!animation || cancel) break;

        await rotationZ.start({ to: 0, config: { duration: 1000 } });
        if (!animation || cancel) break;

        await offset.start({ to: 0, config: { duration: 1000 } });
      }
      running = false;
    };

    if (animation && !running) {
      runAnimation();
    } else {
      cancel = true;
      rotationZ.stop();
      offset.stop();
      rotationZ.set(0);
      offset.set(0);
    }

    return () => {
      cancel = true;
      rotationZ.stop();
      offset.stop();
      rotationZ.set(0);
      offset.set(0);
    };
  }, [animation, rotationZ, offset]);



  return (
    <group rotation={props.rotation} >
      <a.group {...props} dispose={null} scale={scale * 10} rotation-z={rotationZ}>
        {/* Dos blanc */}
        <a.mesh position-y={offset.to(v => -epaisseur - 2 * v)} receiveShadow>
          <boxGeometry args={[scaleX * 2, epaisseur, scaleZ * 2]} />
          <meshStandardMaterial color="white" />
        </a.mesh>

        {/* Image */}
        <a.group ref={planRef} rotation={[-Math.PI / 2, 0, 0]} position-y={offset.to(v => -v / 2)}>
          <mesh castShadow receiveShadow>
            <planeGeometry args={[1, 1]} />
            <meshStandardMaterial color="white" side={THREE.BackSide} toneMapped={false} />
          </mesh>
          <mesh castShadow receiveShadow>
            <planeGeometry args={[1, 1]} />
            <meshStandardMaterial map={texture} side={THREE.FrontSide} toneMapped={false} />
          </mesh>
        </a.group>

        {/* Passe-partout */}
        <a.mesh geometry={geometry1} position-y={offset.to(v => -v * 0.25 + 0.01)} castShadow receiveShadow>
  <meshPhysicalMaterial
    color="white"
    roughness={0.6}
    metalness={0}
    clearcoat={0.5}
    clearcoatRoughness={0.1}
    toneMapped={false}
  />
</a.mesh>

<a.mesh geometry={geometry2} position-y={offset.to(v => -v * 0.25 + 0.01)} castShadow receiveShadow>
  <meshPhysicalMaterial
    color={colorPP}
    roughness={0.6}
    metalness={0}
    clearcoat={0.5}
    clearcoatRoughness={0.1}
    toneMapped={false}
  />
</a.mesh>

      </a.group>
    </group>
  );
}

useGLTF.preload('/PPetImage.gltf');
