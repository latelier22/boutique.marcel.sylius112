// assets/react/controllers/CadreApp.jsx

import React from 'react';
import { createRoot } from 'react-dom/client';
import CadreCanvas from './components/CanvasComponent';
import CadreControls from './components/ControlsComponent';

// Monter Canvas
const canvasEl = document.querySelector('cadre-canvas-component');
if (canvasEl) {
  createRoot(canvasEl).render(<CadreCanvas />);
}

// Monter Contrôles
const controlsEl = document.querySelector('cadre-controls-component');
if (controlsEl) {
  createRoot(controlsEl).render(<CadreControls />);
}
