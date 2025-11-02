// Loaded via <script> tag, create shortcut to access PDF.js exports.
var { pdfjsLib } = globalThis;

const cMapUrl = './assets/scripts/pdf/web/cmaps/';
const cMapPacked = true; // cmaps 파일을 단일 파일로 패킹할지 여부

async function extractTextFromPdf(fileBytes) {
  const uint8Array = new Uint8Array(fileBytes);
  const pdf = await pdfjsLib.getDocument({
    data: uint8Array,
    cMapUrl: cMapUrl,
    cMapPacked: cMapPacked
  }).promise;

  let fullText = '';
  
  for (let i = 1; i <= pdf.numPages; i++) {
    const page = await pdf.getPage(i);
    const textContent = await page.getTextContent();
    const pageText = textContent.items.map(item => item.str).join('\n');
    fullText += pageText + ' ';
  }
  return fullText;
};