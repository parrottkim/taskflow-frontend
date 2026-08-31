import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';

import 'package:web/web.dart' as web;

Future<bool> writeImageToClipboard(Uint8List bytes) async {
  final representations = JSObject();
  final blob = web.Blob(
    <JSUint8Array>[bytes.toJS].toJS,
    web.BlobPropertyBag(type: 'image/png'),
  );

  representations.setProperty('image/png'.toJS, blob);
  final clipboardItem = web.ClipboardItem(representations);

  await web.window.navigator.clipboard
      .write(<web.ClipboardItem>[clipboardItem].toJS)
      .toDart;
  return true;
}
