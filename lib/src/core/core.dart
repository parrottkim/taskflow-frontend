import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:idb_shim/idb_browser.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:dio/dio.dart';
import 'package:dio/browser.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'core.g.dart';

part 'provider/url_provider.dart';
part 'provider/indexed_database_provider.dart';
part 'provider/http_provider.dart';
part 'provider/shared_preferences_async_provider.dart';
part 'provider/toast_provider.dart';
