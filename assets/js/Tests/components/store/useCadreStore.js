// components/store/useCadreStore.js
import { create } from 'zustand';

export const useCadreStore = create((set) => ({
  textureURL: null,
  imageSize: { largeur: 40, hauteur: 40 },
  imageReady: false,

  frameColor: '#ad5d16',
  PPColor: '#222222',
  backgroundColor: '#ebe1e0',

  hauteurBaguette: 2,
  largeurBaguette: 1,
  hauteurFeuillure: 0.5,
  largeurFeuillure: 1,
  rotationCadreActive: false,
  murIsVisible: true,
  bandePP: 7.5,

  spotIntensity: 10,
  spotPosition: [5, 5, 5],
  spotAngle: 0.3,
  spotPenumbra: 1.5,

  setTexture: (url, largeur, hauteur) => set({
    textureURL: url,
    imageSize: { largeur, hauteur },
    imageReady: true,
  }),

  setFrameColor: (color) => set({ frameColor: color }),
  setPPColor: (color) => set({ PPColor: color }),
  setBackgroundColor: (color) => set({ backgroundColor: color }),

  updateSpotlight: (params) => set(params),
  updateBaguette: (params) => set(params),
}));
