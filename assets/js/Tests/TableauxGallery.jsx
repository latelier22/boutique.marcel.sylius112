// assets/js/components/TableauxGallery.jsx
import React, { useState } from 'react';

const TableauxGallery = ({ title ,tableaux, taxons = taxonsTableaux }) => {
  const [selectedTaxon, setSelectedTaxon] = useState(null);

  const filteredTableaux = selectedTaxon
    ? tableaux.filter(t => t.taxons.includes(selectedTaxon))
    : tableaux;


  return (
    <div className="ui segment">
      <h3 className="ui header">🖼️ {title} </h3>

      <div className="ui buttons" style={{ marginBottom: '1em', flexWrap: 'wrap' }}>
        <button
          className={`ui button ${selectedTaxon === null ? 'blue' : ''}`}
          onClick={() => setSelectedTaxon(null)}
        >
          Tous
        </button>
        {taxons.map(taxon => (
          <button
            key={taxon.id}
            className={`ui button ${selectedTaxon === taxon.id ? 'blue' : ''}`}
            onClick={() => setSelectedTaxon(taxon.id)}
          >
            {taxon.name}
          </button>
        ))}
      </div>

      <div className="ui small images">
        {filteredTableaux.map(t => (
          <a
            key={t.id}
            href={`/produit-personnalise/${t.slug}/${t.variantCode}`}
            className="tableau-thumbnail"
            data-full={`/media/image/TAB/${t.image}`}
          >
            <img
              src={`/media/image/TAB/${t.image}`}
              alt={t.name}
              className="ui image"
              style={{ margin: '0.5em' }}
            />
          </a>
        ))}
      </div>
    </div>
  );
};

export default TableauxGallery;
