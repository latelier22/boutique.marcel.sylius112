import React, { useRef, useEffect, useState } from 'react'
import { useGLTF } from '@react-three/drei'
import { useFrame, useThree } from '@react-three/fiber'
import * as THREE from 'three'

const COLOR_MAP = {
  rouge: '#ff0000',
  noir: '#000000',
  blanc: '#ffffff',
  bleu: '#0000ff',
  vert: '#00ff00',
  jaune: '#ffff00',
  orange: '#E65C2F'
 
}

function MugModel({ color = 'blanc', textureUrl, ...props }) {
  const group = useRef()
  const { nodes, materials } = useGLTF("/models3d/MugModel.gltf")
  const { gl } = useThree()
  const [texture, setTexture] = useState(null)
  const [localColorMaterial, setLocalColorMaterial] = useState(null)

  const hexColor = COLOR_MAP[color] || '#ffffff'

  // 🎨 Cloner et colorer le matériau une seule fois
  useEffect(() => {
    if (materials['color-material']) {
      const clone = materials['color-material'].clone()
      clone.color = new THREE.Color(hexColor)
      setLocalColorMaterial(clone)
    }
  }, [color, materials])

  // 🌄 Charger la texture depuis l'URL
  useEffect(() => {
    if (textureUrl) {
      const loader = new THREE.TextureLoader()
      loader.load(textureUrl, (loadedTexture) => {
        loadedTexture.anisotropy = gl.capabilities.getMaxAnisotropy()
        loadedTexture.flipY = false
        loadedTexture.needsUpdate = true
        setTexture(loadedTexture)
      })
    }
  }, [textureUrl, gl])

  // 🔁 Rotation douce automatique
  useFrame(() => {
    if (group.current) {
      group.current.rotation.y += 0.005
    }
  })

  return (
    <group ref={group} scale={60} rotation={[0, 1.812, 0]} position={[0, -3, 0]} {...props} dispose={null}>
      <group rotation={[0, -0.412, 0]}>
        <mesh castShadow receiveShadow geometry={nodes.Exterior.geometry} material={materials['white-material']} />
        <mesh castShadow receiveShadow geometry={nodes.Cylinder003_1.geometry} material={localColorMaterial} />
      </group>
      <mesh castShadow receiveShadow geometry={nodes.Exterior.geometry} material={materials['white-material']} rotation={[0, -0.412, 0]} />
      <mesh rotation={[0, -0.412, 0]} castShadow receiveShadow geometry={nodes.Impression.geometry}>
        {texture && <meshStandardMaterial map={texture} />}
      </mesh>
      <mesh castShadow receiveShadow geometry={nodes.Interior.geometry} material={localColorMaterial} rotation={[0, -0.412, 0]} />
    </group>
  )
}

useGLTF.preload('/models3d/MugModel.gltf')

export default MugModel
