import 'dart:js_interop';

@JS()
external JSPromise<JSArray<JSArray>> extractContract(JSAny? file);

@JS()
external JSPromise<JSArray<JSArray>> extractProcurement(JSAny? file);

@JS()
external JSPromise<JSString> renderPdf(JSAny? blob, String elementId);

@JS()
external void printPdfCanvas(String elementId);
