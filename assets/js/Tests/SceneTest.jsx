import React, { useEffect, useRef, useState} from 'react';
import { Canvas } from '@react-three/fiber';
import { OrbitControls , Environment,  MeshReflectorMaterial,Text, Float} from '@react-three/drei';
import MugPerso from '../models3d/MugPerso';
// import CarreauChevalet from './CarreauChevalet';
import { fabric } from 'fabric';
// import * as THREE from 'three';


const Scene = () => {

  return(
  
  <Canvas
  dpr={[1, 1.5]} // Limite la résolution sur mobile
  gl={{ antialias: false }}
  style={{ width: '100%', height: '1000px' }}
  camera={{ position: [0, 15, 35], fov: 40 }}
  shadows
  
  >
          <ambientLight intensity={0.5} />
          <directionalLight position={[10, 10, 10]} intensity={1.5} castShadow />
         
  
            <Environment  preset="warehouse" intensity={0.5} frames={2}/>
        
            {/* <MugPerso position={[0, 0, 0]} scale={100} texture={texture} color={mugColor} /> */}

         
          <OrbitControls  />
        </Canvas>
  );
};

export default Scene;
