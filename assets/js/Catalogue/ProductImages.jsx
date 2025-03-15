import React, { useState, useEffect } from 'react';
import ProductImageDownload from './ProductImageDownload';

const ProductImages = ({ images }) => {
  const [filteredImages, setFilteredImages] = useState([]);

  useEffect(() => {
    // Filtrer les images publiées et ajuster l'URL en fonction des règles
    const filtered = images.filter(image => image.published).map(image => {
      let imageUrl = '';

      // Si l'URL contient '/uploads', on la transforme en URL complète
      if (image.url.includes('/uploads')) {
        imageUrl = `https://admin.marcel-de-mayotte.fr${image.url}`;
      }
      // Si l'URL contient '/catalogue', on la transforme en URL complète
      else if (image.url.includes('/catalogue')) {
        imageUrl = `https://marcel-de-mayotte.latelier22.fr/images/${image.url}`;
      }

      return {
        ...image,
        imageUrl,
        title: image.title || image.name // Utilise title ou name si title est null
      };
    });

    setFilteredImages(filtered);
  }, [images]);

  return (
    <div style={{ display: 'flex', flexWrap: 'wrap', gap: '10px' }}>
      {filteredImages.map((image, index) => (
        <div key={index} style={{ width: '200px', height: 'auto', border: '1px solid #ccc', padding: '10px' }}>
          <img
            src={image.imageUrl}
            alt={image.name}
            style={{ width: '100%', height: 'auto' }}
          />
          <h4>{image.title}</h4> {/* Affiche le titre, ou le nom si le titre est null */}
          {/* Bouton pour télécharger l'image */}
          <ProductImageDownload image={image} />
        </div>
      ))}
    </div>
  );
};

export default ProductImages;
