import React, { useRef } from "react";
import { useGLTF } from "@react-three/drei";
import { useFrame } from '@react-three/fiber';

export function Model3D({ isRotating, position = [0, -7, 0] }) {
    const cubeRef = useRef();

    // Faites tourner le cube si isRotating est vrai
    useFrame(() => {
        if (cubeRef.current && isRotating) {
            cubeRef.current.rotation.y += 0.005; // Vitesse de rotation
        }
    });

    const { nodes, materials } = useGLTF("/models3d/MugModel.gltf");

    return (
        <group  ref={cubeRef}  position={position} scale={[120, 120, 120]} dispose={null}>
            <group rotation={[0, -0.412, 0]}>
                <mesh
                    castShadow
                    receiveShadow
                    geometry={nodes.Cylinder003.geometry}
                    material={materials.Material_1}
                />
                <mesh
                    castShadow
                    receiveShadow
                    geometry={nodes.Cylinder003_1.geometry}
                    material={materials["color-material"]}
                />
            </group>
            <mesh
                castShadow
                receiveShadow
                geometry={nodes.Exterior.geometry}
                material={materials["white-material"]}
                rotation={[0, -0.412, 0]}
            />
            <mesh
                castShadow
                receiveShadow
                geometry={nodes.Impression.geometry}
                material={materials["map-material"]}
                rotation={[0, -0.412, 0]}
            />
            <mesh
                castShadow
                receiveShadow
                geometry={nodes.Interior.geometry}
                material={materials["color-material"]}
                rotation={[0, -0.412, 0]}
            />
        </group>
    );
}

export default Model3D;

useGLTF.preload("/models3d/MugModel.gltf");
