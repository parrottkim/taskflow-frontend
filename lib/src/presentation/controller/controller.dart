import 'dart:async';
import 'dart:convert';

import 'package:cross_file/cross_file.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http_parser/http_parser.dart';
import 'package:intl/intl.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as path;
import 'package:super_editor/super_editor.dart';
import 'package:super_editor_markdown/super_editor_markdown.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/widget/preset.dart';
import 'package:taskflow/src/presentation/widget/toast.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/shared/provider.dart';
import 'package:taskflow/src/shared/tool/jwt_decoder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:collection/collection.dart';
import 'package:url_launcher/url_launcher.dart';

part 'controller.g.dart';
part 'controller.freezed.dart';

part 'auth/auth_controller.dart';
part 'auth/auth_state.dart';

part 'dashboard/calendar_controller.dart';
part 'dashboard/calendar_state.dart';
part 'dashboard/date_selection_controller.dart';
part 'dashboard/date_selection_state.dart';
part 'dashboard/latest_update_controller.dart';
part 'dashboard/latest_update_state.dart';
part 'dashboard/project_stats_controller.dart';
part 'dashboard/project_stats_state.dart';
part 'dashboard/summary_controller.dart';
part 'dashboard/summary_state.dart';
part 'dashboard/world_map_controller.dart';
part 'dashboard/world_map_state.dart';

part 'error/error_controller.dart';
part 'error/error_state.dart';

part 'issue/issue_detail_controller.dart';
part 'issue/issue_detail_state.dart';
part 'issue/issue_filter_controller.dart';
part 'issue/issue_filter_state.dart';
part 'issue/issue_form_controller.dart';
part 'issue/issue_form_state.dart';
part 'issue/issue_list_controller.dart';
part 'issue/issue_list_state.dart';
part 'issue/issue_submit_controller.dart';
part 'issue/issue_submit_state.dart';

part 'local/local_controller.dart';
part 'local/local_state.dart';

part 'project/project_detail_controller.dart';
part 'project/project_detail_state.dart';
part 'project/project_detail_filter_controller.dart';
part 'project/project_detail_filter_state.dart';
part 'project/project_filter_controller.dart';
part 'project/project_filter_state.dart';
part 'project/project_form_controller.dart';
part 'project/project_form_state.dart';
part 'project/project_list_controller.dart';
part 'project/project_list_state.dart';
part 'project/project_submit_controller.dart';
part 'project/project_submit_state.dart';

part 'schedule/schedule_filter_controller.dart';
part 'schedule/schedule_filter_state.dart';
part 'schedule/schedule_form_controller.dart';
part 'schedule/schedule_form_state.dart';
part 'schedule/schedule_list_controller.dart';
part 'schedule/schedule_list_state.dart';
part 'schedule/schedule_submit_controller.dart';
part 'schedule/schedule_submit_state.dart';

part 'supplier/supplier_search_controller.dart';
part 'supplier/supplier_search_state.dart';

part 'trip/trip_filter_controller.dart';
part 'trip/trip_filter_state.dart';
part 'trip/trip_form_controller.dart';
part 'trip/trip_form_state.dart';
part 'trip/trip_list_controller.dart';
part 'trip/trip_list_state.dart';
part 'trip/trip_step_controller.dart';
part 'trip/trip_step_state.dart';
part 'trip/trip_submit_controller.dart';
part 'trip/trip_submit_state.dart';

part 'user/user_filter_controller.dart';
part 'user/user_filter_state.dart';
part 'user/user_list_controller.dart';
part 'user/user_list_state.dart';
