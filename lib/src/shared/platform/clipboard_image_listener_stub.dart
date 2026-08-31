import 'dart:typed_data';

typedef ClipboardImageCallback = Future<void> Function(Uint8List bytes);
typedef ClipboardImageErrorCallback = void Function(Object error);
typedef ClipboardImageListenerCancel = void Function();

ClipboardImageListenerCancel listenForClipboardImages({
  required bool Function() shouldHandle,
  required ClipboardImageCallback onImage,
  required ClipboardImageErrorCallback onError,
}) {
  return () {};
}
