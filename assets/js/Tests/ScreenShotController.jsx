import { useThree } from '@react-three/fiber';
import { useEffect } from 'react';

export default function  ScreenShotController ({ onReady })  {
  const { gl, scene, camera } = useThree();

  useEffect(() => {
    if (onReady) {
      onReady({ gl, scene, camera });
    }
  }, [gl, scene, camera]);

  return null;
};
