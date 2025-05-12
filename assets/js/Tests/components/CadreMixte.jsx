import React from 'react'
import BaguetteMixte from './BaguetteMixte'
const Cadre = ({
  position,
  rotation,
  frameColor,
  opacity,
  CadreExtWidth,
  CadreExtHeight,
  BaguetteWidth,
  BaguetteHeight,
  RabateHeight,
  RabateWidth,
  scale
}) => {
  return (
    <group rotation={rotation} position={position} scale={scale}>
          <group>
            <BaguetteMixte
              castShadow
              receiveShadow
              position={[0, position[1], -CadreExtHeight / 2 + 1.5]}
              frameColor={frameColor}
              opacity={opacity}
              RabateHeight={RabateHeight}
              RabateWidth={RabateWidth}
              BaguetteWidth={BaguetteWidth}
              BaguetteHeight={BaguetteHeight}
              LongueurBaguette={CadreExtWidth}
            />
            <BaguetteMixte
             castShadow
             receiveShadow
              position={[CadreExtWidth / 2 - 1.5, position[1], 0]}
              rotation={[0, (3 * Math.PI) / 2, 0]}
              frameColor={frameColor}
              opacity={opacity}
              RabateHeight={RabateHeight}
              RabateWidth={RabateWidth}
              BaguetteWidth={BaguetteWidth}
              BaguetteHeight={BaguetteHeight}
              LongueurBaguette={CadreExtHeight}
            />
          </group>
          <group rotation={[0, Math.PI, 0]}>
            <BaguetteMixte
             castShadow
             receiveShadow
              position={[0, position[1], -CadreExtHeight / 2 + 1.5]}
              frameColor={frameColor}
              opacity={opacity}
              RabateHeight={RabateHeight}
              RabateWidth={RabateWidth}
              BaguetteWidth={BaguetteWidth}
              BaguetteHeight={BaguetteHeight}
              LongueurBaguette={CadreExtWidth}
            />
            <BaguetteMixte
             castShadow
             receiveShadow
              position={[CadreExtWidth / 2 - 1.5, position[1], 0]}
              rotation={[0, (3 * Math.PI) / 2, 0]}
              frameColor={frameColor}
              opacity={opacity}
              RabateHeight={RabateHeight}
              RabateWidth={RabateWidth}
              BaguetteWidth={BaguetteWidth}
              BaguetteHeight={BaguetteHeight}
              LongueurBaguette={CadreExtHeight}
            />
          </group>
          </group>
  )
}

export default Cadre
