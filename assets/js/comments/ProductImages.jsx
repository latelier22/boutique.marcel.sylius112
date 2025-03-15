import React, { useEffect, useState } from 'react';

const ProductImages = ({ taxonCode, onImageClick }) => {
  const [images, setImages] = useState([]);
  const [loading, setLoading] = useState(true);

  const fetchProductImages = async () => {
    try {
      const response = await fetch(`/api/v2/product/images/${taxonCode}`);
      if (!response.ok) {
        throw new Error('Erreur lors de la récupération des images');
      }
      const data = await response.json();
      setImages(data);
    } catch (error) {
      console.error(error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchProductImages();
  }, [taxonCode]);

  // Ajouter une image manuelle à la liste des images
  const manualImages = [
    {
      product_image: 'https://proxy.latelier22.fr/https://admin.marcel-de-mayotte.fr/uploads/medium_DSC_03214_26f0ead847.JPG',
      isExternal: true  // Marquer cette image comme étant externe
    }
  ];

  // Combinez les images obtenues via l'API et les images manuelles
  const allImages = [...images, ...manualImages];

  return (
    <div style={{ marginTop: '20px' }}>
      {loading ? (
        <p>Chargement des images...</p>
      ) : (
        <div style={{ display: 'flex', flexWrap: 'wrap', gap: '10px' }}>
          {allImages.map((image, index) => (
            <div
              key={index}
              style={{
                width: '100px',
                height: '100px',
                border: '1px solid #ccc',
                padding: '10px',
                cursor: 'pointer',
              }}
              onClick={() => onImageClick(image)} // Appel de la fonction onClick
            >
              <img
                src={image.isExternal ? image.product_image : `https://sylius.latelier22.fr/media/image/${image.product_image}`} // Vérifie si l'image est externe
                alt={`Product ${index}`}
                style={{ width: '100%', height: 'auto' }}
                crossOrigin="anonymous"
              />
            </div>
          ))}
        </div>
      )}
    </div>
  );
};

export default ProductImages;
