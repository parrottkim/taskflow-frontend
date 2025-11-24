import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'provider.g.dart';

part 'provider/url_provider.dart';
part 'provider/flutter_secure_storage_provider.dart';
part 'provider/http_provider.dart';
part 'provider/shared_preferences_async_provider.dart';
part 'provider/toast_provider.dart';
