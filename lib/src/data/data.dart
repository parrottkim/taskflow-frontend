import 'dart:convert';
import 'dart:typed_data';

import 'package:cross_file/cross_file.dart';
import 'package:dio/dio.dart';
import 'package:idb_shim/idb_browser.dart';
import 'package:taskflow/src/shared/tool/converter.dart';
import 'package:retrofit/retrofit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskflow/src/core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'data.g.dart';
part 'data.freezed.dart';

part 'model/bookmark.dart';
part 'model/address.dart';
part 'model/currency.dart';
part 'model/dashboard.dart';
part 'model/document.dart';
part 'model/draft.dart';
part 'model/holiday.dart';
part 'model/issue.dart';
part 'model/project.dart';
part 'model/request/auth_request.dart';
part 'model/request/user_request.dart';
part 'model/request/project_request.dart';
part 'model/request/issue_request.dart';
part 'model/request/supplier_request.dart';
part 'model/request/schedule_request.dart';
part 'model/request/report_request.dart';
part 'model/request/document_request.dart';
part 'model/response.dart';
part 'model/schedule.dart';
part 'model/supplier.dart';
part 'model/token.dart';
part 'model/report.dart';
part 'model/user.dart';
part 'model/local.dart';
part 'model/project-client.dart';
part 'model/work.dart';

part 'repository/auth/auth_repository.dart';
part 'service/auth/auth_service.dart';
part 'source/auth/auth_source.dart';

part 'repository/address/address_repository.dart';
part 'service/address/address_service.dart';
part 'source/address/address_source.dart';

part 'repository/bookmark/bookmark_repository.dart';
part 'service/bookmark/bookmark_service.dart';
part 'source/bookmark/bookmark_source.dart';

part 'repository/currency/currency_repository.dart';
part 'service/currency/currency_service.dart';
part 'source/currency/currency_source.dart';

part 'repository/dashboard/dashboard_repository.dart';
part 'service/dashboard/dashboard_service.dart';
part 'source/dashboard/dashboard_source.dart';

part 'repository/document/document_folder_repository.dart';
part 'service/document/document_folder_service.dart';
part 'source/document/document_folder_source.dart';

part 'repository/draft/draft_repository.dart';
part 'service/draft/draft_service.dart';
part 'source/draft/draft_source.dart';

part 'repository/document/document_repository.dart';
part 'service/document/document_service.dart';
part 'source/document/document_source.dart';

part 'repository/holiday/holiday_repository.dart';
part 'service/holiday/holiday_service.dart';
part 'source/holiday/holiday_source.dart';

part 'repository/schedule/schedule_repository.dart';
part 'service/schedule/schedule_service.dart';
part 'source/schedule/schedule_source.dart';

part 'repository/issue/issue_repository.dart';
part 'service/issue/issue_service.dart';
part 'source/issue/issue_source.dart';

part 'repository/issue/issue_attachment_repository.dart';
part 'service/issue/issue_attachment_service.dart';
part 'source/issue/issue_attachment_source.dart';

part 'repository/issue/approval_issue_repository.dart';
part 'service/issue/approval_issue_service.dart';
part 'source/issue/approval_issue_source.dart';

part 'repository/issue/contract_issue_repository.dart';
part 'service/issue/contract_issue_service.dart';
part 'source/issue/contract_issue_source.dart';

part 'repository/issue/kickoff_issue_repository.dart';
part 'service/issue/kickoff_issue_service.dart';
part 'source/issue/kickoff_issue_source.dart';

part 'repository/issue/payment_issue_repository.dart';
part 'service/issue/payment_issue_service.dart';
part 'source/issue/payment_issue_source.dart';

part 'repository/issue/procurement_issue_repository.dart';
part 'service/issue/procurement_issue_service.dart';
part 'source/issue/procurement_issue_source.dart';

part 'repository/issue/transaction_issue_repository.dart';
part 'service/issue/transaction_issue_service.dart';
part 'source/issue/transaction_issue_source.dart';

part 'repository/local/local_repository.dart';
part 'source/local/local_source.dart';

part 'repository/project/project_client_repository.dart';
part 'service/project/project_client_service.dart';
part 'source/project/project_client_source.dart';

part 'repository/project/project_repository.dart';
part 'service/project/project_service.dart';
part 'source/project/project_source.dart';

part 'repository/sftp/sftp_repository.dart';
part 'service/sftp/sftp_service.dart';
part 'source/sftp/sftp_source.dart';

part 'repository/supplier/supplier_repository.dart';
part 'service/supplier/supplier_service.dart';
part 'source/supplier/supplier_source.dart';

part 'repository/report/report_repository.dart';
part 'service/report/report_service.dart';
part 'source/report/report_source.dart';

part 'repository/user/user_repository.dart';
part 'service/user/user_service.dart';
part 'source/user/user_source.dart';

part 'repository/work/work_repository.dart';
part 'service/work/work_service.dart';
part 'source/work/work_source.dart';
