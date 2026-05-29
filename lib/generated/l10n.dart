// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `닫기`
  String get common_close {
    return Intl.message('닫기', name: 'common_close', desc: '', args: []);
  }

  /// `확인`
  String get common_ok {
    return Intl.message('확인', name: 'common_ok', desc: '', args: []);
  }

  /// `적용`
  String get common_apply {
    return Intl.message('적용', name: 'common_apply', desc: '', args: []);
  }

  /// `취소`
  String get common_cancel {
    return Intl.message('취소', name: 'common_cancel', desc: '', args: []);
  }

  /// `나가기`
  String get common_leave {
    return Intl.message('나가기', name: 'common_leave', desc: '', args: []);
  }

  /// `머무르기`
  String get common_stay {
    return Intl.message('머무르기', name: 'common_stay', desc: '', args: []);
  }

  /// `등록하기`
  String get common_post {
    return Intl.message('등록하기', name: 'common_post', desc: '', args: []);
  }

  /// `수정하기`
  String get common_edit {
    return Intl.message('수정하기', name: 'common_edit', desc: '', args: []);
  }

  /// `삭제하기`
  String get common_delete {
    return Intl.message('삭제하기', name: 'common_delete', desc: '', args: []);
  }

  /// `공유`
  String get common_share {
    return Intl.message('공유', name: 'common_share', desc: '', args: []);
  }

  /// `북마크`
  String get common_bookmark {
    return Intl.message('북마크', name: 'common_bookmark', desc: '', args: []);
  }

  /// `포워딩`
  String get common_forward {
    return Intl.message('포워딩', name: 'common_forward', desc: '', args: []);
  }

  /// `열기`
  String get common_open {
    return Intl.message('열기', name: 'common_open', desc: '', args: []);
  }

  /// `다음`
  String get common_next {
    return Intl.message('다음', name: 'common_next', desc: '', args: []);
  }

  /// `생성`
  String get common_created_at {
    return Intl.message('생성', name: 'common_created_at', desc: '', args: []);
  }

  /// `수정`
  String get common_updated_at {
    return Intl.message('수정', name: 'common_updated_at', desc: '', args: []);
  }

  /// `클립보드에 내용을 복사했습니다.`
  String get common_copied {
    return Intl.message(
      '클립보드에 내용을 복사했습니다.',
      name: 'common_copied',
      desc: '',
      args: [],
    );
  }

  /// `클립보드에 링크를 복사했습니다.`
  String get common_link_copied {
    return Intl.message(
      '클립보드에 링크를 복사했습니다.',
      name: 'common_link_copied',
      desc: '',
      args: [],
    );
  }

  /// `다운로드가 진행 중입니다.`
  String get common_download_1 {
    return Intl.message(
      '다운로드가 진행 중입니다.',
      name: 'common_download_1',
      desc: '',
      args: [],
    );
  }

  /// `다운로드가 완료되면 창이 자동으로 닫힙니다.`
  String get common_download_2 {
    return Intl.message(
      '다운로드가 완료되면 창이 자동으로 닫힙니다.',
      name: 'common_download_2',
      desc: '',
      args: [],
    );
  }

  /// `다운로드가 시작되지 않으면 아래 버튼을 눌러주세요.`
  String get common_download_3 {
    return Intl.message(
      '다운로드가 시작되지 않으면 아래 버튼을 눌러주세요.',
      name: 'common_download_3',
      desc: '',
      args: [],
    );
  }

  /// `다운로드`
  String get common_download_4 {
    return Intl.message('다운로드', name: 'common_download_4', desc: '', args: []);
  }

  /// `펼쳐보기`
  String get common_unfold {
    return Intl.message('펼쳐보기', name: 'common_unfold', desc: '', args: []);
  }

  /// `닫기`
  String get common_fold {
    return Intl.message('닫기', name: 'common_fold', desc: '', args: []);
  }

  /// `최종 편집`
  String get common_edit_by {
    return Intl.message('최종 편집', name: 'common_edit_by', desc: '', args: []);
  }

  /// `출력하기`
  String get common_print {
    return Intl.message('출력하기', name: 'common_print', desc: '', args: []);
  }

  /// `전체 발송`
  String get common_send_all {
    return Intl.message('전체 발송', name: 'common_send_all', desc: '', args: []);
  }

  /// `비고`
  String get common_note {
    return Intl.message('비고', name: 'common_note', desc: '', args: []);
  }

  /// `텍스트 색상`
  String get text_color {
    return Intl.message('텍스트 색상', name: 'text_color', desc: '', args: []);
  }

  /// `배경 색상`
  String get highlight_color {
    return Intl.message('배경 색상', name: 'highlight_color', desc: '', args: []);
  }

  /// `날짜 선택`
  String get date_title {
    return Intl.message('날짜 선택', name: 'date_title', desc: '', args: []);
  }

  /// `날짜 범위 선택`
  String get date_range_title {
    return Intl.message(
      '날짜 범위 선택',
      name: 'date_range_title',
      desc: '',
      args: [],
    );
  }

  /// `페이지를 나가시겠어요?`
  String get pop_scope_title {
    return Intl.message(
      '페이지를 나가시겠어요?',
      name: 'pop_scope_title',
      desc: '',
      args: [],
    );
  }

  /// `작성 중인 내용이 저장되지 않고 모두 사라집니다.\n계속하시겠습니까?`
  String get pop_scope_content {
    return Intl.message(
      '작성 중인 내용이 저장되지 않고 모두 사라집니다.\n계속하시겠습니까?',
      name: 'pop_scope_content',
      desc: '',
      args: [],
    );
  }

  /// `잘못된 접근입니다`
  String get wrong_approach_title {
    return Intl.message(
      '잘못된 접근입니다',
      name: 'wrong_approach_title',
      desc: '',
      args: [],
    );
  }

  /// `확인 버튼을 누르면 이전 화면으로 돌아갑니다.`
  String get wrong_approach_content {
    return Intl.message(
      '확인 버튼을 누르면 이전 화면으로 돌아갑니다.',
      name: 'wrong_approach_content',
      desc: '',
      args: [],
    );
  }

  /// `알 수 없는 단계입니다`
  String get unknown_step {
    return Intl.message(
      '알 수 없는 단계입니다',
      name: 'unknown_step',
      desc: '',
      args: [],
    );
  }

  /// `현대자동차`
  String get hyundai {
    return Intl.message('현대자동차', name: 'hyundai', desc: '', args: []);
  }

  /// `기아`
  String get kia {
    return Intl.message('기아', name: 'kia', desc: '', args: []);
  }

  /// `연구소 및 기타`
  String get lab_and_other {
    return Intl.message('연구소 및 기타', name: 'lab_and_other', desc: '', args: []);
  }

  /// `미지정`
  String get unspecified {
    return Intl.message('미지정', name: 'unspecified', desc: '', args: []);
  }

  /// `로그아웃`
  String get logout {
    return Intl.message('로그아웃', name: 'logout', desc: '', args: []);
  }

  /// `선택됨`
  String get filter_suffix {
    return Intl.message('선택됨', name: 'filter_suffix', desc: '', args: []);
  }

  /// `적용중`
  String get filter_applied {
    return Intl.message('적용중', name: 'filter_applied', desc: '', args: []);
  }

  /// `모두 선택`
  String get filter_select_all {
    return Intl.message('모두 선택', name: 'filter_select_all', desc: '', args: []);
  }

  /// `모두 선택 해제`
  String get filter_unselect_all {
    return Intl.message(
      '모두 선택 해제',
      name: 'filter_unselect_all',
      desc: '',
      args: [],
    );
  }

  /// `모두 선택됨`
  String get filter_all_selected {
    return Intl.message(
      '모두 선택됨',
      name: 'filter_all_selected',
      desc: '',
      args: [],
    );
  }

  /// `정렬`
  String get filter_sort {
    return Intl.message('정렬', name: 'filter_sort', desc: '', args: []);
  }

  /// `정렬 기준`
  String get filter_sort_1 {
    return Intl.message('정렬 기준', name: 'filter_sort_1', desc: '', args: []);
  }

  /// `순서`
  String get filter_order {
    return Intl.message('순서', name: 'filter_order', desc: '', args: []);
  }

  /// `정렬 방향`
  String get filter_order_1 {
    return Intl.message('정렬 방향', name: 'filter_order_1', desc: '', args: []);
  }

  /// `오름차순`
  String get filter_ascending {
    return Intl.message('오름차순', name: 'filter_ascending', desc: '', args: []);
  }

  /// `내림차순`
  String get filter_descending {
    return Intl.message('내림차순', name: 'filter_descending', desc: '', args: []);
  }

  /// `데이터 로딩 중입니다`
  String get export_loading_1 {
    return Intl.message(
      '데이터 로딩 중입니다',
      name: 'export_loading_1',
      desc: '',
      args: [],
    );
  }

  /// `PDF 변환 중입니다`
  String get export_loading_2 {
    return Intl.message(
      'PDF 변환 중입니다',
      name: 'export_loading_2',
      desc: '',
      args: [],
    );
  }

  /// `연결 오류가 발생했습니다. 네트워크를 확인하세요.`
  String get connection_error {
    return Intl.message(
      '연결 오류가 발생했습니다. 네트워크를 확인하세요.',
      name: 'connection_error',
      desc: '',
      args: [],
    );
  }

  /// `연결 시간이 초과되었습니다. 나중에 다시 시도하세요.`
  String get connection_timeout {
    return Intl.message(
      '연결 시간이 초과되었습니다. 나중에 다시 시도하세요.',
      name: 'connection_timeout',
      desc: '',
      args: [],
    );
  }

  /// `요청을 보내는 도중 시간이 초과되었습니다.`
  String get send_timeout {
    return Intl.message(
      '요청을 보내는 도중 시간이 초과되었습니다.',
      name: 'send_timeout',
      desc: '',
      args: [],
    );
  }

  /// `서버 응답 시간이 초과되었습니다. 다시 시도하세요.`
  String get receive_timeout {
    return Intl.message(
      '서버 응답 시간이 초과되었습니다. 다시 시도하세요.',
      name: 'receive_timeout',
      desc: '',
      args: [],
    );
  }

  /// `보안 인증서가 유효하지 않습니다. 서버를 확인하세요.`
  String get bad_certificate {
    return Intl.message(
      '보안 인증서가 유효하지 않습니다. 서버를 확인하세요.',
      name: 'bad_certificate',
      desc: '',
      args: [],
    );
  }

  /// `서버에서 잘못된 응답을 받았습니다. 다시 시도하세요.`
  String get bad_response {
    return Intl.message(
      '서버에서 잘못된 응답을 받았습니다. 다시 시도하세요.',
      name: 'bad_response',
      desc: '',
      args: [],
    );
  }

  /// `예상치 못한 오류가 발생했습니다.`
  String get error_unexpected {
    return Intl.message(
      '예상치 못한 오류가 발생했습니다.',
      name: 'error_unexpected',
      desc: '',
      args: [],
    );
  }

  /// `잘못된 요청입니다.`
  String get bad_request {
    return Intl.message('잘못된 요청입니다.', name: 'bad_request', desc: '', args: []);
  }

  /// `로그인 세션이 만료되었습니다. 다시 로그인해 주세요.`
  String get refresh_token_expired {
    return Intl.message(
      '로그인 세션이 만료되었습니다. 다시 로그인해 주세요.',
      name: 'refresh_token_expired',
      desc: '',
      args: [],
    );
  }

  /// `해당 이메일로 이미 가입된 사용자가 있습니다.\n다른 이메일 주소를 사용해 주세요.`
  String get user_exists {
    return Intl.message(
      '해당 이메일로 이미 가입된 사용자가 있습니다.\n다른 이메일 주소를 사용해 주세요.',
      name: 'user_exists',
      desc: '',
      args: [],
    );
  }

  /// `이미 북마크한 프로젝트입니다.`
  String get bookmark_exists {
    return Intl.message(
      '이미 북마크한 프로젝트입니다.',
      name: 'bookmark_exists',
      desc: '',
      args: [],
    );
  }

  /// `이미 사용 중인 프로젝트 코드입니다. 다른 코드를 입력해 주세요.`
  String get project_exists {
    return Intl.message(
      '이미 사용 중인 프로젝트 코드입니다. 다른 코드를 입력해 주세요.',
      name: 'project_exists',
      desc: '',
      args: [],
    );
  }

  /// `이미 생성된 근무 일정이 있습니다.`
  String get schedule_exists {
    return Intl.message(
      '이미 생성된 근무 일정이 있습니다.',
      name: 'schedule_exists',
      desc: '',
      args: [],
    );
  }

  /// `이미 해당 근무 일정으로 작성된 실무 결과가 있습니다.`
  String get report_exists {
    return Intl.message(
      '이미 해당 근무 일정으로 작성된 실무 결과가 있습니다.',
      name: 'report_exists',
      desc: '',
      args: [],
    );
  }

  /// `이미 생성된 계약 및 수주 업무가 있습니다.`
  String get contract_issue_exists {
    return Intl.message(
      '이미 생성된 계약 및 수주 업무가 있습니다.',
      name: 'contract_issue_exists',
      desc: '',
      args: [],
    );
  }

  /// `이미 생성된 킥어프 업무가 있습니다.`
  String get kickoff_issue_exists {
    return Intl.message(
      '이미 생성된 킥어프 업무가 있습니다.',
      name: 'kickoff_issue_exists',
      desc: '',
      args: [],
    );
  }

  /// `이미 생성된 거래 명세/인보이스 업무가 있습니다.`
  String get transaction_issue_exists {
    return Intl.message(
      '이미 생성된 거래 명세/인보이스 업무가 있습니다.',
      name: 'transaction_issue_exists',
      desc: '',
      args: [],
    );
  }

  /// `이미 생성된 지급 청구 업무가 있습니다.`
  String get payment_issue_exists {
    return Intl.message(
      '이미 생성된 지급 청구 업무가 있습니다.',
      name: 'payment_issue_exists',
      desc: '',
      args: [],
    );
  }

  /// `비밀번호 재설정은 1분에 한 번만 요청할 수 있습니다. 잠시 후 다시 시도해주세요.`
  String get too_many_forgot_password_requests {
    return Intl.message(
      '비밀번호 재설정은 1분에 한 번만 요청할 수 있습니다. 잠시 후 다시 시도해주세요.',
      name: 'too_many_forgot_password_requests',
      desc: '',
      args: [],
    );
  }

  /// `입력한 이메일이 존재하지 않습니다.\n정보를 확인하고 다시 시도하세요.`
  String get user_not_found {
    return Intl.message(
      '입력한 이메일이 존재하지 않습니다.\n정보를 확인하고 다시 시도하세요.',
      name: 'user_not_found',
      desc: '',
      args: [],
    );
  }

  /// `프로젝트를 찾을 수 없습니다.`
  String get project_not_found {
    return Intl.message(
      '프로젝트를 찾을 수 없습니다.',
      name: 'project_not_found',
      desc: '',
      args: [],
    );
  }

  /// `북마크를 찾을 수 없습니다.`
  String get bookmark_not_found {
    return Intl.message(
      '북마크를 찾을 수 없습니다.',
      name: 'bookmark_not_found',
      desc: '',
      args: [],
    );
  }

  /// `업무를 찾을 수 없습니다.`
  String get issue_not_found {
    return Intl.message(
      '업무를 찾을 수 없습니다.',
      name: 'issue_not_found',
      desc: '',
      args: [],
    );
  }

  /// `근무 일정을 찾을 수 없습니다.`
  String get schedule_not_found {
    return Intl.message(
      '근무 일정을 찾을 수 없습니다.',
      name: 'schedule_not_found',
      desc: '',
      args: [],
    );
  }

  /// `출장 명령서를 찾을 수 없습니다.`
  String get report_not_found {
    return Intl.message(
      '출장 명령서를 찾을 수 없습니다.',
      name: 'report_not_found',
      desc: '',
      args: [],
    );
  }

  /// `파일을 찾을 수 없습니다.`
  String get file_not_found {
    return Intl.message(
      '파일을 찾을 수 없습니다.',
      name: 'file_not_found',
      desc: '',
      args: [],
    );
  }

  /// `환율 정보를 찾을 수 없습니다. 영업일 또는 당일 11시 이후에 다시 요청하세요.`
  String get exchange_not_found {
    return Intl.message(
      '환율 정보를 찾을 수 없습니다. 영업일 또는 당일 11시 이후에 다시 요청하세요.',
      name: 'exchange_not_found',
      desc: '',
      args: [],
    );
  }

  /// `발주 항목을 찾을 수 없습니다.`
  String get request_not_found {
    return Intl.message(
      '발주 항목을 찾을 수 없습니다.',
      name: 'request_not_found',
      desc: '',
      args: [],
    );
  }

  /// `승인권자의 승인이 필요합니다.`
  String get ceo_approval_required {
    return Intl.message(
      '승인권자의 승인이 필요합니다.',
      name: 'ceo_approval_required',
      desc: '',
      args: [],
    );
  }

  /// `이 페이지에 접근할 권한이 없습니다.`
  String get no_permission {
    return Intl.message(
      '이 페이지에 접근할 권한이 없습니다.',
      name: 'no_permission',
      desc: '',
      args: [],
    );
  }

  /// `문제가 발생했습니다`
  String get error_title {
    return Intl.message('문제가 발생했습니다', name: 'error_title', desc: '', args: []);
  }

  /// `자세히 보기`
  String get error_detail {
    return Intl.message('자세히 보기', name: 'error_detail', desc: '', args: []);
  }

  /// `에러 상세보기`
  String get error_dialog_1 {
    return Intl.message('에러 상세보기', name: 'error_dialog_1', desc: '', args: []);
  }

  /// `클립보드에 복사`
  String get error_dialog_2 {
    return Intl.message('클립보드에 복사', name: 'error_dialog_2', desc: '', args: []);
  }

  /// `이미지 붙여넣기에 실패했습니다.`
  String get error_clipboard_image_paste {
    return Intl.message(
      '이미지 붙여넣기에 실패했습니다.',
      name: 'error_clipboard_image_paste',
      desc: '',
      args: [],
    );
  }

  /// `방금`
  String get relative_data_just_now {
    return Intl.message(
      '방금',
      name: 'relative_data_just_now',
      desc: '',
      args: [],
    );
  }

  /// `1분 전`
  String get relative_data_minute_ago {
    return Intl.message(
      '1분 전',
      name: 'relative_data_minute_ago',
      desc: '',
      args: [],
    );
  }

  /// `{minutes}분 전`
  String relative_data_minutes_ago(Object minutes) {
    return Intl.message(
      '$minutes분 전',
      name: 'relative_data_minutes_ago',
      desc: '',
      args: [minutes],
    );
  }

  /// `한 시간 전`
  String get relative_data_hour_ago {
    return Intl.message(
      '한 시간 전',
      name: 'relative_data_hour_ago',
      desc: '',
      args: [],
    );
  }

  /// `{hours}시간 전`
  String relative_data_hours_ago(Object hours) {
    return Intl.message(
      '$hours시간 전',
      name: 'relative_data_hours_ago',
      desc: '',
      args: [hours],
    );
  }

  /// `어제`
  String get relative_data_yesterday {
    return Intl.message(
      '어제',
      name: 'relative_data_yesterday',
      desc: '',
      args: [],
    );
  }

  /// `{days}일 전`
  String relative_data_days_ago(Object days) {
    return Intl.message(
      '$days일 전',
      name: 'relative_data_days_ago',
      desc: '',
      args: [days],
    );
  }

  /// `한 주 전`
  String get relative_data_week_ago {
    return Intl.message(
      '한 주 전',
      name: 'relative_data_week_ago',
      desc: '',
      args: [],
    );
  }

  /// `{weeks}주 전`
  String relative_data_weeks_ago(Object weeks) {
    return Intl.message(
      '$weeks주 전',
      name: 'relative_data_weeks_ago',
      desc: '',
      args: [weeks],
    );
  }

  /// `{month}달 전`
  String relative_data_month_ago(Object month) {
    return Intl.message(
      '$month달 전',
      name: 'relative_data_month_ago',
      desc: '',
      args: [month],
    );
  }

  /// `1년 전`
  String get relative_data_year_ago {
    return Intl.message(
      '1년 전',
      name: 'relative_data_year_ago',
      desc: '',
      args: [],
    );
  }

  /// `{years}년 전`
  String relative_data_years_ago(Object years) {
    return Intl.message(
      '$years년 전',
      name: 'relative_data_years_ago',
      desc: '',
      args: [years],
    );
  }

  /// `로그인`
  String get login_headline {
    return Intl.message('로그인', name: 'login_headline', desc: '', args: []);
  }

  /// `이메일과 비밀번호를 입력해주세요`
  String get login_title {
    return Intl.message(
      '이메일과 비밀번호를 입력해주세요',
      name: 'login_title',
      desc: '',
      args: [],
    );
  }

  /// `이메일`
  String get login_email {
    return Intl.message('이메일', name: 'login_email', desc: '', args: []);
  }

  /// `비밀번호`
  String get login_password {
    return Intl.message('비밀번호', name: 'login_password', desc: '', args: []);
  }

  /// `자동 로그인`
  String get login_persist {
    return Intl.message('자동 로그인', name: 'login_persist', desc: '', args: []);
  }

  /// `비밀번호를 잊으셨나요?`
  String get login_forgot {
    return Intl.message(
      '비밀번호를 잊으셨나요?',
      name: 'login_forgot',
      desc: '',
      args: [],
    );
  }

  /// `로그인`
  String get login_button {
    return Intl.message('로그인', name: 'login_button', desc: '', args: []);
  }

  /// `계정이 없으신가요?`
  String get login_create_account_1 {
    return Intl.message(
      '계정이 없으신가요?',
      name: 'login_create_account_1',
      desc: '',
      args: [],
    );
  }

  /// `계정 만들기`
  String get login_create_account_2 {
    return Intl.message(
      '계정 만들기',
      name: 'login_create_account_2',
      desc: '',
      args: [],
    );
  }

  /// `이메일 또는 비밀번호가 일치하지 않습니다`
  String get login_invalid {
    return Intl.message(
      '이메일 또는 비밀번호가 일치하지 않습니다',
      name: 'login_invalid',
      desc: '',
      args: [],
    );
  }

  /// `로그인 할 수 없습니다`
  String get login_forbidden_1 {
    return Intl.message(
      '로그인 할 수 없습니다',
      name: 'login_forbidden_1',
      desc: '',
      args: [],
    );
  }

  /// `관리자의 승인을 받지 않은 계정입니다.\n추가 도움이 필요하시면 관리자에게 문의해 주세요.`
  String get login_forbidden_2 {
    return Intl.message(
      '관리자의 승인을 받지 않은 계정입니다.\n추가 도움이 필요하시면 관리자에게 문의해 주세요.',
      name: 'login_forbidden_2',
      desc: '',
      args: [],
    );
  }

  /// `요청이 전송되었습니다`
  String get login_request_1 {
    return Intl.message(
      '요청이 전송되었습니다',
      name: 'login_request_1',
      desc: '',
      args: [],
    );
  }

  /// `관리자의 인증 후, 계정을 사용할 수 있습니다.\n추가 도움이 필요하시면 관리자에게 문의해 주세요.`
  String get login_request_2 {
    return Intl.message(
      '관리자의 인증 후, 계정을 사용할 수 있습니다.\n추가 도움이 필요하시면 관리자에게 문의해 주세요.',
      name: 'login_request_2',
      desc: '',
      args: [],
    );
  }

  /// `새 계정 만들기`
  String get register_headline {
    return Intl.message(
      '새 계정 만들기',
      name: 'register_headline',
      desc: '',
      args: [],
    );
  }

  /// `계정은 관리자의 승인 후 사용할 수 있습니다`
  String get register_title {
    return Intl.message(
      '계정은 관리자의 승인 후 사용할 수 있습니다',
      name: 'register_title',
      desc: '',
      args: [],
    );
  }

  /// `본명`
  String get register_username {
    return Intl.message('본명', name: 'register_username', desc: '', args: []);
  }

  /// `이메일`
  String get register_email {
    return Intl.message('이메일', name: 'register_email', desc: '', args: []);
  }

  /// `비밀번호`
  String get register_password {
    return Intl.message('비밀번호', name: 'register_password', desc: '', args: []);
  }

  /// `최소 8글자`
  String get register_password_validation_1 {
    return Intl.message(
      '최소 8글자',
      name: 'register_password_validation_1',
      desc: '',
      args: [],
    );
  }

  /// `최소 1개의 대문자`
  String get register_password_validation_2 {
    return Intl.message(
      '최소 1개의 대문자',
      name: 'register_password_validation_2',
      desc: '',
      args: [],
    );
  }

  /// `최소 1개의 소문자`
  String get register_password_validation_3 {
    return Intl.message(
      '최소 1개의 소문자',
      name: 'register_password_validation_3',
      desc: '',
      args: [],
    );
  }

  /// `최소 1개의 숫자`
  String get register_password_validation_4 {
    return Intl.message(
      '최소 1개의 숫자',
      name: 'register_password_validation_4',
      desc: '',
      args: [],
    );
  }

  /// `최소 1개의 특수 문자`
  String get register_password_validation_5 {
    return Intl.message(
      '최소 1개의 특수 문자',
      name: 'register_password_validation_5',
      desc: '',
      args: [],
    );
  }

  /// `이용 약관`
  String get register_agreement_1 {
    return Intl.message(
      '이용 약관',
      name: 'register_agreement_1',
      desc: '',
      args: [],
    );
  }

  /// `과 `
  String get register_agreement_2 {
    return Intl.message('과 ', name: 'register_agreement_2', desc: '', args: []);
  }

  /// `개인정보 수집 및 이용`
  String get register_agreement_3 {
    return Intl.message(
      '개인정보 수집 및 이용',
      name: 'register_agreement_3',
      desc: '',
      args: [],
    );
  }

  /// `에 동의합니다`
  String get register_agreement_4 {
    return Intl.message(
      '에 동의합니다',
      name: 'register_agreement_4',
      desc: '',
      args: [],
    );
  }

  /// `신청하기`
  String get register_button {
    return Intl.message('신청하기', name: 'register_button', desc: '', args: []);
  }

  /// `비밀번호 재설정하기`
  String get forgot_password_headline {
    return Intl.message(
      '비밀번호 재설정하기',
      name: 'forgot_password_headline',
      desc: '',
      args: [],
    );
  }

  /// `이메일 주소를 입력하면, 비밀번호를 재설정 메일을 보내드립니다.`
  String get forgot_password_title {
    return Intl.message(
      '이메일 주소를 입력하면, 비밀번호를 재설정 메일을 보내드립니다.',
      name: 'forgot_password_title',
      desc: '',
      args: [],
    );
  }

  /// `이메일`
  String get forgot_password_email {
    return Intl.message(
      '이메일',
      name: 'forgot_password_email',
      desc: '',
      args: [],
    );
  }

  /// `요청하기`
  String get forgot_password_button {
    return Intl.message(
      '요청하기',
      name: 'forgot_password_button',
      desc: '',
      args: [],
    );
  }

  /// `{seconds}초 후 재시도 가능`
  String forgot_password_delay(Object seconds) {
    return Intl.message(
      '$seconds초 후 재시도 가능',
      name: 'forgot_password_delay',
      desc: '',
      args: [seconds],
    );
  }

  /// `비밀번호 재설정 이메일이 성공적으로 발송되었습니다.`
  String get forgot_password_requested {
    return Intl.message(
      '비밀번호 재설정 이메일이 성공적으로 발송되었습니다.',
      name: 'forgot_password_requested',
      desc: '',
      args: [],
    );
  }

  /// `새 비밀번호 설정하기`
  String get reset_password_headline {
    return Intl.message(
      '새 비밀번호 설정하기',
      name: 'reset_password_headline',
      desc: '',
      args: [],
    );
  }

  /// `변경할 비밀번호를 입력해 주세요.`
  String get reset_password_title {
    return Intl.message(
      '변경할 비밀번호를 입력해 주세요.',
      name: 'reset_password_title',
      desc: '',
      args: [],
    );
  }

  /// `비밀번호`
  String get reset_password_password {
    return Intl.message(
      '비밀번호',
      name: 'reset_password_password',
      desc: '',
      args: [],
    );
  }

  /// `요청하기`
  String get reset_password_button {
    return Intl.message(
      '요청하기',
      name: 'reset_password_button',
      desc: '',
      args: [],
    );
  }

  /// `링크 만료`
  String get reset_password_retry_1 {
    return Intl.message(
      '링크 만료',
      name: 'reset_password_retry_1',
      desc: '',
      args: [],
    );
  }

  /// `이 링크는 사용할 수 있는 시간이 지났거나,\n이미 비밀번호를 바꾸는 데 사용되었기 때문에 작동하지 않습니다.`
  String get reset_password_retry_2 {
    return Intl.message(
      '이 링크는 사용할 수 있는 시간이 지났거나,\n이미 비밀번호를 바꾸는 데 사용되었기 때문에 작동하지 않습니다.',
      name: 'reset_password_retry_2',
      desc: '',
      args: [],
    );
  }

  /// `비밀번호 재설정 요청을 다시 진행해 주세요.`
  String get reset_password_retry_3 {
    return Intl.message(
      '비밀번호 재설정 요청을 다시 진행해 주세요.',
      name: 'reset_password_retry_3',
      desc: '',
      args: [],
    );
  }

  /// `다시 요청하기`
  String get reset_password_retry_4 {
    return Intl.message(
      '다시 요청하기',
      name: 'reset_password_retry_4',
      desc: '',
      args: [],
    );
  }

  /// `비밀번호가 정상적으로 변경되었습니다.`
  String get reset_password_success {
    return Intl.message(
      '비밀번호가 정상적으로 변경되었습니다.',
      name: 'reset_password_success',
      desc: '',
      args: [],
    );
  }

  /// `검색`
  String get navigation_search {
    return Intl.message('검색', name: 'navigation_search', desc: '', args: []);
  }

  /// `Taskflow에서 검색`
  String get navigation_search_title {
    return Intl.message(
      'Taskflow에서 검색',
      name: 'navigation_search_title',
      desc: '',
      args: [],
    );
  }

  /// `최근 검색어`
  String get navigation_search_keyword {
    return Intl.message(
      '최근 검색어',
      name: 'navigation_search_keyword',
      desc: '',
      args: [],
    );
  }

  /// `모두 지우기`
  String get navigation_search_keyword_erase {
    return Intl.message(
      '모두 지우기',
      name: 'navigation_search_keyword_erase',
      desc: '',
      args: [],
    );
  }

  /// `최근 검색어가 없습니다`
  String get navigation_search_keyword_empty {
    return Intl.message(
      '최근 검색어가 없습니다',
      name: 'navigation_search_keyword_empty',
      desc: '',
      args: [],
    );
  }

  /// `WORKSPACES`
  String get navigation_title_1 {
    return Intl.message(
      'WORKSPACES',
      name: 'navigation_title_1',
      desc: '',
      args: [],
    );
  }

  /// `ADMIN`
  String get navigation_title_2 {
    return Intl.message(
      'ADMIN',
      name: 'navigation_title_2',
      desc: '',
      args: [],
    );
  }

  /// `OTHER`
  String get navigation_title_3 {
    return Intl.message(
      'OTHER',
      name: 'navigation_title_3',
      desc: '',
      args: [],
    );
  }

  /// `대시보드`
  String get navigation_item_1 {
    return Intl.message('대시보드', name: 'navigation_item_1', desc: '', args: []);
  }

  /// `프로젝트`
  String get navigation_item_2 {
    return Intl.message('프로젝트', name: 'navigation_item_2', desc: '', args: []);
  }

  /// `업무`
  String get navigation_item_3 {
    return Intl.message('업무', name: 'navigation_item_3', desc: '', args: []);
  }

  /// `문서`
  String get navigation_item_4 {
    return Intl.message('문서', name: 'navigation_item_4', desc: '', args: []);
  }

  /// `운영 관리`
  String get navigation_item_5 {
    return Intl.message('운영 관리', name: 'navigation_item_5', desc: '', args: []);
  }

  /// `통계`
  String get navigation_item_6 {
    return Intl.message('통계', name: 'navigation_item_6', desc: '', args: []);
  }

  /// `설정`
  String get navigation_item_7 {
    return Intl.message('설정', name: 'navigation_item_7', desc: '', args: []);
  }

  /// `대시보드`
  String get dashboard {
    return Intl.message('대시보드', name: 'dashboard', desc: '', args: []);
  }

  /// `프로젝트`
  String get project {
    return Intl.message('프로젝트', name: 'project', desc: '', args: []);
  }

  /// `프로젝트 상세`
  String get project_detail {
    return Intl.message('프로젝트 상세', name: 'project_detail', desc: '', args: []);
  }

  /// `프로젝트 등록`
  String get project_new {
    return Intl.message('프로젝트 등록', name: 'project_new', desc: '', args: []);
  }

  /// `프로젝트 수정`
  String get project_edit {
    return Intl.message('프로젝트 수정', name: 'project_edit', desc: '', args: []);
  }

  /// `업무 종류 선택`
  String get issue_new_choose {
    return Intl.message(
      '업무 종류 선택',
      name: 'issue_new_choose',
      desc: '',
      args: [],
    );
  }

  /// `업무 등록`
  String get issue_new {
    return Intl.message('업무 등록', name: 'issue_new', desc: '', args: []);
  }

  /// `업무 수정`
  String get issue_edit {
    return Intl.message('업무 수정', name: 'issue_edit', desc: '', args: []);
  }

  /// `구매 조달 발주 처리`
  String get issue_edit_procurement_request {
    return Intl.message(
      '구매 조달 발주 처리',
      name: 'issue_edit_procurement_request',
      desc: '',
      args: [],
    );
  }

  /// `근무 일정 종류 선택`
  String get schedule_new_choose {
    return Intl.message(
      '근무 일정 종류 선택',
      name: 'schedule_new_choose',
      desc: '',
      args: [],
    );
  }

  /// `근무 일정 등록`
  String get schedule_new {
    return Intl.message('근무 일정 등록', name: 'schedule_new', desc: '', args: []);
  }

  /// `근무 일정 수정`
  String get schedule_edit {
    return Intl.message('근무 일정 수정', name: 'schedule_edit', desc: '', args: []);
  }

  /// `실무 결과 보고`
  String get report_new_choose {
    return Intl.message(
      '실무 결과 보고',
      name: 'report_new_choose',
      desc: '',
      args: [],
    );
  }

  /// `실무 결과 보고`
  String get report_new {
    return Intl.message('실무 결과 보고', name: 'report_new', desc: '', args: []);
  }

  /// `실무 결과 수정`
  String get report_edit {
    return Intl.message('실무 결과 수정', name: 'report_edit', desc: '', args: []);
  }

  /// `업무`
  String get work {
    return Intl.message('업무', name: 'work', desc: '', args: []);
  }

  /// `문서`
  String get document {
    return Intl.message('문서', name: 'document', desc: '', args: []);
  }

  /// `운영 관리`
  String get operation {
    return Intl.message('운영 관리', name: 'operation', desc: '', args: []);
  }

  /// `통계`
  String get analytics {
    return Intl.message('통계', name: 'analytics', desc: '', args: []);
  }

  /// `설정`
  String get setting {
    return Intl.message('설정', name: 'setting', desc: '', args: []);
  }

  /// `함께하는 지점`
  String get dashboard_world_map_1 {
    return Intl.message(
      '함께하는 지점',
      name: 'dashboard_world_map_1',
      desc: '',
      args: [],
    );
  }

  /// `개 지점`
  String get dashboard_world_map_1_1 {
    return Intl.message(
      '개 지점',
      name: 'dashboard_world_map_1_1',
      desc: '',
      args: [],
    );
  }

  /// `함께하는 공장`
  String get dashboard_world_map_2 {
    return Intl.message(
      '함께하는 공장',
      name: 'dashboard_world_map_2',
      desc: '',
      args: [],
    );
  }

  /// `개 공장`
  String get dashboard_world_map_2_1 {
    return Intl.message(
      '개 공장',
      name: 'dashboard_world_map_2_1',
      desc: '',
      args: [],
    );
  }

  /// `일정`
  String get dashboard_schedule {
    return Intl.message('일정', name: 'dashboard_schedule', desc: '', args: []);
  }

  /// `휴가`
  String get dashboard_schedule_vacation {
    return Intl.message(
      '휴가',
      name: 'dashboard_schedule_vacation',
      desc: '',
      args: [],
    );
  }

  /// `인원`
  String get dashboard_schedule_participants {
    return Intl.message(
      '인원',
      name: 'dashboard_schedule_participants',
      desc: '',
      args: [],
    );
  }

  /// `국내 출장`
  String get dashboard_schedule_domestic {
    return Intl.message(
      '국내 출장',
      name: 'dashboard_schedule_domestic',
      desc: '',
      args: [],
    );
  }

  /// `해외 출장`
  String get dashboard_schedule_overseas {
    return Intl.message(
      '해외 출장',
      name: 'dashboard_schedule_overseas',
      desc: '',
      args: [],
    );
  }

  /// `일정이 없습니다`
  String get dashboard_no_schedule {
    return Intl.message(
      '일정이 없습니다',
      name: 'dashboard_no_schedule',
      desc: '',
      args: [],
    );
  }

  /// `하루 종일`
  String get dashboard_schedule_all_day {
    return Intl.message(
      '하루 종일',
      name: 'dashboard_schedule_all_day',
      desc: '',
      args: [],
    );
  }

  /// `(제목 없음)`
  String get dashboard_no_summary {
    return Intl.message(
      '(제목 없음)',
      name: 'dashboard_no_summary',
      desc: '',
      args: [],
    );
  }

  /// `전체 프로젝트`
  String get dashboard_summary_1 {
    return Intl.message(
      '전체 프로젝트',
      name: 'dashboard_summary_1',
      desc: '',
      args: [],
    );
  }

  /// `종결된 프로젝트`
  String get dashboard_summary_2 {
    return Intl.message(
      '종결된 프로젝트',
      name: 'dashboard_summary_2',
      desc: '',
      args: [],
    );
  }

  /// `킥어프`
  String get dashboard_summary_3 {
    return Intl.message('킥어프', name: 'dashboard_summary_3', desc: '', args: []);
  }

  /// `실무 진행 중`
  String get dashboard_summary_4 {
    return Intl.message(
      '실무 진행 중',
      name: 'dashboard_summary_4',
      desc: '',
      args: [],
    );
  }

  /// `프로젝트 현황`
  String get dashboard_project_stats {
    return Intl.message(
      '프로젝트 현황',
      name: 'dashboard_project_stats',
      desc: '',
      args: [],
    );
  }

  /// `이름`
  String get dashboard_project_stats_1 {
    return Intl.message(
      '이름',
      name: 'dashboard_project_stats_1',
      desc: '',
      args: [],
    );
  }

  /// `종결`
  String get dashboard_project_stats_2 {
    return Intl.message(
      '종결',
      name: 'dashboard_project_stats_2',
      desc: '',
      args: [],
    );
  }

  /// `전체`
  String get dashboard_project_stats_3 {
    return Intl.message(
      '전체',
      name: 'dashboard_project_stats_3',
      desc: '',
      args: [],
    );
  }

  /// `최근 업데이트`
  String get dashboard_latest_update {
    return Intl.message(
      '최근 업데이트',
      name: 'dashboard_latest_update',
      desc: '',
      args: [],
    );
  }

  /// `프로젝트 코드`
  String get dashboard_latest_update_1 {
    return Intl.message(
      '프로젝트 코드',
      name: 'dashboard_latest_update_1',
      desc: '',
      args: [],
    );
  }

  /// `프로젝트 이름`
  String get dashboard_latest_update_2 {
    return Intl.message(
      '프로젝트 이름',
      name: 'dashboard_latest_update_2',
      desc: '',
      args: [],
    );
  }

  /// `업데이트 내역이 없습니다`
  String get dashboard_no_issue {
    return Intl.message(
      '업데이트 내역이 없습니다',
      name: 'dashboard_no_issue',
      desc: '',
      args: [],
    );
  }

  /// `근무 일정 등록`
  String get dashboard_functions_1 {
    return Intl.message(
      '근무 일정 등록',
      name: 'dashboard_functions_1',
      desc: '',
      args: [],
    );
  }

  /// `새 프로젝트 등록`
  String get dashboard_functions_2 {
    return Intl.message(
      '새 프로젝트 등록',
      name: 'dashboard_functions_2',
      desc: '',
      args: [],
    );
  }

  /// `전체`
  String get project_segment_1 {
    return Intl.message('전체', name: 'project_segment_1', desc: '', args: []);
  }

  /// `선진행`
  String get project_segment_2 {
    return Intl.message('선진행', name: 'project_segment_2', desc: '', args: []);
  }

  /// `진행 중`
  String get project_segment_3 {
    return Intl.message('진행 중', name: 'project_segment_3', desc: '', args: []);
  }

  /// `종결`
  String get project_segment_4 {
    return Intl.message('종결', name: 'project_segment_4', desc: '', args: []);
  }

  /// `고객사`
  String get project_filter_1 {
    return Intl.message('고객사', name: 'project_filter_1', desc: '', args: []);
  }

  /// `고객사 선택`
  String get project_filter_1_1 {
    return Intl.message(
      '고객사 선택',
      name: 'project_filter_1_1',
      desc: '',
      args: [],
    );
  }

  /// `지점`
  String get project_filter_2 {
    return Intl.message('지점', name: 'project_filter_2', desc: '', args: []);
  }

  /// `지점 선택`
  String get project_filter_2_1 {
    return Intl.message(
      '지점 선택',
      name: 'project_filter_2_1',
      desc: '',
      args: [],
    );
  }

  /// `공장`
  String get project_filter_3 {
    return Intl.message('공장', name: 'project_filter_3', desc: '', args: []);
  }

  /// `공장 선택`
  String get project_filter_3_1 {
    return Intl.message(
      '공장 선택',
      name: 'project_filter_3_1',
      desc: '',
      args: [],
    );
  }

  /// `카테고리`
  String get project_filter_4 {
    return Intl.message('카테고리', name: 'project_filter_4', desc: '', args: []);
  }

  /// `카테고리 선택`
  String get project_filter_4_1 {
    return Intl.message(
      '카테고리 선택',
      name: 'project_filter_4_1',
      desc: '',
      args: [],
    );
  }

  /// `필터`
  String get project_filter_5 {
    return Intl.message('필터', name: 'project_filter_5', desc: '', args: []);
  }

  /// `필터 선택`
  String get project_filter_5_1 {
    return Intl.message(
      '필터 선택',
      name: 'project_filter_5_1',
      desc: '',
      args: [],
    );
  }

  /// `수정일`
  String get project_sort_1 {
    return Intl.message('수정일', name: 'project_sort_1', desc: '', args: []);
  }

  /// `등록일`
  String get project_sort_2 {
    return Intl.message('등록일', name: 'project_sort_2', desc: '', args: []);
  }

  /// `프로젝트 코드`
  String get project_sort_3 {
    return Intl.message('프로젝트 코드', name: 'project_sort_3', desc: '', args: []);
  }

  /// `프로젝트 이름`
  String get project_sort_4 {
    return Intl.message('프로젝트 이름', name: 'project_sort_4', desc: '', args: []);
  }

  /// `프로젝트 검색`
  String get project_search {
    return Intl.message('프로젝트 검색', name: 'project_search', desc: '', args: []);
  }

  /// `고객사`
  String get project_column_1 {
    return Intl.message('고객사', name: 'project_column_1', desc: '', args: []);
  }

  /// `프로젝트 코드`
  String get project_column_2 {
    return Intl.message(
      '프로젝트 코드',
      name: 'project_column_2',
      desc: '',
      args: [],
    );
  }

  /// `프로젝트 이름`
  String get project_column_3 {
    return Intl.message(
      '프로젝트 이름',
      name: 'project_column_3',
      desc: '',
      args: [],
    );
  }

  /// `카테고리`
  String get project_column_4 {
    return Intl.message('카테고리', name: 'project_column_4', desc: '', args: []);
  }

  /// `PM`
  String get project_column_5 {
    return Intl.message('PM', name: 'project_column_5', desc: '', args: []);
  }

  /// `등록일`
  String get project_column_6 {
    return Intl.message('등록일', name: 'project_column_6', desc: '', args: []);
  }

  /// `작업`
  String get project_column_7 {
    return Intl.message('작업', name: 'project_column_7', desc: '', args: []);
  }

  /// `선진행`
  String get project_preexecuted {
    return Intl.message('선진행', name: 'project_preexecuted', desc: '', args: []);
  }

  /// `종결`
  String get project_closed {
    return Intl.message('종결', name: 'project_closed', desc: '', args: []);
  }

  /// `진행 중`
  String get project_in_progress {
    return Intl.message(
      '진행 중',
      name: 'project_in_progress',
      desc: '',
      args: [],
    );
  }

  /// `프로젝트를 찾을 수 없습니다`
  String get project_no_item {
    return Intl.message(
      '프로젝트를 찾을 수 없습니다',
      name: 'project_no_item',
      desc: '',
      args: [],
    );
  }

  /// `고객사`
  String get project_form_clients {
    return Intl.message(
      '고객사',
      name: 'project_form_clients',
      desc: '',
      args: [],
    );
  }

  /// `고객사 선택`
  String get project_form_clients_select {
    return Intl.message(
      '고객사 선택',
      name: 'project_form_clients_select',
      desc: '',
      args: [],
    );
  }

  /// `프로젝트 코드`
  String get project_form_code {
    return Intl.message(
      '프로젝트 코드',
      name: 'project_form_code',
      desc: '',
      args: [],
    );
  }

  /// `임시 코드`
  String get project_form_code_random {
    return Intl.message(
      '임시 코드',
      name: 'project_form_code_random',
      desc: '',
      args: [],
    );
  }

  /// `프로젝트 이름`
  String get project_form_name {
    return Intl.message(
      '프로젝트 이름',
      name: 'project_form_name',
      desc: '',
      args: [],
    );
  }

  /// `선택항목`
  String get project_form_optional {
    return Intl.message(
      '선택항목',
      name: 'project_form_optional',
      desc: '',
      args: [],
    );
  }

  /// `PM`
  String get project_form_user {
    return Intl.message('PM', name: 'project_form_user', desc: '', args: []);
  }

  /// `사용자 검색`
  String get project_form_user_search {
    return Intl.message(
      '사용자 검색',
      name: 'project_form_user_search',
      desc: '',
      args: [],
    );
  }

  /// `직급`
  String get project_form_user_position {
    return Intl.message(
      '직급',
      name: 'project_form_user_position',
      desc: '',
      args: [],
    );
  }

  /// `부서`
  String get project_form_user_department {
    return Intl.message(
      '부서',
      name: 'project_form_user_department',
      desc: '',
      args: [],
    );
  }

  /// `전체`
  String get project_form_user_department_all {
    return Intl.message(
      '전체',
      name: 'project_form_user_department_all',
      desc: '',
      args: [],
    );
  }

  /// `사용자가 없습니다`
  String get project_form_user_empty {
    return Intl.message(
      '사용자가 없습니다',
      name: 'project_form_user_empty',
      desc: '',
      args: [],
    );
  }

  /// `선진행`
  String get project_form_preexecuted {
    return Intl.message(
      '선진행',
      name: 'project_form_preexecuted',
      desc: '',
      args: [],
    );
  }

  /// `선진행이란, 계약이나 발주가 확정되기 전에\n프로젝트를 미리 착수하는 것을 의미합니다.`
  String get project_form_preexecuted_info {
    return Intl.message(
      '선진행이란, 계약이나 발주가 확정되기 전에\n프로젝트를 미리 착수하는 것을 의미합니다.',
      name: 'project_form_preexecuted_info',
      desc: '',
      args: [],
    );
  }

  /// `프로젝트를 삭제하시겠습니까?`
  String get project_form_delete_dialog_1 {
    return Intl.message(
      '프로젝트를 삭제하시겠습니까?',
      name: 'project_form_delete_dialog_1',
      desc: '',
      args: [],
    );
  }

  /// `프로젝트를 삭제하면 모든 내용과 업무가 함께 삭제됩니다.\n계속하시겠습니까?`
  String get project_form_delete_dialog_2 {
    return Intl.message(
      '프로젝트를 삭제하면 모든 내용과 업무가 함께 삭제됩니다.\n계속하시겠습니까?',
      name: 'project_form_delete_dialog_2',
      desc: '',
      args: [],
    );
  }

  /// `프로젝트가 삭제되었습니다.`
  String get project_form_delete {
    return Intl.message(
      '프로젝트가 삭제되었습니다.',
      name: 'project_form_delete',
      desc: '',
      args: [],
    );
  }

  /// `고객사를 선택해 주세요`
  String get project_form_invalid_1 {
    return Intl.message(
      '고객사를 선택해 주세요',
      name: 'project_form_invalid_1',
      desc: '',
      args: [],
    );
  }

  /// `프로젝트 코드를 입력해 주세요`
  String get project_form_invalid_2 {
    return Intl.message(
      '프로젝트 코드를 입력해 주세요',
      name: 'project_form_invalid_2',
      desc: '',
      args: [],
    );
  }

  /// `프로젝트 이름이 입력해 주세요`
  String get project_form_invalid_3 {
    return Intl.message(
      '프로젝트 이름이 입력해 주세요',
      name: 'project_form_invalid_3',
      desc: '',
      args: [],
    );
  }

  /// `종결된 프로젝트입니다.`
  String get project_detail_closed_1 {
    return Intl.message(
      '종결된 프로젝트입니다.',
      name: 'project_detail_closed_1',
      desc: '',
      args: [],
    );
  }

  /// `출장 명령서 등록을 제외한 모든 기능이 제한됩니다.`
  String get project_detail_closed_2 {
    return Intl.message(
      '출장 명령서 등록을 제외한 모든 기능이 제한됩니다.',
      name: 'project_detail_closed_2',
      desc: '',
      args: [],
    );
  }

  /// `고객사`
  String get project_detail_client {
    return Intl.message(
      '고객사',
      name: 'project_detail_client',
      desc: '',
      args: [],
    );
  }

  /// `PM`
  String get project_detail_pm {
    return Intl.message('PM', name: 'project_detail_pm', desc: '', args: []);
  }

  /// `PM 지정`
  String get project_detail_pm_empty {
    return Intl.message(
      'PM 지정',
      name: 'project_detail_pm_empty',
      desc: '',
      args: [],
    );
  }

  /// `상태`
  String get project_detail_status {
    return Intl.message(
      '상태',
      name: 'project_detail_status',
      desc: '',
      args: [],
    );
  }

  /// `계약`
  String get project_detail_segment_1 {
    return Intl.message(
      '계약',
      name: 'project_detail_segment_1',
      desc: '',
      args: [],
    );
  }

  /// `사양 승인`
  String get project_detail_segment_2 {
    return Intl.message(
      '사양 승인',
      name: 'project_detail_segment_2',
      desc: '',
      args: [],
    );
  }

  /// `구매`
  String get project_detail_segment_3 {
    return Intl.message(
      '구매',
      name: 'project_detail_segment_3',
      desc: '',
      args: [],
    );
  }

  /// `실무`
  String get project_detail_segment_4 {
    return Intl.message(
      '실무',
      name: 'project_detail_segment_4',
      desc: '',
      args: [],
    );
  }

  /// `타임라인`
  String get project_detail_segment_5 {
    return Intl.message(
      '타임라인',
      name: 'project_detail_segment_5',
      desc: '',
      args: [],
    );
  }

  /// `작성된 계약 내역이 없습니다`
  String get project_detail_no_contracts {
    return Intl.message(
      '작성된 계약 내역이 없습니다',
      name: 'project_detail_no_contracts',
      desc: '',
      args: [],
    );
  }

  /// `작성된 사양 승인 내역이 없습니다`
  String get project_detail_no_approvals {
    return Intl.message(
      '작성된 사양 승인 내역이 없습니다',
      name: 'project_detail_no_approvals',
      desc: '',
      args: [],
    );
  }

  /// `작성된 구매 내역이 없습니다`
  String get project_detail_no_procurements {
    return Intl.message(
      '작성된 구매 내역이 없습니다',
      name: 'project_detail_no_procurements',
      desc: '',
      args: [],
    );
  }

  /// `작성된 실무 결과가 없습니다`
  String get project_detail_no_report {
    return Intl.message(
      '작성된 실무 결과가 없습니다',
      name: 'project_detail_no_report',
      desc: '',
      args: [],
    );
  }

  /// `프로젝트 요약`
  String get project_detail_summary {
    return Intl.message(
      '프로젝트 요약',
      name: 'project_detail_summary',
      desc: '',
      args: [],
    );
  }

  /// `착수일`
  String get project_detail_kickoff {
    return Intl.message(
      '착수일',
      name: 'project_detail_kickoff',
      desc: '',
      args: [],
    );
  }

  /// `작성자`
  String get project_detail_summary_1 {
    return Intl.message(
      '작성자',
      name: 'project_detail_summary_1',
      desc: '',
      args: [],
    );
  }

  /// `종결 사유 안내`
  String get project_detail_summary_2 {
    return Intl.message(
      '종결 사유 안내',
      name: 'project_detail_summary_2',
      desc: '',
      args: [],
    );
  }

  /// `업무 내용 공유`
  String get project_issue_mail {
    return Intl.message(
      '업무 내용 공유',
      name: 'project_issue_mail',
      desc: '',
      args: [],
    );
  }

  /// `실무 결과 공유`
  String get project_report_mail {
    return Intl.message(
      '실무 결과 공유',
      name: 'project_report_mail',
      desc: '',
      args: [],
    );
  }

  /// `메일을 보낼 사용자를 선택해 주세요.`
  String get project_mail_select_1 {
    return Intl.message(
      '메일을 보낼 사용자를 선택해 주세요.',
      name: 'project_mail_select_1',
      desc: '',
      args: [],
    );
  }

  /// `메일이 전송되었습니다`
  String get project_mail_send {
    return Intl.message(
      '메일이 전송되었습니다',
      name: 'project_mail_send',
      desc: '',
      args: [],
    );
  }

  /// `메일 전송이 실패했습니다`
  String get project_mail_send_fail {
    return Intl.message(
      '메일 전송이 실패했습니다',
      name: 'project_mail_send_fail',
      desc: '',
      args: [],
    );
  }

  /// `✍️ `
  String get issue_new_choose_1 {
    return Intl.message('✍️ ', name: 'issue_new_choose_1', desc: '', args: []);
  }

  /// `계약 및 수주`
  String get issue_new_choose_1_1 {
    return Intl.message(
      '계약 및 수주',
      name: 'issue_new_choose_1_1',
      desc: '',
      args: [],
    );
  }

  /// `계약 조건과 품목·금액을 기록`
  String get issue_new_choose_1_2 {
    return Intl.message(
      '계약 조건과 품목·금액을 기록',
      name: 'issue_new_choose_1_2',
      desc: '',
      args: [],
    );
  }

  /// `⚽ `
  String get issue_new_choose_2 {
    return Intl.message('⚽ ', name: 'issue_new_choose_2', desc: '', args: []);
  }

  /// `킥어프`
  String get issue_new_choose_2_1 {
    return Intl.message(
      '킥어프',
      name: 'issue_new_choose_2_1',
      desc: '',
      args: [],
    );
  }

  /// `프로젝트 시작 일정과 목표를 공유`
  String get issue_new_choose_2_2 {
    return Intl.message(
      '프로젝트 시작 일정과 목표를 공유',
      name: 'issue_new_choose_2_2',
      desc: '',
      args: [],
    );
  }

  /// `☑️ `
  String get issue_new_choose_3 {
    return Intl.message('☑️ ', name: 'issue_new_choose_3', desc: '', args: []);
  }

  /// `사양 승인`
  String get issue_new_choose_3_1 {
    return Intl.message(
      '사양 승인',
      name: 'issue_new_choose_3_1',
      desc: '',
      args: [],
    );
  }

  /// `확정된 제품·서비스 사양을 기록`
  String get issue_new_choose_3_2 {
    return Intl.message(
      '확정된 제품·서비스 사양을 기록',
      name: 'issue_new_choose_3_2',
      desc: '',
      args: [],
    );
  }

  /// `🛒 `
  String get issue_new_choose_4 {
    return Intl.message('🛒 ', name: 'issue_new_choose_4', desc: '', args: []);
  }

  /// `구매 조달`
  String get issue_new_choose_4_1 {
    return Intl.message(
      '구매 조달',
      name: 'issue_new_choose_4_1',
      desc: '',
      args: [],
    );
  }

  /// `필요 자재·서비스의 상세 정보와 금액을 기록`
  String get issue_new_choose_4_2 {
    return Intl.message(
      '필요 자재·서비스의 상세 정보와 금액을 기록',
      name: 'issue_new_choose_4_2',
      desc: '',
      args: [],
    );
  }

  /// `🧾 `
  String get issue_new_choose_5 {
    return Intl.message('🧾 ', name: 'issue_new_choose_5', desc: '', args: []);
  }

  /// `거래 명세 / 인보이스`
  String get issue_new_choose_5_1 {
    return Intl.message(
      '거래 명세 / 인보이스',
      name: 'issue_new_choose_5_1',
      desc: '',
      args: [],
    );
  }

  /// `계약금·중도금·잔금 내역 관리`
  String get issue_new_choose_5_2 {
    return Intl.message(
      '계약금·중도금·잔금 내역 관리',
      name: 'issue_new_choose_5_2',
      desc: '',
      args: [],
    );
  }

  /// `🏦 `
  String get issue_new_choose_6 {
    return Intl.message('🏦 ', name: 'issue_new_choose_6', desc: '', args: []);
  }

  /// `지급 청구`
  String get issue_new_choose_6_1 {
    return Intl.message(
      '지급 청구',
      name: 'issue_new_choose_6_1',
      desc: '',
      args: [],
    );
  }

  /// `지급 요청 내용과 보고서를 제출`
  String get issue_new_choose_6_2 {
    return Intl.message(
      '지급 요청 내용과 보고서를 제출',
      name: 'issue_new_choose_6_2',
      desc: '',
      args: [],
    );
  }

  /// `프로젝트 종결`
  String get issue_new_choose_7 {
    return Intl.message(
      '프로젝트 종결',
      name: 'issue_new_choose_7',
      desc: '',
      args: [],
    );
  }

  /// `모든 지급 및 회계 완료 처리`
  String get issue_new_choose_7_1 {
    return Intl.message(
      '모든 지급 및 회계 완료 처리',
      name: 'issue_new_choose_7_1',
      desc: '',
      args: [],
    );
  }

  /// `프로젝트 종결 처리는 영구적이며 되돌릴 수 없습니다.`
  String get issue_new_choose_7_2 {
    return Intl.message(
      '프로젝트 종결 처리는 영구적이며 되돌릴 수 없습니다.',
      name: 'issue_new_choose_7_2',
      desc: '',
      args: [],
    );
  }

  /// `이후 실무 결과 등록을 제외한 모든 기능이 제한됩니다.`
  String get issue_new_choose_7_3 {
    return Intl.message(
      '이후 실무 결과 등록을 제외한 모든 기능이 제한됩니다.',
      name: 'issue_new_choose_7_3',
      desc: '',
      args: [],
    );
  }

  /// `이 작업을 수행하면 다음이 비활성화됩니다.`
  String get issue_new_choose_7_4 {
    return Intl.message(
      '이 작업을 수행하면 다음이 비활성화됩니다.',
      name: 'issue_new_choose_7_4',
      desc: '',
      args: [],
    );
  }

  /// ` ◦ 신규 업무 등록`
  String get issue_new_choose_7_5 {
    return Intl.message(
      ' ◦ 신규 업무 등록',
      name: 'issue_new_choose_7_5',
      desc: '',
      args: [],
    );
  }

  /// ` ◦ 기존 업무 수정 및 삭제`
  String get issue_new_choose_7_6 {
    return Intl.message(
      ' ◦ 기존 업무 수정 및 삭제',
      name: 'issue_new_choose_7_6',
      desc: '',
      args: [],
    );
  }

  /// `종결 후, 공유할 내용을 입력하세요.`
  String get issue_new_choose_7_7 {
    return Intl.message(
      '종결 후, 공유할 내용을 입력하세요.',
      name: 'issue_new_choose_7_7',
      desc: '',
      args: [],
    );
  }

  /// `이 프로젝트를 종결하겠습니다`
  String get issue_new_choose_7_8 {
    return Intl.message(
      '이 프로젝트를 종결하겠습니다',
      name: 'issue_new_choose_7_8',
      desc: '',
      args: [],
    );
  }

  /// `본문`
  String get issue_form_content {
    return Intl.message('본문', name: 'issue_form_content', desc: '', args: []);
  }

  /// `첨부파일`
  String get issue_form_attachment {
    return Intl.message(
      '첨부파일',
      name: 'issue_form_attachment',
      desc: '',
      args: [],
    );
  }

  /// `파일을 여기에 놓기`
  String get issue_form_attachment_drop {
    return Intl.message(
      '파일을 여기에 놓기',
      name: 'issue_form_attachment_drop',
      desc: '',
      args: [],
    );
  }

  /// `파일 선택`
  String get issue_form_attachment_upload {
    return Intl.message(
      '파일 선택',
      name: 'issue_form_attachment_upload',
      desc: '',
      args: [],
    );
  }

  /// `URL`
  String get issue_form_link_1 {
    return Intl.message('URL', name: 'issue_form_link_1', desc: '', args: []);
  }

  /// `링크 제목`
  String get issue_form_link_2 {
    return Intl.message('링크 제목', name: 'issue_form_link_2', desc: '', args: []);
  }

  /// `웹 페이지 링크`
  String get issue_form_link_3 {
    return Intl.message(
      '웹 페이지 링크',
      name: 'issue_form_link_3',
      desc: '',
      args: [],
    );
  }

  /// `새 이미지 업로드`
  String get issue_form_image_1 {
    return Intl.message(
      '새 이미지 업로드',
      name: 'issue_form_image_1',
      desc: '',
      args: [],
    );
  }

  /// `이미지 선택`
  String get issue_form_image_2 {
    return Intl.message(
      '이미지 선택',
      name: 'issue_form_image_2',
      desc: '',
      args: [],
    );
  }

  /// `{file} 파일은 유효한 이미지 파일이 아닙니다.`
  String issue_form_image_invalid(Object file) {
    return Intl.message(
      '$file 파일은 유효한 이미지 파일이 아닙니다.',
      name: 'issue_form_image_invalid',
      desc: '',
      args: [file],
    );
  }

  /// `{file} 파일은 크기 제한을 초과했습니다. (최대 {limit}MB)`
  String issue_form_file_size_limit(Object file, Object limit) {
    return Intl.message(
      '$file 파일은 크기 제한을 초과했습니다. (최대 ${limit}MB)',
      name: 'issue_form_file_size_limit',
      desc: '',
      args: [file, limit],
    );
  }

  /// `이미지를 여기에 놓기`
  String get issue_form_image_drop {
    return Intl.message(
      '이미지를 여기에 놓기',
      name: 'issue_form_image_drop',
      desc: '',
      args: [],
    );
  }

  /// `이미지 선택`
  String get issue_form_image_upload {
    return Intl.message(
      '이미지 선택',
      name: 'issue_form_image_upload',
      desc: '',
      args: [],
    );
  }

  /// `사진 가져오기`
  String get issue_form_image_dialog_1 {
    return Intl.message(
      '사진 가져오기',
      name: 'issue_form_image_dialog_1',
      desc: '',
      args: [],
    );
  }

  /// `카메라로 촬영하기`
  String get issue_form_image_dialog_2 {
    return Intl.message(
      '카메라로 촬영하기',
      name: 'issue_form_image_dialog_2',
      desc: '',
      args: [],
    );
  }

  /// `카메라를 찾을 수 없습니다`
  String get issue_form_camera_1 {
    return Intl.message(
      '카메라를 찾을 수 없습니다',
      name: 'issue_form_camera_1',
      desc: '',
      args: [],
    );
  }

  /// `시스템 설정을 확인하여 카메라가 사용 가능한지 확인하세요. 사용 가능한 카메라가 없다면, 카메라를 연결하세요. 그런 다음 브라우저를 다시 시작해야 할 수도 있습니다.`
  String get issue_form_camera_2 {
    return Intl.message(
      '시스템 설정을 확인하여 카메라가 사용 가능한지 확인하세요. 사용 가능한 카메라가 없다면, 카메라를 연결하세요. 그런 다음 브라우저를 다시 시작해야 할 수도 있습니다.',
      name: 'issue_form_camera_2',
      desc: '',
      args: [],
    );
  }

  /// `크롬에서 카메라 사용하기`
  String get issue_form_camera_3 {
    return Intl.message(
      '크롬에서 카메라 사용하기',
      name: 'issue_form_camera_3',
      desc: '',
      args: [],
    );
  }

  /// `사진 사용`
  String get issue_form_camera_4 {
    return Intl.message(
      '사진 사용',
      name: 'issue_form_camera_4',
      desc: '',
      args: [],
    );
  }

  /// `견적 품목`
  String get issue_form_contract_1 {
    return Intl.message(
      '견적 품목',
      name: 'issue_form_contract_1',
      desc: '',
      args: [],
    );
  }

  /// `현대/기아 견적서만 업로드 가능합니다`
  String get issue_form_contract_2 {
    return Intl.message(
      '현대/기아 견적서만 업로드 가능합니다',
      name: 'issue_form_contract_2',
      desc: '',
      args: [],
    );
  }

  /// `계약 내역`
  String get issue_form_contract_3 {
    return Intl.message(
      '계약 내역',
      name: 'issue_form_contract_3',
      desc: '',
      args: [],
    );
  }

  /// `금액 (원)`
  String get issue_form_contract_4 {
    return Intl.message(
      '금액 (원)',
      name: 'issue_form_contract_4',
      desc: '',
      args: [],
    );
  }

  /// `품목 추가`
  String get issue_form_contract_5 {
    return Intl.message(
      '품목 추가',
      name: 'issue_form_contract_5',
      desc: '',
      args: [],
    );
  }

  /// `수주 금액`
  String get issue_form_contract_8 {
    return Intl.message(
      '수주 금액',
      name: 'issue_form_contract_8',
      desc: '',
      args: [],
    );
  }

  /// `견적서 여기에 놓기`
  String get issue_form_contract_drop {
    return Intl.message(
      '견적서 여기에 놓기',
      name: 'issue_form_contract_drop',
      desc: '',
      args: [],
    );
  }

  /// `견적서 선택`
  String get issue_form_contract_upload {
    return Intl.message(
      '견적서 선택',
      name: 'issue_form_contract_upload',
      desc: '',
      args: [],
    );
  }

  /// `견적서는 하나만 업로드할 수 있습니다. 여러 파일을 업로드하면 마지막 파일이 적용됩니다.`
  String get issue_form_contract_too_many {
    return Intl.message(
      '견적서는 하나만 업로드할 수 있습니다. 여러 파일을 업로드하면 마지막 파일이 적용됩니다.',
      name: 'issue_form_contract_too_many',
      desc: '',
      args: [],
    );
  }

  /// `견적서 파일은 엑셀(.xlsx) 파일만 업로드 할 수 있습니다.`
  String get issue_form_contract_invalid {
    return Intl.message(
      '견적서 파일은 엑셀(.xlsx) 파일만 업로드 할 수 있습니다.',
      name: 'issue_form_contract_invalid',
      desc: '',
      args: [],
    );
  }

  /// `{file} 파일은 올바른 현대/기아 견적서 양식이 아닙니다.`
  String issue_form_contract_format_invalid(Object file) {
    return Intl.message(
      '$file 파일은 올바른 현대/기아 견적서 양식이 아닙니다.',
      name: 'issue_form_contract_format_invalid',
      desc: '',
      args: [file],
    );
  }

  /// `견적 품목을 입력하거나, 견적서를 업로드해 주세요`
  String get issue_form_contract_item_invalid_1 {
    return Intl.message(
      '견적 품목을 입력하거나, 견적서를 업로드해 주세요',
      name: 'issue_form_contract_item_invalid_1',
      desc: '',
      args: [],
    );
  }

  /// `견적 품목을 빈 칸 없이 입력해 주세요`
  String get issue_form_contract_item_invalid_2 {
    return Intl.message(
      '견적 품목을 빈 칸 없이 입력해 주세요',
      name: 'issue_form_contract_item_invalid_2',
      desc: '',
      args: [],
    );
  }

  /// `프로젝트 착수일`
  String get issue_form_kickoff_1 {
    return Intl.message(
      '프로젝트 착수일',
      name: 'issue_form_kickoff_1',
      desc: '',
      args: [],
    );
  }

  /// `착수일 선택`
  String get issue_form_kickoff_2 {
    return Intl.message(
      '착수일 선택',
      name: 'issue_form_kickoff_2',
      desc: '',
      args: [],
    );
  }

  /// `착수일을 선택해 주세요`
  String get issue_form_kickoff_invalid {
    return Intl.message(
      '착수일을 선택해 주세요',
      name: 'issue_form_kickoff_invalid',
      desc: '',
      args: [],
    );
  }

  /// `구매 품목`
  String get issue_form_procurement_1 {
    return Intl.message(
      '구매 품목',
      name: 'issue_form_procurement_1',
      desc: '',
      args: [],
    );
  }

  /// `품목 내역`
  String get issue_form_procurement_2 {
    return Intl.message(
      '품목 내역',
      name: 'issue_form_procurement_2',
      desc: '',
      args: [],
    );
  }

  /// `사양`
  String get issue_form_procurement_3 {
    return Intl.message(
      '사양',
      name: 'issue_form_procurement_3',
      desc: '',
      args: [],
    );
  }

  /// `수량`
  String get issue_form_procurement_4 {
    return Intl.message(
      '수량',
      name: 'issue_form_procurement_4',
      desc: '',
      args: [],
    );
  }

  /// `단가`
  String get issue_form_procurement_5 {
    return Intl.message(
      '단가',
      name: 'issue_form_procurement_5',
      desc: '',
      args: [],
    );
  }

  /// `품목 금액`
  String get issue_form_procurement_6 {
    return Intl.message(
      '품목 금액',
      name: 'issue_form_procurement_6',
      desc: '',
      args: [],
    );
  }

  /// `온라인 구매`
  String get issue_form_procurement_7 {
    return Intl.message(
      '온라인 구매',
      name: 'issue_form_procurement_7',
      desc: '',
      args: [],
    );
  }

  /// `구매 링크`
  String get issue_form_procurement_8 {
    return Intl.message(
      '구매 링크',
      name: 'issue_form_procurement_8',
      desc: '',
      args: [],
    );
  }

  /// `공급처`
  String get issue_form_procurement_9 {
    return Intl.message(
      '공급처',
      name: 'issue_form_procurement_9',
      desc: '',
      args: [],
    );
  }

  /// `공급처 선택`
  String get issue_form_procurement_10 {
    return Intl.message(
      '공급처 선택',
      name: 'issue_form_procurement_10',
      desc: '',
      args: [],
    );
  }

  /// `품목 추가`
  String get issue_form_procurement_11 {
    return Intl.message(
      '품목 추가',
      name: 'issue_form_procurement_11',
      desc: '',
      args: [],
    );
  }

  /// `기업명으로 검색`
  String get issue_form_procurement_12 {
    return Intl.message(
      '기업명으로 검색',
      name: 'issue_form_procurement_12',
      desc: '',
      args: [],
    );
  }

  /// `등록할 공급처의 기업명을 입력해 주세요`
  String get issue_form_procurement_13 {
    return Intl.message(
      '등록할 공급처의 기업명을 입력해 주세요',
      name: 'issue_form_procurement_13',
      desc: '',
      args: [],
    );
  }

  /// `기업을 찾을 수 없습니다`
  String get issue_form_procurement_14 {
    return Intl.message(
      '기업을 찾을 수 없습니다',
      name: 'issue_form_procurement_14',
      desc: '',
      args: [],
    );
  }

  /// `품목 합계`
  String get issue_form_procurement_15 {
    return Intl.message(
      '품목 합계',
      name: 'issue_form_procurement_15',
      desc: '',
      args: [],
    );
  }

  /// `검색 중⋯`
  String get issue_form_procurement_16 {
    return Intl.message(
      '검색 중⋯',
      name: 'issue_form_procurement_16',
      desc: '',
      args: [],
    );
  }

  /// `* 구매 처리된 구매 품목은 수정할 수 없습니다.`
  String get issue_form_procurement_17 {
    return Intl.message(
      '* 구매 처리된 구매 품목은 수정할 수 없습니다.',
      name: 'issue_form_procurement_17',
      desc: '',
      args: [],
    );
  }

  /// `구매 요청서 출력하기`
  String get issue_form_procurement_18 {
    return Intl.message(
      '구매 요청서 출력하기',
      name: 'issue_form_procurement_18',
      desc: '',
      args: [],
    );
  }

  /// `발주 목록`
  String get issue_form_procurement_19 {
    return Intl.message(
      '발주 목록',
      name: 'issue_form_procurement_19',
      desc: '',
      args: [],
    );
  }

  /// `발주 담당`
  String get issue_form_procurement_20 {
    return Intl.message(
      '발주 담당',
      name: 'issue_form_procurement_20',
      desc: '',
      args: [],
    );
  }

  /// `발주 일자`
  String get issue_form_procurement_21 {
    return Intl.message(
      '발주 일자',
      name: 'issue_form_procurement_21',
      desc: '',
      args: [],
    );
  }

  /// `납기 일자`
  String get issue_form_procurement_22 {
    return Intl.message(
      '납기 일자',
      name: 'issue_form_procurement_22',
      desc: '',
      args: [],
    );
  }

  /// `별도 협의`
  String get issue_form_procurement_23 {
    return Intl.message(
      '별도 협의',
      name: 'issue_form_procurement_23',
      desc: '',
      args: [],
    );
  }

  /// `지불 조건`
  String get issue_form_procurement_24 {
    return Intl.message(
      '지불 조건',
      name: 'issue_form_procurement_24',
      desc: '',
      args: [],
    );
  }

  /// `* 발주 처리는 관리자 권한인 사용자만 사용할 수 있습니다.`
  String get issue_form_procurement_25 {
    return Intl.message(
      '* 발주 처리는 관리자 권한인 사용자만 사용할 수 있습니다.',
      name: 'issue_form_procurement_25',
      desc: '',
      args: [],
    );
  }

  /// `승인권자 승인`
  String get issue_form_procurement_26 {
    return Intl.message(
      '승인권자 승인',
      name: 'issue_form_procurement_26',
      desc: '',
      args: [],
    );
  }

  /// `* 발주 금액 50만원 이상의 발주서의 출력은 승인권자의 승인이 필요합니다.`
  String get issue_form_procurement_27 {
    return Intl.message(
      '* 발주 금액 50만원 이상의 발주서의 출력은 승인권자의 승인이 필요합니다.',
      name: 'issue_form_procurement_27',
      desc: '',
      args: [],
    );
  }

  /// `제목`
  String get issue_form_procurement_28 {
    return Intl.message(
      '제목',
      name: 'issue_form_procurement_28',
      desc: '',
      args: [],
    );
  }

  /// `구매 품목을 입력하거나, 견적서를 업로드해 주세요`
  String get issue_form_procurement_item_invalid_1 {
    return Intl.message(
      '구매 품목을 입력하거나, 견적서를 업로드해 주세요',
      name: 'issue_form_procurement_item_invalid_1',
      desc: '',
      args: [],
    );
  }

  /// `구매 품목을 빈 칸 없이 입력해 주세요`
  String get issue_form_procurement_item_invalid_2 {
    return Intl.message(
      '구매 품목을 빈 칸 없이 입력해 주세요',
      name: 'issue_form_procurement_item_invalid_2',
      desc: '',
      args: [],
    );
  }

  /// `발주 처리`
  String get issue_form_procurement_idle {
    return Intl.message(
      '발주 처리',
      name: 'issue_form_procurement_idle',
      desc: '',
      args: [],
    );
  }

  /// `발주 완료`
  String get issue_form_procurement_requested {
    return Intl.message(
      '발주 완료',
      name: 'issue_form_procurement_requested',
      desc: '',
      args: [],
    );
  }

  /// `부가세 포함 (10%)`
  String get issue_form_procurement_requested_1 {
    return Intl.message(
      '부가세 포함 (10%)',
      name: 'issue_form_procurement_requested_1',
      desc: '',
      args: [],
    );
  }

  /// `납기 일자`
  String get issue_form_procurement_requested_2 {
    return Intl.message(
      '납기 일자',
      name: 'issue_form_procurement_requested_2',
      desc: '',
      args: [],
    );
  }

  /// `지불 조건`
  String get issue_form_procurement_requested_3 {
    return Intl.message(
      '지불 조건',
      name: 'issue_form_procurement_requested_3',
      desc: '',
      args: [],
    );
  }

  /// `금액`
  String get issue_form_procurement_requested_4 {
    return Intl.message(
      '금액',
      name: 'issue_form_procurement_requested_4',
      desc: '',
      args: [],
    );
  }

  /// `별도 협의`
  String get issue_form_procurement_requested_5 {
    return Intl.message(
      '별도 협의',
      name: 'issue_form_procurement_requested_5',
      desc: '',
      args: [],
    );
  }

  /// `제목`
  String get issue_form_procurement_requested_6 {
    return Intl.message(
      '제목',
      name: 'issue_form_procurement_requested_6',
      desc: '',
      args: [],
    );
  }

  /// `최소 하나의 공급처를 선택해 주세요`
  String get issue_form_procurement_requested_invalid_1 {
    return Intl.message(
      '최소 하나의 공급처를 선택해 주세요',
      name: 'issue_form_procurement_requested_invalid_1',
      desc: '',
      args: [],
    );
  }

  /// `납기 일자를 선택해 주세요`
  String get issue_form_procurement_requested_invalid_2 {
    return Intl.message(
      '납기 일자를 선택해 주세요',
      name: 'issue_form_procurement_requested_invalid_2',
      desc: '',
      args: [],
    );
  }

  /// `지불 조건을 입력해 주세요`
  String get issue_form_procurement_requested_invalid_3 {
    return Intl.message(
      '지불 조건을 입력해 주세요',
      name: 'issue_form_procurement_requested_invalid_3',
      desc: '',
      args: [],
    );
  }

  /// `제목을 입력해 주세요`
  String get issue_form_procurement_requested_invalid_4 {
    return Intl.message(
      '제목을 입력해 주세요',
      name: 'issue_form_procurement_requested_invalid_4',
      desc: '',
      args: [],
    );
  }

  /// `청구 목록`
  String get issue_form_transaction_1 {
    return Intl.message(
      '청구 목록',
      name: 'issue_form_transaction_1',
      desc: '',
      args: [],
    );
  }

  /// `목록 추가`
  String get issue_form_transaction_2 {
    return Intl.message(
      '목록 추가',
      name: 'issue_form_transaction_2',
      desc: '',
      args: [],
    );
  }

  /// `지급 단계`
  String get issue_form_transaction_3 {
    return Intl.message(
      '지급 단계',
      name: 'issue_form_transaction_3',
      desc: '',
      args: [],
    );
  }

  /// `비율 (%)`
  String get issue_form_transaction_4 {
    return Intl.message(
      '비율 (%)',
      name: 'issue_form_transaction_4',
      desc: '',
      args: [],
    );
  }

  /// `금액`
  String get issue_form_transaction_5 {
    return Intl.message(
      '금액',
      name: 'issue_form_transaction_5',
      desc: '',
      args: [],
    );
  }

  /// `지급 여부`
  String get issue_form_transaction_6 {
    return Intl.message(
      '지급 여부',
      name: 'issue_form_transaction_6',
      desc: '',
      args: [],
    );
  }

  /// `청구 목록은 계약 및 수주 업무에서 생성 가능합니다`
  String get issue_form_transaction_item_empty_1 {
    return Intl.message(
      '청구 목록은 계약 및 수주 업무에서 생성 가능합니다',
      name: 'issue_form_transaction_item_empty_1',
      desc: '',
      args: [],
    );
  }

  /// `계약 및 수주 업무로 이동 >`
  String get issue_form_transaction_item_empty_2 {
    return Intl.message(
      '계약 및 수주 업무로 이동 >',
      name: 'issue_form_transaction_item_empty_2',
      desc: '',
      args: [],
    );
  }

  /// `청구 내역을 최소 하나 이상 입력해 주세요`
  String get issue_form_transaction_item_invalid_1 {
    return Intl.message(
      '청구 내역을 최소 하나 이상 입력해 주세요',
      name: 'issue_form_transaction_item_invalid_1',
      desc: '',
      args: [],
    );
  }

  /// `청구 내역을 빈 칸 없이 입력해 주세요`
  String get issue_form_transaction_item_invalid_2 {
    return Intl.message(
      '청구 내역을 빈 칸 없이 입력해 주세요',
      name: 'issue_form_transaction_item_invalid_2',
      desc: '',
      args: [],
    );
  }

  /// `모든 청구 내역 비율을 합산하여 100%가 되도록 입력해 주세요`
  String get issue_form_transaction_item_invalid_3 {
    return Intl.message(
      '모든 청구 내역 비율을 합산하여 100%가 되도록 입력해 주세요',
      name: 'issue_form_transaction_item_invalid_3',
      desc: '',
      args: [],
    );
  }

  /// `업무를 삭제하시겠습니까?`
  String get issue_form_delete_dialog_1 {
    return Intl.message(
      '업무를 삭제하시겠습니까?',
      name: 'issue_form_delete_dialog_1',
      desc: '',
      args: [],
    );
  }

  /// `업무를 삭제하면 모든 내용과 첨부 파일이 함께 삭제됩니다.\n계속하시겠습니까?`
  String get issue_form_delete_dialog_2 {
    return Intl.message(
      '업무를 삭제하면 모든 내용과 첨부 파일이 함께 삭제됩니다.\n계속하시겠습니까?',
      name: 'issue_form_delete_dialog_2',
      desc: '',
      args: [],
    );
  }

  /// `업무가 삭제되었습니다.`
  String get issue_form_delete {
    return Intl.message(
      '업무가 삭제되었습니다.',
      name: 'issue_form_delete',
      desc: '',
      args: [],
    );
  }

  /// `내용을 입력해 주세요`
  String get issue_form_invalid_1 {
    return Intl.message(
      '내용을 입력해 주세요',
      name: 'issue_form_invalid_1',
      desc: '',
      args: [],
    );
  }

  /// `🚅 `
  String get schedule_new_choose_1 {
    return Intl.message(
      '🚅 ',
      name: 'schedule_new_choose_1',
      desc: '',
      args: [],
    );
  }

  /// `국내 출장`
  String get schedule_new_choose_1_1 {
    return Intl.message(
      '국내 출장',
      name: 'schedule_new_choose_1_1',
      desc: '',
      args: [],
    );
  }

  /// `새로운 국내 출장 일정을 등록합니다`
  String get schedule_new_choose_1_2 {
    return Intl.message(
      '새로운 국내 출장 일정을 등록합니다',
      name: 'schedule_new_choose_1_2',
      desc: '',
      args: [],
    );
  }

  /// `✈️ `
  String get schedule_new_choose_2 {
    return Intl.message(
      '✈️ ',
      name: 'schedule_new_choose_2',
      desc: '',
      args: [],
    );
  }

  /// `해외 출장`
  String get schedule_new_choose_2_1 {
    return Intl.message(
      '해외 출장',
      name: 'schedule_new_choose_2_1',
      desc: '',
      args: [],
    );
  }

  /// `새로운 해외 출장 일정을 등록합니다`
  String get schedule_new_choose_2_2 {
    return Intl.message(
      '새로운 해외 출장 일정을 등록합니다',
      name: 'schedule_new_choose_2_2',
      desc: '',
      args: [],
    );
  }

  /// `🏭 `
  String get schedule_new_choose_3 {
    return Intl.message(
      '🏭 ',
      name: 'schedule_new_choose_3',
      desc: '',
      args: [],
    );
  }

  /// `화성 조립 센터`
  String get schedule_new_choose_3_1 {
    return Intl.message(
      '화성 조립 센터',
      name: 'schedule_new_choose_3_1',
      desc: '',
      args: [],
    );
  }

  /// `새로운 화성 조립 센터 일정을 등록합니다`
  String get schedule_new_choose_3_2 {
    return Intl.message(
      '새로운 화성 조립 센터 일정을 등록합니다',
      name: 'schedule_new_choose_3_2',
      desc: '',
      args: [],
    );
  }

  /// `💻 `
  String get schedule_new_choose_4 {
    return Intl.message(
      '💻 ',
      name: 'schedule_new_choose_4',
      desc: '',
      args: [],
    );
  }

  /// `원격 업무`
  String get schedule_new_choose_4_1 {
    return Intl.message(
      '원격 업무',
      name: 'schedule_new_choose_4_1',
      desc: '',
      args: [],
    );
  }

  /// `새로운 원격 업무 일정을 등록합니다`
  String get schedule_new_choose_4_2 {
    return Intl.message(
      '새로운 원격 업무 일정을 등록합니다',
      name: 'schedule_new_choose_4_2',
      desc: '',
      args: [],
    );
  }

  /// `🤝 `
  String get schedule_new_choose_5 {
    return Intl.message(
      '🤝 ',
      name: 'schedule_new_choose_5',
      desc: '',
      args: [],
    );
  }

  /// `회의 • 협의`
  String get schedule_new_choose_5_1 {
    return Intl.message(
      '회의 • 협의',
      name: 'schedule_new_choose_5_1',
      desc: '',
      args: [],
    );
  }

  /// `새로운 회의 또는 협의 일정을 등록합니다`
  String get schedule_new_choose_5_2 {
    return Intl.message(
      '새로운 회의 또는 협의 일정을 등록합니다',
      name: 'schedule_new_choose_5_2',
      desc: '',
      args: [],
    );
  }

  /// `프로젝트`
  String get schedule_form_project {
    return Intl.message(
      '프로젝트',
      name: 'schedule_form_project',
      desc: '',
      args: [],
    );
  }

  /// `프로젝트 검색`
  String get schedule_form_project_search {
    return Intl.message(
      '프로젝트 검색',
      name: 'schedule_form_project_search',
      desc: '',
      args: [],
    );
  }

  /// `프로젝트가 없습니다`
  String get schedule_form_project_emtpy {
    return Intl.message(
      '프로젝트가 없습니다',
      name: 'schedule_form_project_emtpy',
      desc: '',
      args: [],
    );
  }

  /// `일정`
  String get schedule_form_date {
    return Intl.message('일정', name: 'schedule_form_date', desc: '', args: []);
  }

  /// `일정 선택`
  String get schedule_form_date_select {
    return Intl.message(
      '일정 선택',
      name: 'schedule_form_date_select',
      desc: '',
      args: [],
    );
  }

  /// `출장 목적`
  String get schedule_form_summary {
    return Intl.message(
      '출장 목적',
      name: 'schedule_form_summary',
      desc: '',
      args: [],
    );
  }

  /// `설명`
  String get schedule_form_description {
    return Intl.message(
      '설명',
      name: 'schedule_form_description',
      desc: '',
      args: [],
    );
  }

  /// `일정을 삭제하시겠습니까?`
  String get schedule_form_delete_dialog_1 {
    return Intl.message(
      '일정을 삭제하시겠습니까?',
      name: 'schedule_form_delete_dialog_1',
      desc: '',
      args: [],
    );
  }

  /// `일정을 삭제하면 모든 내용과 구글 캘린더의 일정이 함께 삭제됩니다.\n계속하시겠습니까?`
  String get schedule_form_delete_dialog_2 {
    return Intl.message(
      '일정을 삭제하면 모든 내용과 구글 캘린더의 일정이 함께 삭제됩니다.\n계속하시겠습니까?',
      name: 'schedule_form_delete_dialog_2',
      desc: '',
      args: [],
    );
  }

  /// `프로젝트를 선택해 주세요`
  String get schedule_form_invalid_1 {
    return Intl.message(
      '프로젝트를 선택해 주세요',
      name: 'schedule_form_invalid_1',
      desc: '',
      args: [],
    );
  }

  /// `일정을 선택해 주세요`
  String get schedule_form_invalid_2 {
    return Intl.message(
      '일정을 선택해 주세요',
      name: 'schedule_form_invalid_2',
      desc: '',
      args: [],
    );
  }

  /// `출장 목적을 입력해 주세요`
  String get schedule_form_invalid_3 {
    return Intl.message(
      '출장 목적을 입력해 주세요',
      name: 'schedule_form_invalid_3',
      desc: '',
      args: [],
    );
  }

  /// `일정을 등록했습니다`
  String get schedule_form_success {
    return Intl.message(
      '일정을 등록했습니다',
      name: 'schedule_form_success',
      desc: '',
      args: [],
    );
  }

  /// `업무가 삭제되었습니다.`
  String get schedule_form_delete {
    return Intl.message(
      '업무가 삭제되었습니다.',
      name: 'schedule_form_delete',
      desc: '',
      args: [],
    );
  }

  /// `실무 결과 보고`
  String get report_form_title {
    return Intl.message(
      '실무 결과 보고',
      name: 'report_form_title',
      desc: '',
      args: [],
    );
  }

  /// `국내 출장 명령서 등록`
  String get report_form_title_1 {
    return Intl.message(
      '국내 출장 명령서 등록',
      name: 'report_form_title_1',
      desc: '',
      args: [],
    );
  }

  /// `해외 출장 명령서 등록`
  String get report_form_title_2 {
    return Intl.message(
      '해외 출장 명령서 등록',
      name: 'report_form_title_2',
      desc: '',
      args: [],
    );
  }

  /// `교통비`
  String get report_form_1 {
    return Intl.message('교통비', name: 'report_form_1', desc: '', args: []);
  }

  /// `현지 교통비`
  String get report_form_2 {
    return Intl.message('현지 교통비', name: 'report_form_2', desc: '', args: []);
  }

  /// `숙박비`
  String get report_form_3 {
    return Intl.message('숙박비', name: 'report_form_3', desc: '', args: []);
  }

  /// `일비`
  String get report_form_4 {
    return Intl.message('일비', name: 'report_form_4', desc: '', args: []);
  }

  /// `기타`
  String get report_form_5 {
    return Intl.message('기타', name: 'report_form_5', desc: '', args: []);
  }

  /// `프로젝트 정보`
  String get report_form_project {
    return Intl.message(
      '프로젝트 정보',
      name: 'report_form_project',
      desc: '',
      args: [],
    );
  }

  /// `일정`
  String get report_form_schedule {
    return Intl.message('일정', name: 'report_form_schedule', desc: '', args: []);
  }

  /// `일정 검색`
  String get report_form_schedule_search {
    return Intl.message(
      '일정 검색',
      name: 'report_form_schedule_search',
      desc: '',
      args: [],
    );
  }

  /// `일정이 없습니다`
  String get report_form_schedule_empty {
    return Intl.message(
      '일정이 없습니다',
      name: 'report_form_schedule_empty',
      desc: '',
      args: [],
    );
  }

  /// `새 근무 일정 생성 >`
  String get report_form_schedule_add {
    return Intl.message(
      '새 근무 일정 생성 >',
      name: 'report_form_schedule_add',
      desc: '',
      args: [],
    );
  }

  /// `일정 없이 보고서 작성 >`
  String get report_form_schedule_no_schedule {
    return Intl.message(
      '일정 없이 보고서 작성 >',
      name: 'report_form_schedule_no_schedule',
      desc: '',
      args: [],
    );
  }

  /// `설명 없음`
  String get report_form_schedule_description_empty {
    return Intl.message(
      '설명 없음',
      name: 'report_form_schedule_description_empty',
      desc: '',
      args: [],
    );
  }

  /// `진행 중`
  String get report_form_schedule_in_progress {
    return Intl.message(
      '진행 중',
      name: 'report_form_schedule_in_progress',
      desc: '',
      args: [],
    );
  }

  /// `진행 예정`
  String get report_form_schedule_scheduled {
    return Intl.message(
      '진행 예정',
      name: 'report_form_schedule_scheduled',
      desc: '',
      args: [],
    );
  }

  /// `단계`
  String get report_form_step {
    return Intl.message('단계', name: 'report_form_step', desc: '', args: []);
  }

  /// `교통비`
  String get report_form_transportation {
    return Intl.message(
      '교통비',
      name: 'report_form_transportation',
      desc: '',
      args: [],
    );
  }

  /// `현지 교통비`
  String get report_form_local_transportation {
    return Intl.message(
      '현지 교통비',
      name: 'report_form_local_transportation',
      desc: '',
      args: [],
    );
  }

  /// `숙박비`
  String get report_form_accommodation {
    return Intl.message(
      '숙박비',
      name: 'report_form_accommodation',
      desc: '',
      args: [],
    );
  }

  /// `일비`
  String get report_form_daily_expense {
    return Intl.message(
      '일비',
      name: 'report_form_daily_expense',
      desc: '',
      args: [],
    );
  }

  /// `기타`
  String get report_form_other {
    return Intl.message('기타', name: 'report_form_other', desc: '', args: []);
  }

  /// `설명 및 첨부파일`
  String get report_form_description {
    return Intl.message(
      '설명 및 첨부파일',
      name: 'report_form_description',
      desc: '',
      args: [],
    );
  }

  /// `사용 금액`
  String get report_form_column_1 {
    return Intl.message(
      '사용 금액',
      name: 'report_form_column_1',
      desc: '',
      args: [],
    );
  }

  /// `내역 (설명)`
  String get report_form_column_2 {
    return Intl.message(
      '내역 (설명)',
      name: 'report_form_column_2',
      desc: '',
      args: [],
    );
  }

  /// `단가`
  String get report_form_column_3 {
    return Intl.message('단가', name: 'report_form_column_3', desc: '', args: []);
  }

  /// `일`
  String get report_form_column_4 {
    return Intl.message('일', name: 'report_form_column_4', desc: '', args: []);
  }

  /// `렌탈, 택시 실비 처리`
  String get report_form_column_5 {
    return Intl.message(
      '렌탈, 택시 실비 처리',
      name: 'report_form_column_5',
      desc: '',
      args: [],
    );
  }

  /// `개인 차량 유류비`
  String get report_form_column_6 {
    return Intl.message(
      '개인 차량 유류비',
      name: 'report_form_column_6',
      desc: '',
      args: [],
    );
  }

  /// `유류단가`
  String get report_form_column_7 {
    return Intl.message(
      '유류단가',
      name: 'report_form_column_7',
      desc: '',
      args: [],
    );
  }

  /// `연비`
  String get report_form_column_8 {
    return Intl.message('연비', name: 'report_form_column_8', desc: '', args: []);
  }

  /// `운행거리`
  String get report_form_column_9 {
    return Intl.message(
      '운행거리',
      name: 'report_form_column_9',
      desc: '',
      args: [],
    );
  }

  /// `규정 금액`
  String get report_form_regulation {
    return Intl.message(
      '규정 금액',
      name: 'report_form_regulation',
      desc: '',
      args: [],
    );
  }

  /// `총 사용 금액`
  String get report_form_total {
    return Intl.message(
      '총 사용 금액',
      name: 'report_form_total',
      desc: '',
      args: [],
    );
  }

  /// `정산 금액`
  String get report_form_settlement {
    return Intl.message(
      '정산 금액',
      name: 'report_form_settlement',
      desc: '',
      args: [],
    );
  }

  /// `전체 비용 합계`
  String get report_form_total_cost {
    return Intl.message(
      '전체 비용 합계',
      name: 'report_form_total_cost',
      desc: '',
      args: [],
    );
  }

  /// `(과세) 수령 금액`
  String get report_form_taxable_amount {
    return Intl.message(
      '(과세) 수령 금액',
      name: 'report_form_taxable_amount',
      desc: '',
      args: [],
    );
  }

  /// `(비과세) 수령 금액`
  String get report_form_non_taxable_amount {
    return Intl.message(
      '(비과세) 수령 금액',
      name: 'report_form_non_taxable_amount',
      desc: '',
      args: [],
    );
  }

  /// `환율`
  String get report_form_exchange_rate {
    return Intl.message(
      '환율',
      name: 'report_form_exchange_rate',
      desc: '',
      args: [],
    );
  }

  /// `설명`
  String get report_form_description_1 {
    return Intl.message(
      '설명',
      name: 'report_form_description_1',
      desc: '',
      args: [],
    );
  }

  /// `첨부파일`
  String get report_form_attachment {
    return Intl.message(
      '첨부파일',
      name: 'report_form_attachment',
      desc: '',
      args: [],
    );
  }

  /// `렌탈, 택시 실비 처리`
  String get report_form_deducted_1 {
    return Intl.message(
      '렌탈, 택시 실비 처리',
      name: 'report_form_deducted_1',
      desc: '',
      args: [],
    );
  }

  /// `일비 -10%`
  String get report_form_deducted_2 {
    return Intl.message(
      '일비 -10%',
      name: 'report_form_deducted_2',
      desc: '',
      args: [],
    );
  }

  /// `출장 명령서를 삭제하시겠습니까?`
  String get report_form_delete_dialog_1 {
    return Intl.message(
      '출장 명령서를 삭제하시겠습니까?',
      name: 'report_form_delete_dialog_1',
      desc: '',
      args: [],
    );
  }

  /// `출장 명령서를 삭제하면 모든 내용이 삭제됩니다.\n계속하시겠습니까?`
  String get report_form_delete_dialog_2 {
    return Intl.message(
      '출장 명령서를 삭제하면 모든 내용이 삭제됩니다.\n계속하시겠습니까?',
      name: 'report_form_delete_dialog_2',
      desc: '',
      args: [],
    );
  }

  /// `출장 명령서가 삭제되었습니다.`
  String get report_form_delete {
    return Intl.message(
      '출장 명령서가 삭제되었습니다.',
      name: 'report_form_delete',
      desc: '',
      args: [],
    );
  }

  /// `일정을 선택해 주세요`
  String get report_form_invalid_1 {
    return Intl.message(
      '일정을 선택해 주세요',
      name: 'report_form_invalid_1',
      desc: '',
      args: [],
    );
  }

  /// `{step} 금액을 빈 칸 없이 입력해 주세요`
  String report_form_invalid_2(Object step) {
    return Intl.message(
      '$step 금액을 빈 칸 없이 입력해 주세요',
      name: 'report_form_invalid_2',
      desc: '',
      args: [step],
    );
  }

  /// `{step} 일 수를 입력해 주세요`
  String report_form_invalid_3(Object step) {
    return Intl.message(
      '$step 일 수를 입력해 주세요',
      name: 'report_form_invalid_3',
      desc: '',
      args: [step],
    );
  }

  /// `모든 내용을 빠짐없이 입력해 주세요`
  String get report_form_invalid_4 {
    return Intl.message(
      '모든 내용을 빠짐없이 입력해 주세요',
      name: 'report_form_invalid_4',
      desc: '',
      args: [],
    );
  }

  /// `설명을 입력해 주세요`
  String get report_form_invalid_5 {
    return Intl.message(
      '설명을 입력해 주세요',
      name: 'report_form_invalid_5',
      desc: '',
      args: [],
    );
  }

  /// `전체 비용 합계`
  String get report_list_total_cost {
    return Intl.message(
      '전체 비용 합계',
      name: 'report_list_total_cost',
      desc: '',
      args: [],
    );
  }

  /// `(과세) 수령금액`
  String get report_list_taxable_amount {
    return Intl.message(
      '(과세) 수령금액',
      name: 'report_list_taxable_amount',
      desc: '',
      args: [],
    );
  }

  /// `(비과세) 수령금액`
  String get report_list_non_taxable_amount {
    return Intl.message(
      '(비과세) 수령금액',
      name: 'report_list_non_taxable_amount',
      desc: '',
      args: [],
    );
  }

  /// `근무 일정`
  String get work_segment_1 {
    return Intl.message('근무 일정', name: 'work_segment_1', desc: '', args: []);
  }

  /// `주간 업무 보고`
  String get work_segment_2 {
    return Intl.message('주간 업무 보고', name: 'work_segment_2', desc: '', args: []);
  }

  /// `사용자`
  String get operation_segment_1 {
    return Intl.message('사용자', name: 'operation_segment_1', desc: '', args: []);
  }

  /// `공급사`
  String get operation_segment_2 {
    return Intl.message('공급사', name: 'operation_segment_2', desc: '', args: []);
  }

  /// `이름`
  String get operation_user_column_1 {
    return Intl.message(
      '이름',
      name: 'operation_user_column_1',
      desc: '',
      args: [],
    );
  }

  /// `이메일`
  String get operation_user_column_2 {
    return Intl.message(
      '이메일',
      name: 'operation_user_column_2',
      desc: '',
      args: [],
    );
  }

  /// `직급`
  String get operation_user_column_3 {
    return Intl.message(
      '직급',
      name: 'operation_user_column_3',
      desc: '',
      args: [],
    );
  }

  /// `부서`
  String get operation_user_column_4 {
    return Intl.message(
      '부서',
      name: 'operation_user_column_4',
      desc: '',
      args: [],
    );
  }

  /// `관리자`
  String get operation_user_column_5 {
    return Intl.message(
      '관리자',
      name: 'operation_user_column_5',
      desc: '',
      args: [],
    );
  }

  /// `사용 승인`
  String get operation_user_column_6 {
    return Intl.message(
      '사용 승인',
      name: 'operation_user_column_6',
      desc: '',
      args: [],
    );
  }

  /// `작업`
  String get operation_user_column_7 {
    return Intl.message(
      '작업',
      name: 'operation_user_column_7',
      desc: '',
      args: [],
    );
  }

  /// `관리자 권한을 변경하시겠습니까?`
  String get operation_user_admin_dialog_1 {
    return Intl.message(
      '관리자 권한을 변경하시겠습니까?',
      name: 'operation_user_admin_dialog_1',
      desc: '',
      args: [],
    );
  }

  /// `최고 관리자 권한을 부여하거나 해제합니다.\n계속하시겠습니까?`
  String get operation_user_admin_dialog_2 {
    return Intl.message(
      '최고 관리자 권한을 부여하거나 해제합니다.\n계속하시겠습니까?',
      name: 'operation_user_admin_dialog_2',
      desc: '',
      args: [],
    );
  }

  /// `로그인 사용 승인을 변경하시겠습니까?`
  String get operation_user_approve_dialog_1 {
    return Intl.message(
      '로그인 사용 승인을 변경하시겠습니까?',
      name: 'operation_user_approve_dialog_1',
      desc: '',
      args: [],
    );
  }

  /// `비활성화 시 이 계정의 시스템 접속이 즉시 차단됩니다.\n계속하시겠습니까?`
  String get operation_user_approve_dialog_2 {
    return Intl.message(
      '비활성화 시 이 계정의 시스템 접속이 즉시 차단됩니다.\n계속하시겠습니까?',
      name: 'operation_user_approve_dialog_2',
      desc: '',
      args: [],
    );
  }

  /// `사용자를 삭제하시겠습니까?`
  String get operation_user_delete_dialog_1 {
    return Intl.message(
      '사용자를 삭제하시겠습니까?',
      name: 'operation_user_delete_dialog_1',
      desc: '',
      args: [],
    );
  }

  /// `사용자를 삭제하면 다시 복구할 수 없습니다.`
  String get operation_user_delete_dialog_2 {
    return Intl.message(
      '사용자를 삭제하면 다시 복구할 수 없습니다.',
      name: 'operation_user_delete_dialog_2',
      desc: '',
      args: [],
    );
  }

  /// `사용자 정보가 정상적으로 변경되었습니다.`
  String get operation_user_success {
    return Intl.message(
      '사용자 정보가 정상적으로 변경되었습니다.',
      name: 'operation_user_success',
      desc: '',
      args: [],
    );
  }

  /// `사용자가 삭제되었습니다.`
  String get operation_user_delete {
    return Intl.message(
      '사용자가 삭제되었습니다.',
      name: 'operation_user_delete',
      desc: '',
      args: [],
    );
  }

  /// `이름`
  String get operation_supplier_column_1 {
    return Intl.message(
      '이름',
      name: 'operation_supplier_column_1',
      desc: '',
      args: [],
    );
  }

  /// `사업자등록번호`
  String get operation_supplier_column_2 {
    return Intl.message(
      '사업자등록번호',
      name: 'operation_supplier_column_2',
      desc: '',
      args: [],
    );
  }

  /// `주소`
  String get operation_supplier_column_3 {
    return Intl.message(
      '주소',
      name: 'operation_supplier_column_3',
      desc: '',
      args: [],
    );
  }

  /// `전화번호`
  String get operation_supplier_column_4 {
    return Intl.message(
      '전화번호',
      name: 'operation_supplier_column_4',
      desc: '',
      args: [],
    );
  }

  /// `내 정보`
  String get setting_segment_1 {
    return Intl.message('내 정보', name: 'setting_segment_1', desc: '', args: []);
  }

  /// `데이터`
  String get setting_segment_2 {
    return Intl.message('데이터', name: 'setting_segment_2', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ko', countryCode: 'KR'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
