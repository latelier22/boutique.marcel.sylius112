import React from 'react';
import { useCadreStore } from './store/useCadreStore';
import { cansonColors } from './PaletteColors';

export default function ControlsComponent() {
  const {
    frameColor, PPColor, backgroundColor,
    setFrameColor, setPPColor, setBackgroundColor,
    hauteurBaguette, largeurBaguette, hauteurFeuillure, largeurFeuillure, bandePP,
    rotationCadreActive, murIsVisible,
    spotIntensity, spotPosition, spotAngle, spotPenumbra,
    updateBaguette, updateSpotlight
  } = useCadreStore();

  const [selectedTarget, setSelectedTarget] = React.useState('Cadre');

  const handleColorClick = (color) => {
    if (selectedTarget === 'Cadre') setFrameColor(color.hex);
    else if (selectedTarget === 'PP') setPPColor(color.hex);
    else if (selectedTarget === 'Mur') setBackgroundColor(color.hex);
  };

  const handleBaguetteChange = (key, value) => {
    updateBaguette({ [key]: parseFloat(value) });
  };

  const handleSpotlightChange = (key, value) => {
    if (key === 'spotPositionX') updateSpotlight({ spotPosition: [parseFloat(value), spotPosition[1], spotPosition[2]] });
    if (key === 'spotPositionY') updateSpotlight({ spotPosition: [spotPosition[0], parseFloat(value), spotPosition[2]] });
    if (key === 'spotPositionZ') updateSpotlight({ spotPosition: [spotPosition[0], spotPosition[1], parseFloat(value)] });
    else updateSpotlight({ [key]: parseFloat(value) });
  };

  const handleCheckboxChange = (key) => {
    updateBaguette({ [key]: !useCadreStore.getState()[key] });
  };

  const getContrastColor = (hex) => {
    const r = parseInt(hex.slice(1, 3), 16);
    const g = parseInt(hex.slice(3, 5), 16);
    const b = parseInt(hex.slice(5, 7), 16);
    return (r * 299 + g * 587 + b * 114) / 1000 > 128 ? 'black' : 'white';
  };

  return (
    <div className="controls-column" style={{ padding: '1rem' }}>
      {/* Choix des couleurs */}
      <div style={{ display: 'flex', marginBottom: '1rem' }}>
        <button onClick={() => setSelectedTarget('Cadre')} style={{ flex: 1, background: frameColor, color: getContrastColor(frameColor), padding: '10px' }}>Cadre</button>
        <button onClick={() => setSelectedTarget('PP')} style={{ flex: 1, background: PPColor, color: getContrastColor(PPColor), padding: '10px' }}>Passe-partout</button>
        <button onClick={() => setSelectedTarget('Mur')} style={{ flex: 1, background: backgroundColor, color: getContrastColor(backgroundColor), padding: '10px' }}>Mur</button>
      </div>

      {/* Couleurs */}
      <div className="palette-scroll" style={{ maxHeight: '300px', overflowY: 'auto', marginBottom: '2rem' }}>
        {cansonColors.map((color, index) => (
          <div
            key={index}
            onClick={() => handleColorClick(color)}
            style={{
              background: color.hex,
              color: getContrastColor(color.hex),
              padding: '10px',
              cursor: 'pointer',
              borderBottom: '1px solid #ccc'
            }}
          >
            {color.name}
          </div>
        ))}
      </div>

      {/* Réglages Baguette */}
      <h3>Baguette</h3>
      <label>Hauteur Baguette: {hauteurBaguette.toFixed(1)}</label>
      <input type="range" min="1" max="10" step="0.5" value={hauteurBaguette} onChange={(e) => handleBaguetteChange('hauteurBaguette', e.target.value)} />
      
      <label>Largeur Baguette: {largeurBaguette.toFixed(1)}</label>
      <input type="range" min="1" max="15" step="0.5" value={largeurBaguette} onChange={(e) => handleBaguetteChange('largeurBaguette', e.target.value)} />
      
      <label>Hauteur Feuillure: {hauteurFeuillure.toFixed(1)}</label>
      <input type="range" min="0.5" max="10" step="0.5" value={hauteurFeuillure} onChange={(e) => handleBaguetteChange('hauteurFeuillure', e.target.value)} />
      
      <label>Largeur Feuillure: {largeurFeuillure.toFixed(1)}</label>
      <input type="range" min="0.5" max="9" step="0.5" value={largeurFeuillure} onChange={(e) => handleBaguetteChange('largeurFeuillure', e.target.value)} />

      <label>Largeur Passe-partout: {bandePP.toFixed(1)}</label>
      <input type="range" min="0" max="15" step="0.5" value={bandePP} onChange={(e) => handleBaguetteChange('bandePP', e.target.value)} />

      {/* Checkboxes */}
      <div style={{ marginTop: '1rem' }}>
        <label>
          <input type="checkbox" checked={rotationCadreActive} onChange={() => handleCheckboxChange('rotationCadreActive')} />
          Rotation du cadre
        </label>
      </div>
      <div>
        <label>
          <input type="checkbox" checked={murIsVisible} onChange={() => handleCheckboxChange('murIsVisible')} />
          Mur visible
        </label>
      </div>

      {/* Spotlight */}
      <h3>Spotlight</h3>
      <label>Intensité: {spotIntensity.toFixed(1)}</label>
      <input type="range" min="0" max="10" step="0.5" value={spotIntensity} onChange={(e) => handleSpotlightChange('spotIntensity', e.target.value)} />

      <label>Spot X: {spotPosition[0].toFixed(1)}</label>
      <input type="range" min="-20" max="20" step="0.5" value={spotPosition[0]} onChange={(e) => handleSpotlightChange('spotPositionX', e.target.value)} />

      <label>Spot Y: {spotPosition[1].toFixed(1)}</label>
      <input type="range" min="0" max="20" step="0.5" value={spotPosition[1]} onChange={(e) => handleSpotlightChange('spotPositionY', e.target.value)} />

      <label>Spot Z: {spotPosition[2].toFixed(1)}</label>
      <input type="range" min="-10" max="20" step="0.5" value={spotPosition[2]} onChange={(e) => handleSpotlightChange('spotPositionZ', e.target.value)} />

      <label>Angle: {spotAngle.toFixed(2)}</label>
      <input type="range" min="0.1" max="1" step="0.05" value={spotAngle} onChange={(e) => handleSpotlightChange('spotAngle', e.target.value)} />

      <label>Pénombre: {spotPenumbra.toFixed(2)}</label>
      <input type="range" min="0" max="3" step="0.5" value={spotPenumbra} onChange={(e) => handleSpotlightChange('spotPenumbra', e.target.value)} />
    </div>
  );
}
