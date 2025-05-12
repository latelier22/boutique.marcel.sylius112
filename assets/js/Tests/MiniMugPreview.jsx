import React from 'react';
import { Canvas } from '@react-three/fiber';
import { OrbitControls , Environment} from '@react-three/drei';
import Model3D from '../models3d/MugColor';
import MugPerso from '../models3d/MugPerso2';

const MiniMugPreview = ({color,code,imageTextureUrl} ) => {

  console.log("imageTextureUrl", imageTextureUrl);
 
const parts = imageTextureUrl?.split('/');
const filename = parts?.pop(); // ex: TAB1927.JPG ou TAB0001.webp
const filenameMug = filename?.replace('TAB', 'MUG');

const resolvedTextureUrl = `/media/cache/resolve/sylius_shop_product_original/MUG/${filenameMug}`;

  return (
    <Canvas style={{ width: '100%', height: '100%' }} camera={{ position: [0, 5, 15], fov: 40 }}>
      <ambientLight intensity ={0.5} />
        <directionalLight position={[10, 10, 10]} intensity={1} castShadow />
                <Environment preset="warehouse" intensity={0.5} frames={2} />
      {/* <Model3D isRotating={true} color={color} /> */}
        <MugPerso
            color={color} 
            textureUrl={`${resolvedTextureUrl}`}
            code={code}
            />
      <OrbitControls enableZoom={true} enablePan={false} autoRotate />
    </Canvas> 
  );
};

export default MiniMugPreview;
