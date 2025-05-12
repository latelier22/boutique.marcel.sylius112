import React, { useRef, useEffect } from "react";
import { useGLTF } from "@react-three/drei";
import { useFrame } from '@react-three/fiber';
import * as THREE from 'three';

const COLOR_MAP = {
  rouge: '#ff0000',
  noir: '#000000',
  blanc: '#ffffff',
  bleu: '#0000ff',
  vert: '#00ff00',
  jaune: '#ffff00',
  gris: '#888888',
};

export function MugColor({ isRotating, position = [0, -2, 0], color = 'blanc' }) {
  const cubeRef = useRef();
  const { nodes, materials } = useGLTF("/models3d/MugModel.gltf");
  const localMaterials = useRef({});

  useEffect(() => {
    if (!materials || Object.keys(localMaterials.current).length > 0) return;

    for (const key in materials) {
      localMaterials.current[key] = materials[key].clone();
    }

    const hexColor = COLOR_MAP[color] || '#ffffff';
    localMaterials.current['color-material'].color = new THREE.Color(hexColor);
  }, [materials, color]);

  useFrame(() => {
    if (cubeRef.current && isRotating) {
      cubeRef.current.rotation.y += 0.005;
    }
  });

  if (Object.keys(localMaterials.current).length === 0) return null;

  return (
    <group ref={cubeRef} position={position} scale={[50, 50, 50]} dispose={null}>
      <group rotation={[0, -0.412, 0]}>
        <mesh geometry={nodes.Cylinder003.geometry} material={localMaterials.current.Material_1} />
        <mesh geometry={nodes.Cylinder003_1.geometry} material={localMaterials.current["color-material"]} />
      </group>
      <mesh geometry={nodes.Exterior.geometry} material={localMaterials.current["white-material"]} rotation={[0, -0.412, 0]} />
      <mesh geometry={nodes.Impression.geometry} material={localMaterials.current["map-material"]} rotation={[0, -0.412, 0]} />
      <mesh geometry={nodes.Interior.geometry} material={localMaterials.current["color-material"]} rotation={[0, -0.412, 0]} />
    </group>
  );
}

useGLTF.preload("/models3d/MugModel.gltf");

export default MugColor;
