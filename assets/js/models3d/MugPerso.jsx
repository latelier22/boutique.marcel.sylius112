import React, { useRef, useEffect } from 'react'
import { useFrame, useThree } from '@react-three/fiber'
import { useGLTF } from '@react-three/drei'
import * as THREE from 'three'

// MODELISATION DU MUB IMPORT BLENDER

function MugModel(props) {
    const group = useRef();
    const { nodes, materials } = useGLTF("/models3d/MugModel.gltf");
    const { gl } = useThree();

    const canvas = document.getElementsByTagName('canvas')[0];
    if (!canvas) {
      console.warn('⛔ Aucun canvas trouvé dans le DOM.');
      return null;
    }

    const ctx = canvas.getContext('2d');
    const texture = new THREE.CanvasTexture(ctx.canvas);
    texture.flipY = false;
    texture.anisotropy = gl.capabilities.getMaxAnisotropy();
    texture.needsUpdate = true;

    useFrame(() => {
        texture.needsUpdate = true;
    });

    // ✅ Mise à jour du matériau coloré
    useEffect(() => {
        if (materials['color-material']) {
            materials['color-material'].color = new THREE.Color(props.color || '#ffffff');
        }
    }, [props.color]);

    return (
        <group scale={10} rotation={[0, 1.812, 0]} position={[0, -0.5, 0]} ref={group} {...props} dispose={null}>
            <group rotation={[0, -0.412, 0]}>
                <mesh castShadow receiveShadow geometry={nodes.Exterior.geometry} material={materials['white-material']} />
                <mesh castShadow receiveShadow geometry={nodes.Cylinder003_1.geometry} material={materials['color-material']} />
            </group>
            <mesh castShadow receiveShadow geometry={nodes.Exterior.geometry} material={materials['white-material']} rotation={[0, -0.412, 0]} />
            <mesh
                rotation={[0, -0.412, 0]}
                castShadow
                receiveShadow
                geometry={nodes.Impression.geometry}
                material={materials['map-material']}
                flipY={true}
            >
                <meshStandardMaterial attach="material" map={texture}>
                    <canvasTexture attach="map" image={canvas} />
                </meshStandardMaterial>
            </mesh>
            <mesh castShadow receiveShadow geometry={nodes.Interior.geometry} material={materials['color-material']} rotation={[0, -0.412, 0]} />
        </group>
    );
}


useGLTF.preload('/models3d/MugModel.gltf')

export default MugModel



