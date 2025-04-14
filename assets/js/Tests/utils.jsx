const handleScreenshot = ({canvasContainerRef}) => {
    const canvas = canvasContainerRef.current?.querySelector('canvas');
    if (!canvas) return;
  
    const dataUrl = canvas.toDataURL('image/png');
  
    const wrapper = document.createElement('div');
    wrapper.style.position = 'relative';
    wrapper.style.display = 'inline-block';
  
    // Image preview
    const img = new Image();
    img.src = dataUrl;
    img.style.maxWidth = '160px';
    img.style.border = '2px solid #ccc';
    img.style.margin = '0.5rem';
    img.style.display = 'block';
  
    // ❌ Bouton supprimer
    const closeBtn = document.createElement('span');
    closeBtn.innerText = '❌';
    closeBtn.style.position = 'absolute';
    closeBtn.style.top = '4px';
    closeBtn.style.right = '4px';
    closeBtn.style.cursor = 'pointer';
    closeBtn.style.background = 'white';
    closeBtn.style.borderRadius = '50%';
    closeBtn.style.fontSize = '0.8rem';
    closeBtn.style.padding = '2px 4px';
    closeBtn.style.border = '1px solid #ccc';
    closeBtn.addEventListener('click', () => {
      wrapper.remove();
    });
  
    // 💾 Bouton téléchargement
    const downloadBtn = document.createElement('a');
    downloadBtn.href = dataUrl;
    downloadBtn.download = 'capture.png';
    downloadBtn.innerText = '💾';
    downloadBtn.style.position = 'absolute';
    downloadBtn.style.bottom = '4px';
    downloadBtn.style.right = '4px';
    downloadBtn.style.cursor = 'pointer';
    downloadBtn.style.background = 'white';
    downloadBtn.style.borderRadius = '50%';
    downloadBtn.style.fontSize = '0.8rem';
    downloadBtn.style.padding = '2px 4px';
    downloadBtn.style.border = '1px solid #ccc';
    downloadBtn.title = 'Télécharger';

    img.addEventListener('click', () => {
      const overlay = document.createElement('div');
      overlay.style.position = 'fixed';
      overlay.style.top = 0;
      overlay.style.left = 0;
      overlay.style.width = '100vw';
      overlay.style.height = '100vh';
      overlay.style.background = 'rgba(0, 0, 0, 0.68)';
      overlay.style.display = 'flex';
      overlay.style.justifyContent = 'center';
      overlay.style.alignItems = 'center';
      overlay.style.zIndex = 10000;
      overlay.style.cursor = 'zoom-out';
    
      const zoomed = new Image();
      zoomed.src = dataUrl;
      zoomed.style.maxWidth = '90vw';
      zoomed.style.maxHeight = '90vh';
      zoomed.style.border = '4px solid white';
      zoomed.style.boxShadow = '0 0 20px black';
      zoomed.style.background = 'rgb(0, 0, 0)';
    
      overlay.appendChild(zoomed);
      document.body.appendChild(overlay);
    
      overlay.addEventListener('click', () => {
        overlay.remove(); // ferme au clic
      });
    });
    
  
    wrapper.appendChild(img);
    wrapper.appendChild(closeBtn);
    wrapper.appendChild(downloadBtn);
  
    const gallery = document.getElementById('screenshot-gallery');
    if (gallery) {
      gallery.appendChild(wrapper);
    }
  };

  export {handleScreenshot};

