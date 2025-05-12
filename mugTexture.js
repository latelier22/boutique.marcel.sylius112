const sharp = require('sharp');
const fs = require('fs');
const path = require('path');

const inputDir = './public/media/image/TAB';
const outputDir = './public/media/image/MUG';

const finalWidth = 500;
const finalHeight = 205;

// Assure que le dossier MUG existe
if (!fs.existsSync(outputDir)) {
  fs.mkdirSync(outputDir, { recursive: true });
}

fs.readdirSync(inputDir).forEach(file => {
  const inputPath = path.join(inputDir, file);

  // Vérifie que c’est bien une image
  if (!/\.(jpe?g|png|webp)$/i.test(file)) return;

  const match = file.match(/TAB(\d+)\.(\w+)$/i);
  if (!match) return;

  const code = match[1];
  const ext = match[2];
  const outputFileName = `MUG${code}.${ext}`;

  const outputPath = path.join(outputDir, outputFileName);

  sharp(inputPath)
    .resize({
      width: finalWidth,
      height: finalHeight,
      fit: 'contain',
      background: { r: 255, g: 255, b: 255, alpha: 1 }
    })
    .toFile(outputPath)
    .then(() => {
      console.log(`✅ Généré : ${outputFileName}`);
    })
    .catch(err => {
      console.error(`❌ Erreur pour ${file} :`, err);
    });
});
