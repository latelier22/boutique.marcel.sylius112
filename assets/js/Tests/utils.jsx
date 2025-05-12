import { v4 as uuidv4 } from 'uuid';



export function getSavedImageState(slug, code) {
  try {
    const key = `fabricImageState_${slug}_${code}`;
    const raw = localStorage.getItem(key);
    return raw ? JSON.parse(raw) : null;
  } catch (e) {
    console.warn("Erreur lors de la lecture du localStorage", e);
    return null;
  }
}

export function saveImageState(slug, code, image) {
  try {
    const key = `fabricImageState_${slug}_${code}`;
    const data = {
      left: image.left,
      top: image.top,
      scaleX: image.scaleX,
      scaleY: image.scaleY
    };
    localStorage.setItem(key, JSON.stringify(data));
  } catch (e) {
    console.warn("Erreur lors de la sauvegarde du localStorage", e);
  }
}



export function getProductSlugAndCode() {
  const parts = window.location.pathname.split('/').filter(Boolean);
  const code = parts[parts.length - 1];      // ex: TAB1864
  const slug = parts[parts.length - 2];      // ex: mug-noir
  // console.log("slug", slug);
  // console.log("code", code);
  if (!slug || !code) {
    console.warn("Impossible de récupérer le slug et le code du produit.");
    return null;
  }
  return { slug, code };
}

export async function handleScreenshot({ canvasContainerRef, fabricCanvasRef }) {
  const { slug, code } = getProductSlugAndCode();
  const id = uuidv4();
  const key = `fabricImageState_${slug}_${code}`;

  const canvas3D = canvasContainerRef.current?.querySelector('canvas');
  const canvas2D = fabricCanvasRef.current?.getElement();
  const gallery = document.getElementById('screenshot-gallery');

  if (!canvas3D || !canvas2D || !gallery) return;

  const uploadImage = async (canvas, type) => {
    return new Promise((resolve) => {
      canvas.toBlob(async (blob) => {
        const formData = new FormData();
        formData.append('image', blob, `${type}_${id}.png`);
        formData.append('id', id);
        formData.append('type', type.toUpperCase());
        formData.append('uploadDir', 'gallery/images/mug-captures');

        const response = await fetch('/api/v2/shop/media', {
          method: 'POST',
          body: formData,
        });

        const json = await response.json();
        resolve(json.url || json.previewUrl || '');
      }, 'image/png');
    });
  };

  const previewUrl = await uploadImage(canvas3D, 'preview');
  const textureUrl = await uploadImage(canvas2D, 'texture');

  // 📸 Ajoute à la galerie
  const wrapper = document.createElement('div');
  wrapper.className = 'screenshot-box';

  const img = new Image();
  img.src = previewUrl;
  img.className = 'screenshot-thumb';

  const closeBtn = document.createElement('span');
  closeBtn.innerText = '❌';
  closeBtn.className = 'screenshot-close';
  closeBtn.addEventListener('click', () => {
    wrapper.remove();
    // const previous = JSON.parse(localStorage.getItem(key) || '[]');

    // Corrigé :
let previous = [];
try {
  const raw = localStorage.getItem(key);
  previous = Array.isArray(JSON.parse(raw)) ? JSON.parse(raw) : [];
} catch (e) {
  console.warn("Erreur lecture localStorage", e);
}
const updated = previous.filter((entry) => entry.id !== id);
    localStorage.setItem(key, JSON.stringify(updated));
  });

  const downloadBtn = document.createElement('a');
  downloadBtn.href = previewUrl;
  downloadBtn.download = `${id}_preview.png`;
  downloadBtn.innerText = '💾';
  downloadBtn.className = 'screenshot-download';

  img.addEventListener('click', () => {
    const overlay = document.createElement('div');
    overlay.className = 'screenshot-overlay';

    const zoomed = new Image();
    zoomed.src = previewUrl;
    zoomed.className = 'screenshot-zoomed';

    overlay.appendChild(zoomed);
    document.body.appendChild(overlay);
    overlay.addEventListener('click', () => overlay.remove());
  });

  wrapper.appendChild(img);
  wrapper.appendChild(closeBtn);
  wrapper.appendChild(downloadBtn);
  gallery.appendChild(wrapper);

  // ✅ Alerte verte
  const alert = document.createElement('div');
  alert.className = 'ui green message';
  alert.innerText = '✅ Vos images ont été sauvegardées sur notre serveur.';
  alert.style.position = 'fixed';
  alert.style.top = '1rem';
  alert.style.right = '1rem';
  alert.style.zIndex = 9999;
  document.body.appendChild(alert);
  setTimeout(() => alert.remove(), 4000);

  // 💾 Stocker dans le localStorage
  let previous = [];
  try {
    const raw = localStorage.getItem(key);
    const parsed = JSON.parse(raw);
    previous = Array.isArray(parsed) ? parsed : [];
  } catch (e) {
    console.warn("Erreur de parsing localStorage (ajout capture):", e);
    previous = [];
  }
  
  localStorage.setItem(key, JSON.stringify([
    ...previous,
    { id, previewUrl, textureUrl, date: new Date().toISOString() }
  ]));
  
}
