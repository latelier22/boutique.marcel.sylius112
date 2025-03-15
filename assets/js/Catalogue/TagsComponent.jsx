import React, { useEffect, useState } from 'react';
import ProductImages from "./ProductImages"

const TagsComponent = () => {
  const [tags, setTags] = useState([]);
  const [catalogueImages, setCatalogueImages] = useState([]);
  const [loadingTags, setLoadingTags] = useState(true);
  const [loadingImages, setLoadingImages] = useState(true);

  // Fonction pour récupérer les tags
  const fetchTags = async () => {
    try {
      const response = await fetch('https://proxy.latelier22.fr/https://www.marcel-de-mayotte.fr/api/getTags'); // Remplacez par l'URL de votre API
      const data = await response.json();
      
      // Trier les tags : mainTag d'abord, puis les autres triés par nom
      const mainTags = data.filter(tag => tag.mainTag).sort((a, b) => a.name.localeCompare(b.name));
      const otherTags = data.filter(tag => !tag.mainTag).sort((a, b) => a.name.localeCompare(b.name));

      setTags([...mainTags, ...otherTags]); // Afficher mainTags en premier, puis les autres
      setLoadingTags(false);
    } catch (error) {
      console.error('Erreur lors de la récupération des tags:', error);
    }
  };

  // Fonction pour récupérer les images du slug "catalogue-complet"
  const fetchCatalogueImages = async (TagId) => {
    try {
      const response = await fetch("https://proxy.latelier22.fr/https://www.marcel-de-mayotte.fr/api/getImagesByTag/79"); // Remplacez par l'URL de votre API
      const data = await response.json();
      console.log("data",data)
      setCatalogueImages(data["tagImages"]); // Assurez-vous que les données d'image sont au bon format
      setLoadingImages(false);
    } catch (error) {
      console.error('Erreur lors de la récupération des images:', error);
    }
  };

  // Utilisation de useEffect pour récupérer les tags et les images au montage du composant
  useEffect(() => {
    fetchTags();
    fetchCatalogueImages();
  }, []);

  return (
    <div style={{ display: 'flex' }}>
  {/* Zone des tags (25% de la largeur) */}
  <div style={{ width: '25%', padding: '10px' }}>
    <h1>Tags</h1>
    {loadingTags ? (
      <p>Chargement des tags...</p>
    ) : (
      <div>
        <h2>Tags principaux</h2>
        {tags.filter(tag => tag.mainTag).map((tag, index) => (
          <div key={index}>
            <h3>{tag.name}</h3>
          </div>
        ))}

        <h2>Autres tags</h2>
        {tags.filter(tag => !tag.mainTag).map((tag, index) => (
          <div key={index}>
            <h3>{tag.name}</h3>
          </div>
        ))}
      </div>
    )}
  </div>

  {/* Zone des images (75% de la largeur) */}
  <div style={{ width: '75%', padding: '10px' }}>
    <h1>Images du catalogue complet</h1>
    {loadingImages ? (
      <p>Chargement des images...</p>
    ) : (
      <ProductImages images={catalogueImages} />
    )}
  </div>
</div>

  );
};

export default TagsComponent;
