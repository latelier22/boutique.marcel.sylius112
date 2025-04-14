// Cube.js
import React from 'react';
// Cube.js
import { useRef } from 'react';
import { useFrame } from '@react-three/fiber';

function Cube() {
  const cubeRef = useRef();

  // Faites tourner le cube
  useFrame(() => {
    if (cubeRef.current) {
      cubeRef.current.rotation.y += 0.01;
    }
  });

  return (
    <mesh 
      ref={cubeRef} 
      position={[0, 0, 0]} 
      castShadow 
      receiveShadow
    >
      <boxGeometry args={[1, 1, 1]} />
      <meshStandardMaterial 
        color="royalblue" 
        roughness={0.5} 
        metalness={0.5} 
        shadowSide={2} // Permet de gérer les ombres sur les faces du cube
      />
    </mesh>
  );
}

export default Cube;
