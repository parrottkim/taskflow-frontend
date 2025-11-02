async function extractContract(file) {
  return new Promise((resolve, reject) => {
    const reader = new FileReader();

    reader.onload = function(e) {
      const data = e.target.result;
      const workbook = XLSX.read(data, {
        type: 'binary'
      });
      const sheetName = workbook.SheetNames[0];
      const sheet = workbook.Sheets[sheetName];

      const b4CellAddress = 'B4';
      const b4Cell = sheet[b4CellAddress];
      const b4CellValue = b4Cell ? b4Cell.v : undefined;
      const requiredText = '현대차/기아 貴下';

      if (b4CellValue !== requiredText) {
        reject(new Error('format_invalid'));
        return;
      }

      if (typeof XLSX_CALC !== 'undefined') {
        XLSX_CALC(workbook);
      }

      const fullRange = sheet['!ref'];
      const decodedRange = XLSX.utils.decode_range(fullRange);

      // 시작 행을 18(인덱스는 17)로 설정
      decodedRange.s.r = 17;
      // 시작 열을 C(인덱스는 2)로 설정
      decodedRange.s.c = 2;
      // 끝 열을 H(인덱스는 7)로 설정
      decodedRange.e.c = 7;
      
      const dynamicRange = XLSX.utils.encode_range(decodedRange);

      let rows = XLSX.utils.sheet_to_json(sheet, {
        header: 1,
        range: dynamicRange, // 동적으로 생성된 범위 사용
        raw: false,
      });

      if (rows && rows.length > 9) {
        rows = rows.slice(0, -9);
      } else {
        reject(new Error('format_invalid'));
      }

      resolve(rows || []);
    };

    reader.onerror = function(e) {
      console.error('파일 읽기 중 오류가 발생했습니다:', e);
      reject(e);
    };

    reader.readAsArrayBuffer(file);
  });
}

async function extractProcurement(file) {
    return new Promise((resolve, reject) => {
    const reader = new FileReader();

    reader.onload = function(e) {
      const data = e.target.result;
      const workbook = XLSX.read(data, {
        type: 'binary'
      });
      const sheetName = workbook.SheetNames[0];
      const sheet = workbook.Sheets[sheetName];

      const a1Cell = sheet['A1'];
      const a1CellValue = a1Cell ? a1Cell.v : undefined;
      const a1RequiredText = '물품구매요청서';

      const a7Cell = sheet['A7'];
      const a7CellValue = a7Cell ? a7Cell.v : undefined;
      const a7RequiredText = '준수 및 참고 사항';

      if (a1CellValue !== a1RequiredText || a7CellValue !== a7RequiredText) {
        reject(new Error('format_invalid'));
        return;
      }

      if (typeof XLSX_CALC !== 'undefined') {
        XLSX_CALC(workbook);
      }

      const fullRange = sheet['!ref'];
      const decodedRange = XLSX.utils.decode_range(fullRange);

      // 시작 행을 12(인덱스는 11)로 설정
      decodedRange.s.r = 11;
      // 시작 열을 A(인덱스는 0)로 설정
      decodedRange.s.c = 0;
      // 끝 열을 H(인덱스는 7)로 설정
      decodedRange.e.c = 7;
      
      const dynamicRange = XLSX.utils.encode_range(decodedRange);

      let rows = XLSX.utils.sheet_to_json(sheet, {
        header: 1,
        range: dynamicRange, // 동적으로 생성된 범위 사용
        raw: false,
      });

      if (rows && rows.length > 2) {
        rows = rows.slice(0, -2);
      } else {
        reject(new Error('format_invalid'));
      }

      resolve(rows || []);
    };

    reader.onerror = function(e) {
      console.error('파일 읽기 중 오류가 발생했습니다:', e);
      reject(e);
    };

    reader.readAsArrayBuffer(file);
  });
}