import React, { useState } from 'react';

const UploadImageForm = () => {
  const [image, setImage] = useState(null);
  const [isUploading, setIsUploading] = useState(false);
  const [imageUrl, setImageUrl] = useState('');

  const handleFileChange = (e) => {
    setImage(e.target.files[0]);
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    if (!image) {
      alert("Veuillez sélectionner une image.");
      return;
    }

    const formData = new FormData();
    formData.append("image", image);

    setIsUploading(true);

    try {
      const response = await fetch('/api/v2/upload-image', {
        method: 'POST',
        body: formData,
      });

      const result = await response.json();

      if (response.ok) {
        setImageUrl(result.url);  // Vous pouvez stocker ou utiliser cette URL pour afficher l'image téléchargée
        alert('Image téléchargée avec succès!');
      } else {
        alert('Erreur de téléchargement');
      }
    } catch (error) {
      alert('Erreur du serveur');
    } finally {
      setIsUploading(false);
    }
  };

  return (
    <div>
      <form onSubmit={handleSubmit}>
        <input type="file" onChange={handleFileChange} />
        <button type="submit" disabled={isUploading}>
          {isUploading ? 'Téléchargement...' : 'Télécharger l\'image'}
        </button>
      </form>

      {imageUrl && <img src={imageUrl} alt="Image téléchargée" />}
    </div>
  );
};

export default UploadImageForm;
