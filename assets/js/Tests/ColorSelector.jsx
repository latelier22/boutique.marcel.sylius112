import React, { useState } from 'react';

// const predefinedColors = {
//   'noir': '#000000',
//   'blanc': '#FFFFFF',
//   'bordeaux': '#800020',
//   'rouge': '#FF0000',
//   'orange': '#FFA500',
//   'vert kaki': '#708238',
//   'bleu marine': '#003366',
//   'bleu ciel': '#87CEEB',
//   'brun foncé': '#654321',
//   'jaune': '#FFD700'
// };

const predefinedColors = {
  "Blanc": "#FFFFFF",
  "Bleu ciel": "#5CADFF",
  "Bleu violet": "#420481",
  "Jaune": "#FFD700",
  "Noir": "#000000",
  "Orange": "#E65C2F",
  "Rose": "#F57AC6",
  "Rouge": "#C80000",
  "Vert": "#b6ee5d",
};

const ColorSelector = ({ title = "Choix de la couleur", defaultColor = '#000000', onColorChange }) => {
  const [selectedColor, setSelectedColor] = useState(defaultColor);

  const handleSelect = (colorCode) => {
    setSelectedColor(colorCode);
    if (onColorChange) {
      onColorChange(colorCode);
    }
  };

  return (
    <div style={{ width :'100%', textAlign: 'left', marginBottom: '1rem', padding: '1rem', border: '1px solid #ccc', borderRadius: '8px', backgroundColor: '#777777' }}>
      <strong style={{ display: 'block', marginBottom: '0.5rem' }}>{title} :</strong>
      <div style={{ display: 'flex', flexWrap: 'wrap', gap: '10px' }}>
        {Object.entries(predefinedColors).map(([name, color]) => (
          <div
            key={name}
            title={name}
            onClick={() => handleSelect(color)}
            style={{
              width: '30px',
              height: '30px',
              borderRadius: '50%',
              backgroundColor: color,
              border: selectedColor === color ? '3px solid #000' : '2px solid #ccc',
              cursor: 'pointer',
              boxShadow: '0 0 3px rgba(0,0,0,0.3)'
            }}
          ></div>
        ))}
      </div>
    </div>
  );
};

export default ColorSelector;
