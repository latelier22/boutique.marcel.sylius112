import React, { useRef, useEffect } from 'react'
import { useFrame, useThree } from '@react-three/fiber'
import { useGLTF } from '@react-three/drei'
import * as THREE from 'three'

function MugModel(props) {
  const group = useRef()
  const { nodes, materials } = useGLTF("/models3d/MugModel.gltf");
  const { gl } = useThree()

  // Création canvas offscreen
  const canvas = document.createElement('canvas')
  canvas.width = 1024
  canvas.height = 512
  const ctx = canvas.getContext('2d')

  // Crée la texture depuis le canvas
  const texture = new THREE.CanvasTexture(canvas)
  texture.flipY = false
  texture.anisotropy = gl.capabilities.getMaxAnisotropy()
  texture.needsUpdate = true

  // 🎯 Au montage : dessiner l'image HTML dans le canvas
  useEffect(() => {
    const image = document.getElementById('main-image')
    if (image && image.complete) {
      ctx.drawImage(image, 0, 0, canvas.width, canvas.height)
      texture.needsUpdate = true
    } else if (image) {
      image.onload = () => {
        ctx.drawImage(image, 0, 0, canvas.width, canvas.height)
        texture.needsUpdate = true
      }
    }
  }, [])

  useFrame(() => {
    if (props.animation) {
      group.current.rotation.y += (props.reverse ? -1 : 1) * props.animationSpeed * 0.001
    }
    texture.needsUpdate = true
  })

  return (
    <group scale={10} rotation={[0, 1.812, 0]} position={[0, -0.5, 0]} ref={group} {...props} dispose={null}>
      <group rotation={[0, -0.412, 0]}>
        <mesh castShadow receiveShadow geometry={nodes.Exterior.geometry} material={materials['white-material']} />
        <mesh castShadow receiveShadow geometry={nodes.Cylinder003_1.geometry} material={materials['color-material']} />
      </group>

      <mesh castShadow receiveShadow geometry={nodes.Exterior.geometry} material={materials['white-material']} rotation={[0, -0.412, 0]} />

      {/* Impression */}
      <mesh
        rotation={[0, -0.412, 0]}
        castShadow
        receiveShadow
        geometry={nodes.Impression.geometry}
      >
        <meshStandardMaterial attach="material" map={texture} />
      </mesh>

      <mesh castShadow receiveShadow geometry={nodes.Interior.geometry} material={materials['color-material']} rotation={[0, -0.412, 0]} />
    </group>
  )
}

useGLTF.preload('/models3d/MugModel.gltf')

export default MugModel
