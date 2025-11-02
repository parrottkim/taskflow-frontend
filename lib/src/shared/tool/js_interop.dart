import 'dart:js_interop';

@JS()
external JSPromise<JSArray<JSArray>> extractContract(JSAny? file);

@JS()
external JSPromise<JSArray<JSArray>> extractProcurement(JSAny? file);

@JS()
external JSPromise<JSString> generateExcelPreview(String json);
