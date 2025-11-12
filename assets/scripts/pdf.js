var { pdfjsLib } = globalThis;

async function renderPdf(blob, elementId) {
  console.log(`[PDF Renderer] Blob → Uint8Array 변환 중...`);

  // 1. Blob에서 ArrayBuffer를 얻고 Uint8Array로 변환
  const arrayBuffer = await blob.arrayBuffer();
  const pdfData = new Uint8Array(arrayBuffer);
  console.log(`[PDF Renderer] Uint8Array 생성 완료. 길이: ${pdfData.length}`);
  
  const canvas = document.getElementById(elementId);
  if (!canvas) {
    throw new Error(`Canvas element with id "${elementId}" not found`);
  }
  const context = canvas.getContext('2d');

  // 2. data 속성을 사용하여 Uint8Array를 직접 전달
  const pdf = await pdfjsLib.getDocument({
    // URL 대신 data 속성에 Uint8Array를 전달합니다.
    data: pdfData, 
    cMapUrl: 'https://unpkg.com/pdfjs-dist@5.4.394/cmaps/',
    cMapPacked: true,
  }).promise;

  // 3. 페이지 렌더링 (이하 동일)
  const page = await pdf.getPage(1);
  const viewport = page.getViewport({ scale: 1.5 });
  canvas.height = viewport.height;
  canvas.width = viewport.width;
  await page.render({ canvasContext: context, viewport }).promise;

  // URL을 생성하지 않았으므로 해제 로직이 필요 없습니다.
  console.log(`[PDF Renderer] 렌더링 완료.`);
}