import React from 'react';
import { FaDownload } from 'react-icons/fa'; // Icône de téléchargement

const ProductImageDownload = ({ image }) => {
  // Fonction pour télécharger l'image
  const handleDownload = () => {
    const fileUrl = image.url; // URL de l'image
    const fileId = image.id; // ID de l'image
    const fileExtension = fileUrl.split('.').pop(); // Récupérer l'extension de l'image (ex: jpg, webp)

    // Créer un lien de téléchargement
    const a = document.createElement('a');
    a.href = fileUrl;
    a.download = `${fileId}.${fileExtension}`; // Nom du fichier : id.extension
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a); // Supprimer le lien après téléchargement
  };

  return (
    <div>
      {/* Bouton avec l'icône de téléchargement */}
      <button
        onClick={handleDownload}
        style={{
          display: 'flex',
          alignItems: 'center',
          padding: '10px',
          backgroundColor: '#4CAF50',
          color: 'white',
          border: 'none',
          borderRadius: '5px',
          cursor: 'pointer',
        }}
      >
        <FaDownload style={{ marginRight: '8px' }} /> Téléchargez l'image
      </button>
    </div>
  );
};

export default ProductImageDownload;
