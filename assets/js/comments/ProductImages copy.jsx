import React, { useEffect, useState } from 'react';

const ProductImages = ({ taxonCode }) => {
  const [images, setImages] = useState([]);
  const [loading, setLoading] = useState(true);

  // Fonction pour récupérer les images de l'API
  const fetchProductImages = async () => {
    console.log("Fetching images for taxon:", taxonCode); // Vérification si la fonction est appelée
    try {
      const response = await fetch(`https://sylius.latelier22.fr/api/v2/product/images/${taxonCode}`);
      if (!response.ok) {
        console.error('Response not OK:', response); // Log de la réponse si elle n'est pas correcte
        throw new Error('Erreur lors de la récupération des images');
      }
      const data = await response.json();
      console.log("Fetched data:", data); // Vérification des données récupérées
      setImages(data);
    } catch (error) {
      console.error("Error fetching images:", error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    console.log("Effect triggered for taxonCode:", taxonCode); // Log à chaque changement de taxonCode
    fetchProductImages();
  }, [taxonCode]);

  // Rendre le composant avec les images ou un message de chargement
  return (
    <div style={{ marginTop: '20px' }}>
      {loading ? (
        <p>Chargement des images...</p>
      ) : (
        <div style={{ display: 'flex', flexWrap: 'wrap', gap: '10px' }}>
          {images.length === 0 ? (
            <p>Aucune image disponible pour cette catégorie.</p>
          ) : (
            images.map((image, index) => (
              <div key={index} style={{ width: '100px', height: '100px', border: '1px solid #ccc', padding: '10px' }}>
                <img src={`https://sylius.latelier22.fr/media/image/${image.product_image}`} alt={`Product ${index}`} style={{ width: '100%', height: 'auto' }} />
              </div>
            ))
          )}
        </div>
      )}
    </div>
  );
};

export default ProductImages;
