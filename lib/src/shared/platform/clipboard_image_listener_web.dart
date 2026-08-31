import 'dart:async';
import 'dart:js_interop';
import 'dart:typed_data';

import 'package:web/web.dart' as web;

typedef ClipboardImageCallback = Future<void> Function(Uint8List bytes);
typedef ClipboardImageErrorCallback = void Function(Object error);
typedef ClipboardImageListenerCancel = void Function();

ClipboardImageListenerCancel listenForClipboardImages({
  required bool Function() shouldHandle,
  required ClipboardImageCallback onImage,
  required ClipboardImageErrorCallback onError,
}) {
  final body = web.document.body;
  if (body == null) return () {};

  final subscription = body.onPaste.listen((event) async {
    if (!shouldHandle()) return;

    final items = event.clipboardData?.items;
    if (items == null) return;

    for (var index = 0; index < items.length; index++) {
      final item = items[index];
      if (item.kind != 'file' || !item.type.startsWith('image/')) continue;

      final file = item.getAsFile();
      if (file == null) continue;

      event.preventDefault();

      try {
        final buffer = await file.arrayBuffer().toDart;
        await onImage(buffer.toDart.asUint8List());
      } catch (error) {
        onError(error);
      }
      return;
    }
  });

  return () {
    unawaited(subscription.cancel());
  };
}
