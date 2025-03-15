import React from 'react';

export function ButtonOnOff({ toggleRotation, isRotating }) {
  return (
    <button
      onClick={toggleRotation}
      style={{
        position: 'absolute',
        top: '10px',
        left: '10px',
        padding: '10px 20px',
        backgroundColor: 'rgba(0, 0, 0, 0.5)',
        color: 'white',
        border: 'none',
        borderRadius: '5px',
        cursor: 'pointer',
        zIndex: 10
      }}
    >
      {isRotating ? 'Stop' : 'Start'}
    </button>
  );
}
