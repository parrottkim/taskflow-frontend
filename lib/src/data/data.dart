import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:super_clipboard/super_clipboard.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/converter.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskflow/src/core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'data.g.dart';
part 'data.freezed.dart';

part 'model/bookmark.dart';
part 'model/address.dart';
part 'model/currency.dart';
part 'model/issue.dart';
part 'model/project.dart';
part 'model/request.dart';
part 'model/response.dart';
part 'model/schedule.dart';
part 'model/supplier.dart';
part 'model/token.dart';
part 'model/report.dart';
part 'model/user.dart';
part 'model/widget.dart';

part 'repository/auth_repository.dart';
part 'service/auth_service.dart';
part 'source/auth_source.dart';

part 'repository/address_repository.dart';
part 'service/address_service.dart';
part 'source/address_source.dart';

part 'repository/bookmark_repository.dart';
part 'service/bookmark_service.dart';
part 'source/bookmark_source.dart';

part 'repository/currency_repository.dart';
part 'service/currency_service.dart';
part 'source/currency_source.dart';

part 'repository/dashboard_repository.dart';
part 'service/dashboard_service.dart';
part 'source/dashboard_source.dart';

part 'repository/schedule_repository.dart';
part 'service/schedule_service.dart';
part 'source/schedule_source.dart';

part 'repository/issue_repository.dart';
part 'service/issue_service.dart';
part 'source/issue_source.dart';

part 'repository/local_repository.dart';
part 'source/local_source.dart';

part 'repository/project_client_repository.dart';
part 'service/project_client_service.dart';
part 'source/project_client_source.dart';

part 'repository/project_repository.dart';
part 'service/project_service.dart';
part 'source/project_source.dart';

part 'repository/sftp_repository.dart';
part 'service/sftp_service.dart';
part 'source/sftp_source.dart';

part 'repository/supplier_repository.dart';
part 'service/supplier_service.dart';
part 'source/supplier_source.dart';

part 'repository/report_repository.dart';
part 'service/report_service.dart';
part 'source/report_source.dart';

part 'repository/user_repository.dart';
part 'service/user_service.dart';
part 'source/user_source.dart';
