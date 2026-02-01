// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ko_KR locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ko_KR';

  static String m0(seconds) => "${seconds}초 후 재시도 가능";

  static String m1(file) => "${file} 파일은 올바른 현대/기아 견적서 양식이 아닙니다.";

  static String m2(file, limit) => "${file} 파일은 크기 제한을 초과했습니다. (최대 ${limit}MB)";

  static String m3(file) => "${file} 파일은 유효한 이미지 파일이 아닙니다.";

  static String m4(file) => "${file} 파일은 올바른 구매 요청서 양식이 아닙니다.";

  static String m5(days) => "${days}일 전";

  static String m6(hours) => "${hours}시간 전";

  static String m7(minutes) => "${minutes}분 전";

  static String m8(month) => "${month}달 전";

  static String m9(weeks) => "${weeks}주 전";

  static String m10(years) => "${years}년 전";

  static String m11(step) => "${step} 금액을 빈 칸 없이 입력해 주세요";

  static String m12(step) => "${step} 일 수를 입력해 주세요";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "bad_certificate": MessageLookupByLibrary.simpleMessage(
            "보안 인증서가 유효하지 않습니다. 서버를 확인하세요."),
        "bad_request": MessageLookupByLibrary.simpleMessage("잘못된 요청입니다."),
        "bad_response": MessageLookupByLibrary.simpleMessage(
            "서버에서 잘못된 응답을 받았습니다. 다시 시도하세요."),
        "bookmark_exists":
            MessageLookupByLibrary.simpleMessage("이미 북마크한 프로젝트입니다."),
        "bookmark_not_found":
            MessageLookupByLibrary.simpleMessage("북마크를 찾을 수 없습니다."),
        "common_apply": MessageLookupByLibrary.simpleMessage("적용"),
        "common_bookmark": MessageLookupByLibrary.simpleMessage("북마크"),
        "common_cancel": MessageLookupByLibrary.simpleMessage("취소"),
        "common_close": MessageLookupByLibrary.simpleMessage("닫기"),
        "common_copied":
            MessageLookupByLibrary.simpleMessage("클립보드에 내용을 복사했습니다."),
        "common_created_at": MessageLookupByLibrary.simpleMessage("생성"),
        "common_delete": MessageLookupByLibrary.simpleMessage("삭제하기"),
        "common_download_1":
            MessageLookupByLibrary.simpleMessage("다운로드가 진행 중입니다."),
        "common_download_2":
            MessageLookupByLibrary.simpleMessage("다운로드가 완료되면 창이 자동으로 닫힙니다."),
        "common_download_3": MessageLookupByLibrary.simpleMessage(
            "다운로드가 시작되지 않으면 아래 버튼을 눌러주세요."),
        "common_download_4": MessageLookupByLibrary.simpleMessage("다운로드"),
        "common_edit": MessageLookupByLibrary.simpleMessage("수정하기"),
        "common_edit_by": MessageLookupByLibrary.simpleMessage("최종 편집"),
        "common_fold": MessageLookupByLibrary.simpleMessage("닫기"),
        "common_forward": MessageLookupByLibrary.simpleMessage("포워딩"),
        "common_leave": MessageLookupByLibrary.simpleMessage("나가기"),
        "common_link_copied":
            MessageLookupByLibrary.simpleMessage("클립보드에 링크를 복사했습니다."),
        "common_next": MessageLookupByLibrary.simpleMessage("다음"),
        "common_ok": MessageLookupByLibrary.simpleMessage("확인"),
        "common_open": MessageLookupByLibrary.simpleMessage("열기"),
        "common_post": MessageLookupByLibrary.simpleMessage("등록하기"),
        "common_print": MessageLookupByLibrary.simpleMessage("출력하기"),
        "common_share": MessageLookupByLibrary.simpleMessage("공유"),
        "common_stay": MessageLookupByLibrary.simpleMessage("머무르기"),
        "common_unfold": MessageLookupByLibrary.simpleMessage("펼쳐보기"),
        "common_updated_at": MessageLookupByLibrary.simpleMessage("수정"),
        "connection_error":
            MessageLookupByLibrary.simpleMessage("연결 오류가 발생했습니다. 네트워크를 확인하세요."),
        "connection_timeout": MessageLookupByLibrary.simpleMessage(
            "연결 시간이 초과되었습니다. 나중에 다시 시도하세요."),
        "contract_issue_exists":
            MessageLookupByLibrary.simpleMessage("이미 생성된 계약 및 수주 업무가 있습니다."),
        "dashboard": MessageLookupByLibrary.simpleMessage("대시보드"),
        "dashboard_functions_1":
            MessageLookupByLibrary.simpleMessage("근무 일정 등록"),
        "dashboard_functions_2":
            MessageLookupByLibrary.simpleMessage("새 프로젝트 등록"),
        "dashboard_latest_update":
            MessageLookupByLibrary.simpleMessage("최근 업데이트"),
        "dashboard_latest_update_1":
            MessageLookupByLibrary.simpleMessage("프로젝트 코드"),
        "dashboard_latest_update_2":
            MessageLookupByLibrary.simpleMessage("프로젝트 이름"),
        "dashboard_no_issue":
            MessageLookupByLibrary.simpleMessage("업데이트 내역이 없습니다"),
        "dashboard_no_schedule":
            MessageLookupByLibrary.simpleMessage("일정이 없습니다"),
        "dashboard_no_summary": MessageLookupByLibrary.simpleMessage("(제목 없음)"),
        "dashboard_project_stats":
            MessageLookupByLibrary.simpleMessage("프로젝트 현황"),
        "dashboard_project_stats_1": MessageLookupByLibrary.simpleMessage("이름"),
        "dashboard_project_stats_2": MessageLookupByLibrary.simpleMessage("종결"),
        "dashboard_project_stats_3": MessageLookupByLibrary.simpleMessage("전체"),
        "dashboard_schedule": MessageLookupByLibrary.simpleMessage("일정"),
        "dashboard_schedule_all_day":
            MessageLookupByLibrary.simpleMessage("하루 종일"),
        "dashboard_schedule_domestic":
            MessageLookupByLibrary.simpleMessage("국내 출장"),
        "dashboard_schedule_overseas":
            MessageLookupByLibrary.simpleMessage("해외 출장"),
        "dashboard_schedule_participants":
            MessageLookupByLibrary.simpleMessage("인원"),
        "dashboard_schedule_vacation":
            MessageLookupByLibrary.simpleMessage("휴가"),
        "dashboard_summary_1": MessageLookupByLibrary.simpleMessage("전체 프로젝트"),
        "dashboard_summary_2": MessageLookupByLibrary.simpleMessage("종결된 프로젝트"),
        "dashboard_summary_3": MessageLookupByLibrary.simpleMessage("킥어프"),
        "dashboard_summary_4": MessageLookupByLibrary.simpleMessage("실무 진행 중"),
        "dashboard_world_map_1":
            MessageLookupByLibrary.simpleMessage("함께하는 지점"),
        "dashboard_world_map_1_1": MessageLookupByLibrary.simpleMessage("개 지점"),
        "dashboard_world_map_2":
            MessageLookupByLibrary.simpleMessage("함께하는 공장"),
        "dashboard_world_map_2_1": MessageLookupByLibrary.simpleMessage("개 공장"),
        "date_range_title": MessageLookupByLibrary.simpleMessage("날짜 범위 선택"),
        "date_title": MessageLookupByLibrary.simpleMessage("날짜 선택"),
        "document": MessageLookupByLibrary.simpleMessage("문서"),
        "error_clipboard_image_paste":
            MessageLookupByLibrary.simpleMessage("이미지 붙여넣기에 실패했습니다."),
        "error_detail": MessageLookupByLibrary.simpleMessage("자세히 보기"),
        "error_dialog_1": MessageLookupByLibrary.simpleMessage("에러 상세보기"),
        "error_dialog_2": MessageLookupByLibrary.simpleMessage("클립보드에 복사"),
        "error_title": MessageLookupByLibrary.simpleMessage("문제가 발생했습니다"),
        "error_unexpected":
            MessageLookupByLibrary.simpleMessage("예상치 못한 오류가 발생했습니다."),
        "exchange_not_found": MessageLookupByLibrary.simpleMessage(
            "환율 정보를 찾을 수 없습니다. 영업일 또는 당일 11시 이후에 다시 요청하세요."),
        "file_not_found":
            MessageLookupByLibrary.simpleMessage("파일을 찾을 수 없습니다."),
        "filter_applied": MessageLookupByLibrary.simpleMessage("적용중"),
        "filter_ascending": MessageLookupByLibrary.simpleMessage("오름차순"),
        "filter_descending": MessageLookupByLibrary.simpleMessage("내림차순"),
        "filter_order": MessageLookupByLibrary.simpleMessage("순서"),
        "filter_order_1": MessageLookupByLibrary.simpleMessage("정렬 방향"),
        "filter_select_all": MessageLookupByLibrary.simpleMessage("모두 선택"),
        "filter_sort": MessageLookupByLibrary.simpleMessage("정렬"),
        "filter_sort_1": MessageLookupByLibrary.simpleMessage("정렬 기준"),
        "filter_suffix": MessageLookupByLibrary.simpleMessage("선택됨"),
        "filter_unselect_all": MessageLookupByLibrary.simpleMessage("모두 선택 해제"),
        "forgot_password_button": MessageLookupByLibrary.simpleMessage("요청하기"),
        "forgot_password_delay": m0,
        "forgot_password_email": MessageLookupByLibrary.simpleMessage("이메일"),
        "forgot_password_headline":
            MessageLookupByLibrary.simpleMessage("비밀번호 재설정하기"),
        "forgot_password_requested": MessageLookupByLibrary.simpleMessage(
            "비밀번호 재설정 이메일이 성공적으로 발송되었습니다."),
        "forgot_password_title": MessageLookupByLibrary.simpleMessage(
            "이메일 주소를 입력하면, 비밀번호를 재설정 메일을 보내드립니다."),
        "highlight_color": MessageLookupByLibrary.simpleMessage("배경 색상"),
        "hyundai": MessageLookupByLibrary.simpleMessage("현대자동차"),
        "issue_edit": MessageLookupByLibrary.simpleMessage("업무 수정"),
        "issue_form_attachment": MessageLookupByLibrary.simpleMessage("첨부파일"),
        "issue_form_attachment_drop":
            MessageLookupByLibrary.simpleMessage("파일을 여기에 놓기"),
        "issue_form_attachment_upload":
            MessageLookupByLibrary.simpleMessage("파일 선택"),
        "issue_form_camera_1":
            MessageLookupByLibrary.simpleMessage("카메라를 찾을 수 없습니다"),
        "issue_form_camera_2": MessageLookupByLibrary.simpleMessage(
            "시스템 설정을 확인하여 카메라가 사용 가능한지 확인하세요. 사용 가능한 카메라가 없다면, 카메라를 연결하세요. 그런 다음 브라우저를 다시 시작해야 할 수도 있습니다."),
        "issue_form_camera_3":
            MessageLookupByLibrary.simpleMessage("크롬에서 카메라 사용하기"),
        "issue_form_camera_4": MessageLookupByLibrary.simpleMessage("사진 사용"),
        "issue_form_content": MessageLookupByLibrary.simpleMessage("본문"),
        "issue_form_contract_1": MessageLookupByLibrary.simpleMessage("견적 품목"),
        "issue_form_contract_2":
            MessageLookupByLibrary.simpleMessage("현대/기아 견적서만 업로드 가능합니다"),
        "issue_form_contract_3": MessageLookupByLibrary.simpleMessage("계약 내역"),
        "issue_form_contract_4": MessageLookupByLibrary.simpleMessage("금액 (원)"),
        "issue_form_contract_5": MessageLookupByLibrary.simpleMessage("품목 추가"),
        "issue_form_contract_8": MessageLookupByLibrary.simpleMessage("수주 금액"),
        "issue_form_contract_drop":
            MessageLookupByLibrary.simpleMessage("견적서 여기에 놓기"),
        "issue_form_contract_format_invalid": m1,
        "issue_form_contract_invalid": MessageLookupByLibrary.simpleMessage(
            "견적서 파일은 엑셀(.xlsx) 파일만 업로드 할 수 있습니다."),
        "issue_form_contract_item_invalid_1":
            MessageLookupByLibrary.simpleMessage("견적 품목을 입력하거나, 견적서를 업로드해 주세요"),
        "issue_form_contract_item_invalid_2":
            MessageLookupByLibrary.simpleMessage("견적 품목을 빈 칸 없이 입력해 주세요"),
        "issue_form_contract_too_many": MessageLookupByLibrary.simpleMessage(
            "견적서는 하나만 업로드할 수 있습니다. 여러 파일을 업로드하면 마지막 파일이 적용됩니다."),
        "issue_form_contract_upload":
            MessageLookupByLibrary.simpleMessage("견적서 선택"),
        "issue_form_delete":
            MessageLookupByLibrary.simpleMessage("업무가 삭제되었습니다."),
        "issue_form_delete_dialog_1":
            MessageLookupByLibrary.simpleMessage("업무를 삭제하시겠습니까?"),
        "issue_form_delete_dialog_2": MessageLookupByLibrary.simpleMessage(
            "업무를 삭제하면 모든 내용과 첨부 파일이 함께 삭제됩니다.\n계속하시겠습니까?"),
        "issue_form_file_size_limit": m2,
        "issue_form_image_1": MessageLookupByLibrary.simpleMessage("새 이미지 업로드"),
        "issue_form_image_2": MessageLookupByLibrary.simpleMessage("이미지 선택"),
        "issue_form_image_dialog_1":
            MessageLookupByLibrary.simpleMessage("사진 가져오기"),
        "issue_form_image_dialog_2":
            MessageLookupByLibrary.simpleMessage("카메라로 촬영하기"),
        "issue_form_image_drop":
            MessageLookupByLibrary.simpleMessage("이미지를 여기에 놓기"),
        "issue_form_image_invalid": m3,
        "issue_form_image_upload":
            MessageLookupByLibrary.simpleMessage("이미지 선택"),
        "issue_form_invalid_1":
            MessageLookupByLibrary.simpleMessage("내용을 입력해 주세요"),
        "issue_form_kickoff_1":
            MessageLookupByLibrary.simpleMessage("프로젝트 착수일"),
        "issue_form_kickoff_2": MessageLookupByLibrary.simpleMessage("착수일 선택"),
        "issue_form_kickoff_invalid":
            MessageLookupByLibrary.simpleMessage("착수일을 선택해 주세요"),
        "issue_form_link_1": MessageLookupByLibrary.simpleMessage("URL"),
        "issue_form_link_2": MessageLookupByLibrary.simpleMessage("링크 제목"),
        "issue_form_link_3": MessageLookupByLibrary.simpleMessage("웹 페이지 링크"),
        "issue_form_procurement_1":
            MessageLookupByLibrary.simpleMessage("구매 품목"),
        "issue_form_procurement_10":
            MessageLookupByLibrary.simpleMessage("공급처 선택"),
        "issue_form_procurement_11":
            MessageLookupByLibrary.simpleMessage("품목 추가"),
        "issue_form_procurement_12":
            MessageLookupByLibrary.simpleMessage("기업명으로 검색"),
        "issue_form_procurement_13":
            MessageLookupByLibrary.simpleMessage("등록할 공급처의 기업명을 입력해 주세요"),
        "issue_form_procurement_14":
            MessageLookupByLibrary.simpleMessage("기업을 찾을 수 없습니다"),
        "issue_form_procurement_15":
            MessageLookupByLibrary.simpleMessage("품목 합계"),
        "issue_form_procurement_16":
            MessageLookupByLibrary.simpleMessage("검색 중⋯"),
        "issue_form_procurement_2":
            MessageLookupByLibrary.simpleMessage("품목 내역"),
        "issue_form_procurement_3": MessageLookupByLibrary.simpleMessage("사양"),
        "issue_form_procurement_4": MessageLookupByLibrary.simpleMessage("수량"),
        "issue_form_procurement_5": MessageLookupByLibrary.simpleMessage("단가"),
        "issue_form_procurement_6":
            MessageLookupByLibrary.simpleMessage("품목 금액"),
        "issue_form_procurement_7":
            MessageLookupByLibrary.simpleMessage("온라인 구매"),
        "issue_form_procurement_8":
            MessageLookupByLibrary.simpleMessage("구매 링크"),
        "issue_form_procurement_9": MessageLookupByLibrary.simpleMessage("공급처"),
        "issue_form_procurement_drop":
            MessageLookupByLibrary.simpleMessage("구매 요청서 여기에 놓기"),
        "issue_form_procurement_format_invalid": m4,
        "issue_form_procurement_invalid": MessageLookupByLibrary.simpleMessage(
            "구매 요청서 파일은 엑셀(.xlsx) 파일만 업로드 할 수 있습니다."),
        "issue_form_procurement_item_invalid_1":
            MessageLookupByLibrary.simpleMessage("구매 품목을 입력하거나, 견적서를 업로드해 주세요"),
        "issue_form_procurement_item_invalid_2":
            MessageLookupByLibrary.simpleMessage("구매 품목을 빈 칸 없이 입력해 주세요"),
        "issue_form_procurement_too_many": MessageLookupByLibrary.simpleMessage(
            "구매 요청서는 하나만 업로드할 수 있습니다. 여러 파일을 업로드하면 마지막 파일이 적용됩니다."),
        "issue_form_procurement_upload":
            MessageLookupByLibrary.simpleMessage("구매 요청서 선택"),
        "issue_form_transaction_1":
            MessageLookupByLibrary.simpleMessage("청구 목록"),
        "issue_form_transaction_2":
            MessageLookupByLibrary.simpleMessage("목록 추가"),
        "issue_form_transaction_3":
            MessageLookupByLibrary.simpleMessage("지급 단계"),
        "issue_form_transaction_4":
            MessageLookupByLibrary.simpleMessage("비율 (%)"),
        "issue_form_transaction_5": MessageLookupByLibrary.simpleMessage("금액"),
        "issue_form_transaction_6":
            MessageLookupByLibrary.simpleMessage("지급 여부"),
        "issue_form_transaction_7": MessageLookupByLibrary.simpleMessage("비고"),
        "issue_form_transaction_item_empty_1":
            MessageLookupByLibrary.simpleMessage(
                "청구 목록은 계약 및 수주 업무에서 생성 가능합니다"),
        "issue_form_transaction_item_empty_2":
            MessageLookupByLibrary.simpleMessage("계약 및 수주 업무로 이동 >"),
        "issue_form_transaction_item_invalid_1":
            MessageLookupByLibrary.simpleMessage("청구 내역을 최소 하나 이상 입력해 주세요"),
        "issue_form_transaction_item_invalid_2":
            MessageLookupByLibrary.simpleMessage("청구 내역을 빈 칸 없이 입력해 주세요"),
        "issue_form_transaction_item_invalid_3":
            MessageLookupByLibrary.simpleMessage(
                "모든 청구 내역 비율을 합산하여 100%가 되도록 입력해 주세요"),
        "issue_new": MessageLookupByLibrary.simpleMessage("업무 등록"),
        "issue_new_choose": MessageLookupByLibrary.simpleMessage("업무 종류 선택"),
        "issue_new_choose_1": MessageLookupByLibrary.simpleMessage("✍️ "),
        "issue_new_choose_1_1": MessageLookupByLibrary.simpleMessage("계약 및 수주"),
        "issue_new_choose_1_2":
            MessageLookupByLibrary.simpleMessage("계약 조건과 품목·금액을 기록"),
        "issue_new_choose_2": MessageLookupByLibrary.simpleMessage("⚽ "),
        "issue_new_choose_2_1": MessageLookupByLibrary.simpleMessage("킥어프"),
        "issue_new_choose_2_2":
            MessageLookupByLibrary.simpleMessage("프로젝트 시작 일정과 목표를 공유"),
        "issue_new_choose_3": MessageLookupByLibrary.simpleMessage("☑️ "),
        "issue_new_choose_3_1": MessageLookupByLibrary.simpleMessage("사양 승인"),
        "issue_new_choose_3_2":
            MessageLookupByLibrary.simpleMessage("확정된 제품·서비스 사양을 기록"),
        "issue_new_choose_4": MessageLookupByLibrary.simpleMessage("🛒 "),
        "issue_new_choose_4_1": MessageLookupByLibrary.simpleMessage("구매 조달"),
        "issue_new_choose_4_2":
            MessageLookupByLibrary.simpleMessage("필요 자재·서비스의 상세 정보와 금액을 기록"),
        "issue_new_choose_5": MessageLookupByLibrary.simpleMessage("🧾 "),
        "issue_new_choose_5_1":
            MessageLookupByLibrary.simpleMessage("거래 명세 / 인보이스"),
        "issue_new_choose_5_2":
            MessageLookupByLibrary.simpleMessage("계약금·중도금·잔금 내역 관리"),
        "issue_new_choose_6": MessageLookupByLibrary.simpleMessage("🏦 "),
        "issue_new_choose_6_1": MessageLookupByLibrary.simpleMessage("지급 청구"),
        "issue_new_choose_6_2":
            MessageLookupByLibrary.simpleMessage("지급 요청 내용과 보고서를 제출"),
        "issue_new_choose_7": MessageLookupByLibrary.simpleMessage("프로젝트 종결"),
        "issue_new_choose_7_1":
            MessageLookupByLibrary.simpleMessage("모든 지급 및 회계 완료 처리"),
        "issue_new_choose_7_2": MessageLookupByLibrary.simpleMessage(
            "프로젝트 종결 처리는 영구적이며 되돌릴 수 없습니다."),
        "issue_new_choose_7_3": MessageLookupByLibrary.simpleMessage(
            "이후 실무 결과 등록을 제외한 모든 기능이 제한됩니다."),
        "issue_new_choose_7_4":
            MessageLookupByLibrary.simpleMessage("이 작업을 수행하면 다음이 비활성화됩니다."),
        "issue_new_choose_7_5":
            MessageLookupByLibrary.simpleMessage(" ◦ 신규 업무 등록"),
        "issue_new_choose_7_6":
            MessageLookupByLibrary.simpleMessage(" ◦ 기존 업무 수정 및 삭제"),
        "issue_new_choose_7_7":
            MessageLookupByLibrary.simpleMessage("종결 후, 공유할 내용을 입력하세요."),
        "issue_new_choose_7_8":
            MessageLookupByLibrary.simpleMessage("이 프로젝트를 종결하겠습니다"),
        "issue_not_found":
            MessageLookupByLibrary.simpleMessage("업무를 찾을 수 없습니다."),
        "kia": MessageLookupByLibrary.simpleMessage("기아"),
        "kickoff_issue_exists":
            MessageLookupByLibrary.simpleMessage("이미 생성된 킥어프 업무가 있습니다."),
        "lab_and_other": MessageLookupByLibrary.simpleMessage("연구소 및 기타"),
        "login_button": MessageLookupByLibrary.simpleMessage("로그인"),
        "login_create_account_1":
            MessageLookupByLibrary.simpleMessage("계정이 없으신가요?"),
        "login_create_account_2":
            MessageLookupByLibrary.simpleMessage("계정 만들기"),
        "login_email": MessageLookupByLibrary.simpleMessage("이메일"),
        "login_forbidden_1":
            MessageLookupByLibrary.simpleMessage("로그인 할 수 없습니다"),
        "login_forbidden_2": MessageLookupByLibrary.simpleMessage(
            "관리자의 승인을 받지 않은 계정입니다.\n추가 도움이 필요하시면 관리자에게 문의해 주세요."),
        "login_forgot": MessageLookupByLibrary.simpleMessage("비밀번호를 잊으셨나요?"),
        "login_headline": MessageLookupByLibrary.simpleMessage("로그인"),
        "login_invalid":
            MessageLookupByLibrary.simpleMessage("이메일 또는 비밀번호가 일치하지 않습니다"),
        "login_password": MessageLookupByLibrary.simpleMessage("비밀번호"),
        "login_persist": MessageLookupByLibrary.simpleMessage("자동 로그인"),
        "login_request_1": MessageLookupByLibrary.simpleMessage("요청이 전송되었습니다"),
        "login_request_2": MessageLookupByLibrary.simpleMessage(
            "관리자의 인증 후, 계정을 사용할 수 있습니다.\n추가 도움이 필요하시면 관리자에게 문의해 주세요."),
        "login_title":
            MessageLookupByLibrary.simpleMessage("이메일과 비밀번호를 입력해주세요"),
        "logout": MessageLookupByLibrary.simpleMessage("로그아웃"),
        "navigation_item_1": MessageLookupByLibrary.simpleMessage("대시보드"),
        "navigation_item_2": MessageLookupByLibrary.simpleMessage("프로젝트"),
        "navigation_item_3": MessageLookupByLibrary.simpleMessage("업무"),
        "navigation_item_4": MessageLookupByLibrary.simpleMessage("문서"),
        "navigation_item_5": MessageLookupByLibrary.simpleMessage("통계"),
        "navigation_item_6": MessageLookupByLibrary.simpleMessage("설정"),
        "navigation_search": MessageLookupByLibrary.simpleMessage("검색"),
        "navigation_search_keyword":
            MessageLookupByLibrary.simpleMessage("최근 검색어"),
        "navigation_search_keyword_empty":
            MessageLookupByLibrary.simpleMessage("최근 검색어가 없습니다"),
        "navigation_search_keyword_erase":
            MessageLookupByLibrary.simpleMessage("모두 지우기"),
        "navigation_search_title":
            MessageLookupByLibrary.simpleMessage("Taskflow에서 검색"),
        "navigation_title_1":
            MessageLookupByLibrary.simpleMessage("WORKSPACES"),
        "navigation_title_2":
            MessageLookupByLibrary.simpleMessage("ANALYTICIS"),
        "navigation_title_3": MessageLookupByLibrary.simpleMessage("OTHER"),
        "no_permission":
            MessageLookupByLibrary.simpleMessage("이 페이지에 접근할 권한이 없습니다."),
        "payment_issue_exists":
            MessageLookupByLibrary.simpleMessage("이미 생성된 지급 청구 업무가 있습니다."),
        "pop_scope_content": MessageLookupByLibrary.simpleMessage(
            "작성 중인 내용이 저장되지 않고 모두 사라집니다.\n계속하시겠습니까?"),
        "pop_scope_title": MessageLookupByLibrary.simpleMessage("페이지를 나가시겠어요?"),
        "project": MessageLookupByLibrary.simpleMessage("프로젝트"),
        "project_closed": MessageLookupByLibrary.simpleMessage("종결"),
        "project_column_1": MessageLookupByLibrary.simpleMessage("고객사"),
        "project_column_2": MessageLookupByLibrary.simpleMessage("프로젝트 코드"),
        "project_column_3": MessageLookupByLibrary.simpleMessage("프로젝트 이름"),
        "project_column_4": MessageLookupByLibrary.simpleMessage("카테고리"),
        "project_column_5": MessageLookupByLibrary.simpleMessage("PM"),
        "project_column_6": MessageLookupByLibrary.simpleMessage("등록일"),
        "project_column_7": MessageLookupByLibrary.simpleMessage("작업"),
        "project_detail": MessageLookupByLibrary.simpleMessage("프로젝트 상세"),
        "project_detail_client": MessageLookupByLibrary.simpleMessage("고객사"),
        "project_detail_closed_1":
            MessageLookupByLibrary.simpleMessage("종결된 프로젝트입니다."),
        "project_detail_closed_2": MessageLookupByLibrary.simpleMessage(
            "출장 명령서 등록을 제외한 모든 기능이 제한됩니다."),
        "project_detail_kickoff": MessageLookupByLibrary.simpleMessage("착수일"),
        "project_detail_no_approvals":
            MessageLookupByLibrary.simpleMessage("작성된 사양 승인 내역이 없습니다"),
        "project_detail_no_contracts":
            MessageLookupByLibrary.simpleMessage("작성된 계약 내역이 없습니다"),
        "project_detail_no_procurements":
            MessageLookupByLibrary.simpleMessage("작성된 구매 내역이 없습니다"),
        "project_detail_no_report":
            MessageLookupByLibrary.simpleMessage("작성된 실무 결과가 없습니다"),
        "project_detail_pm": MessageLookupByLibrary.simpleMessage("PM"),
        "project_detail_pm_empty":
            MessageLookupByLibrary.simpleMessage("PM 지정"),
        "project_detail_segment_1": MessageLookupByLibrary.simpleMessage("계약"),
        "project_detail_segment_2":
            MessageLookupByLibrary.simpleMessage("사양 승인"),
        "project_detail_segment_3": MessageLookupByLibrary.simpleMessage("구매"),
        "project_detail_segment_4": MessageLookupByLibrary.simpleMessage("실무"),
        "project_detail_segment_5":
            MessageLookupByLibrary.simpleMessage("타임라인"),
        "project_detail_status": MessageLookupByLibrary.simpleMessage("상태"),
        "project_detail_summary":
            MessageLookupByLibrary.simpleMessage("프로젝트 요약"),
        "project_detail_summary_1": MessageLookupByLibrary.simpleMessage("작성자"),
        "project_detail_summary_2":
            MessageLookupByLibrary.simpleMessage("종결 사유 안내"),
        "project_edit": MessageLookupByLibrary.simpleMessage("프로젝트 수정"),
        "project_exists": MessageLookupByLibrary.simpleMessage(
            "이미 사용 중인 프로젝트 코드입니다. 다른 코드를 입력해 주세요."),
        "project_filter_1": MessageLookupByLibrary.simpleMessage("고객사"),
        "project_filter_1_1": MessageLookupByLibrary.simpleMessage("고객사 선택"),
        "project_filter_2": MessageLookupByLibrary.simpleMessage("지점"),
        "project_filter_2_1": MessageLookupByLibrary.simpleMessage("지점 선택"),
        "project_filter_3": MessageLookupByLibrary.simpleMessage("공장"),
        "project_filter_3_1": MessageLookupByLibrary.simpleMessage("공장 선택"),
        "project_filter_4": MessageLookupByLibrary.simpleMessage("카테고리"),
        "project_filter_4_1": MessageLookupByLibrary.simpleMessage("카테고리 선택"),
        "project_filter_5": MessageLookupByLibrary.simpleMessage("필터"),
        "project_filter_5_1": MessageLookupByLibrary.simpleMessage("필터 선택"),
        "project_form_clients": MessageLookupByLibrary.simpleMessage("고객사"),
        "project_form_clients_select":
            MessageLookupByLibrary.simpleMessage("고객사 선택"),
        "project_form_code": MessageLookupByLibrary.simpleMessage("프로젝트 코드"),
        "project_form_code_random":
            MessageLookupByLibrary.simpleMessage("임시 코드"),
        "project_form_delete":
            MessageLookupByLibrary.simpleMessage("프로젝트가 삭제되었습니다."),
        "project_form_delete_dialog_1":
            MessageLookupByLibrary.simpleMessage("프로젝트를 삭제하시겠습니까?"),
        "project_form_delete_dialog_2": MessageLookupByLibrary.simpleMessage(
            "프로젝트를 삭제하면 모든 내용과 업무가 함께 삭제됩니다.\n계속하시겠습니까?"),
        "project_form_invalid_1":
            MessageLookupByLibrary.simpleMessage("고객사를 선택해 주세요"),
        "project_form_invalid_2":
            MessageLookupByLibrary.simpleMessage("프로젝트 코드를 입력해 주세요"),
        "project_form_invalid_3":
            MessageLookupByLibrary.simpleMessage("프로젝트 이름이 입력해 주세요"),
        "project_form_name": MessageLookupByLibrary.simpleMessage("프로젝트 이름"),
        "project_form_optional": MessageLookupByLibrary.simpleMessage("선택항목"),
        "project_form_preexecuted": MessageLookupByLibrary.simpleMessage("선진행"),
        "project_form_preexecuted_info": MessageLookupByLibrary.simpleMessage(
            "선진행이란, 계약이나 발주가 확정되기 전에\n프로젝트를 미리 착수하는 것을 의미합니다."),
        "project_form_user": MessageLookupByLibrary.simpleMessage("PM"),
        "project_form_user_department_all":
            MessageLookupByLibrary.simpleMessage("전체"),
        "project_form_user_empty":
            MessageLookupByLibrary.simpleMessage("사용자가 없습니다"),
        "project_form_user_position":
            MessageLookupByLibrary.simpleMessage("직급"),
        "project_form_user_search":
            MessageLookupByLibrary.simpleMessage("사용자 검색"),
        "project_in_progress": MessageLookupByLibrary.simpleMessage("진행 중"),
        "project_issue_mail": MessageLookupByLibrary.simpleMessage("업무 내용 공유"),
        "project_mail_select_1":
            MessageLookupByLibrary.simpleMessage("메일을 보낼 사용자를 선택해 주세요."),
        "project_mail_select_2": MessageLookupByLibrary.simpleMessage("전체 선택"),
        "project_mail_send":
            MessageLookupByLibrary.simpleMessage("메일이 전송되었습니다"),
        "project_mail_send_fail":
            MessageLookupByLibrary.simpleMessage("메일 전송이 실패했습니다"),
        "project_new": MessageLookupByLibrary.simpleMessage("프로젝트 등록"),
        "project_no_item":
            MessageLookupByLibrary.simpleMessage("프로젝트를 찾을 수 없습니다"),
        "project_not_found":
            MessageLookupByLibrary.simpleMessage("프로젝트를 찾을 수 없습니다."),
        "project_preexecuted": MessageLookupByLibrary.simpleMessage("선진행"),
        "project_report_mail": MessageLookupByLibrary.simpleMessage("실무 결과 공유"),
        "project_search": MessageLookupByLibrary.simpleMessage("프로젝트 검색"),
        "project_segment_1": MessageLookupByLibrary.simpleMessage("전체"),
        "project_segment_2": MessageLookupByLibrary.simpleMessage("선진행"),
        "project_segment_3": MessageLookupByLibrary.simpleMessage("진행 중"),
        "project_segment_4": MessageLookupByLibrary.simpleMessage("종결"),
        "project_sort_1": MessageLookupByLibrary.simpleMessage("수정일"),
        "project_sort_2": MessageLookupByLibrary.simpleMessage("등록일"),
        "project_sort_3": MessageLookupByLibrary.simpleMessage("프로젝트 코드"),
        "project_sort_4": MessageLookupByLibrary.simpleMessage("프로젝트 이름"),
        "receive_timeout": MessageLookupByLibrary.simpleMessage(
            "서버 응답 시간이 초과되었습니다. 다시 시도하세요."),
        "refresh_token_expired": MessageLookupByLibrary.simpleMessage(
            "로그인 세션이 만료되었습니다. 다시 로그인해 주세요."),
        "register_agreement_1": MessageLookupByLibrary.simpleMessage("이용 약관"),
        "register_agreement_2": MessageLookupByLibrary.simpleMessage("과 "),
        "register_agreement_3":
            MessageLookupByLibrary.simpleMessage("개인정보 수집 및 이용"),
        "register_agreement_4": MessageLookupByLibrary.simpleMessage("에 동의합니다"),
        "register_button": MessageLookupByLibrary.simpleMessage("신청하기"),
        "register_email": MessageLookupByLibrary.simpleMessage("이메일"),
        "register_headline": MessageLookupByLibrary.simpleMessage("새 계정 만들기"),
        "register_password": MessageLookupByLibrary.simpleMessage("비밀번호"),
        "register_password_validation_1":
            MessageLookupByLibrary.simpleMessage("최소 8글자"),
        "register_password_validation_2":
            MessageLookupByLibrary.simpleMessage("최소 1개의 대문자"),
        "register_password_validation_3":
            MessageLookupByLibrary.simpleMessage("최소 1개의 소문자"),
        "register_password_validation_4":
            MessageLookupByLibrary.simpleMessage("최소 1개의 숫자"),
        "register_password_validation_5":
            MessageLookupByLibrary.simpleMessage("최소 1개의 특수 문자"),
        "register_title":
            MessageLookupByLibrary.simpleMessage("계정은 관리자의 승인 후 사용할 수 있습니다"),
        "register_username": MessageLookupByLibrary.simpleMessage("본명"),
        "relative_data_days_ago": m5,
        "relative_data_hour_ago":
            MessageLookupByLibrary.simpleMessage("한 시간 전"),
        "relative_data_hours_ago": m6,
        "relative_data_just_now": MessageLookupByLibrary.simpleMessage("방금"),
        "relative_data_minute_ago":
            MessageLookupByLibrary.simpleMessage("1분 전"),
        "relative_data_minutes_ago": m7,
        "relative_data_month_ago": m8,
        "relative_data_week_ago": MessageLookupByLibrary.simpleMessage("한 주 전"),
        "relative_data_weeks_ago": m9,
        "relative_data_year_ago": MessageLookupByLibrary.simpleMessage("1년 전"),
        "relative_data_years_ago": m10,
        "relative_data_yesterday": MessageLookupByLibrary.simpleMessage("어제"),
        "report_edit": MessageLookupByLibrary.simpleMessage("실무 결과 수정"),
        "report_exists": MessageLookupByLibrary.simpleMessage(
            "이미 해당 근무 일정으로 작성된 실무 결과가 있습니다."),
        "report_form_1": MessageLookupByLibrary.simpleMessage("교통비"),
        "report_form_2": MessageLookupByLibrary.simpleMessage("현지 교통비"),
        "report_form_3": MessageLookupByLibrary.simpleMessage("숙박비"),
        "report_form_4": MessageLookupByLibrary.simpleMessage("일비"),
        "report_form_5": MessageLookupByLibrary.simpleMessage("기타"),
        "report_form_accommodation":
            MessageLookupByLibrary.simpleMessage("숙박비"),
        "report_form_attachment": MessageLookupByLibrary.simpleMessage("첨부파일"),
        "report_form_column_1": MessageLookupByLibrary.simpleMessage("사용 금액"),
        "report_form_column_2": MessageLookupByLibrary.simpleMessage("내역 (설명)"),
        "report_form_column_3": MessageLookupByLibrary.simpleMessage("단가"),
        "report_form_column_4": MessageLookupByLibrary.simpleMessage("일"),
        "report_form_column_5":
            MessageLookupByLibrary.simpleMessage("렌탈, 택시 실비 처리"),
        "report_form_column_6":
            MessageLookupByLibrary.simpleMessage("개인 차량 유류비"),
        "report_form_column_7": MessageLookupByLibrary.simpleMessage("유류단가"),
        "report_form_column_8": MessageLookupByLibrary.simpleMessage("연비"),
        "report_form_column_9": MessageLookupByLibrary.simpleMessage("운행거리"),
        "report_form_daily_expense": MessageLookupByLibrary.simpleMessage("일비"),
        "report_form_deducted_1":
            MessageLookupByLibrary.simpleMessage("렌탈, 택시 실비 처리"),
        "report_form_deducted_2":
            MessageLookupByLibrary.simpleMessage("일비 -10%"),
        "report_form_delete":
            MessageLookupByLibrary.simpleMessage("출장 명령서가 삭제되었습니다."),
        "report_form_delete_dialog_1":
            MessageLookupByLibrary.simpleMessage("출장 명령서를 삭제하시겠습니까?"),
        "report_form_delete_dialog_2": MessageLookupByLibrary.simpleMessage(
            "출장 명령서를 삭제하면 모든 내용이 삭제됩니다.\n계속하시겠습니까?"),
        "report_form_description":
            MessageLookupByLibrary.simpleMessage("설명 및 첨부파일"),
        "report_form_description_1": MessageLookupByLibrary.simpleMessage("설명"),
        "report_form_invalid_1":
            MessageLookupByLibrary.simpleMessage("일정을 선택해 주세요"),
        "report_form_invalid_2": m11,
        "report_form_invalid_3": m12,
        "report_form_invalid_4":
            MessageLookupByLibrary.simpleMessage("모든 내용을 빠짐없이 입력해 주세요"),
        "report_form_invalid_5":
            MessageLookupByLibrary.simpleMessage("설명을 입력해 주세요"),
        "report_form_local_transportation":
            MessageLookupByLibrary.simpleMessage("현지 교통비"),
        "report_form_other": MessageLookupByLibrary.simpleMessage("기타"),
        "report_form_project": MessageLookupByLibrary.simpleMessage("프로젝트 정보"),
        "report_form_regulation": MessageLookupByLibrary.simpleMessage("규정 금액"),
        "report_form_schedule": MessageLookupByLibrary.simpleMessage("일정"),
        "report_form_schedule_add":
            MessageLookupByLibrary.simpleMessage("새 근무 일정 생성 >"),
        "report_form_schedule_description_empty":
            MessageLookupByLibrary.simpleMessage("설명 없음"),
        "report_form_schedule_empty":
            MessageLookupByLibrary.simpleMessage("일정이 없습니다"),
        "report_form_schedule_in_progress":
            MessageLookupByLibrary.simpleMessage("진행 중"),
        "report_form_schedule_no_schedule":
            MessageLookupByLibrary.simpleMessage("일정 없이 보고서 작성 >"),
        "report_form_schedule_scheduled":
            MessageLookupByLibrary.simpleMessage("진행 예정"),
        "report_form_schedule_search":
            MessageLookupByLibrary.simpleMessage("일정 검색"),
        "report_form_settlement": MessageLookupByLibrary.simpleMessage("정산 금액"),
        "report_form_step": MessageLookupByLibrary.simpleMessage("단계"),
        "report_form_title": MessageLookupByLibrary.simpleMessage("실무 결과 보고"),
        "report_form_title_1":
            MessageLookupByLibrary.simpleMessage("국내 출장 명령서 등록"),
        "report_form_title_2":
            MessageLookupByLibrary.simpleMessage("해외 출장 명령서 등록"),
        "report_form_total": MessageLookupByLibrary.simpleMessage("총 사용 금액"),
        "report_form_transportation":
            MessageLookupByLibrary.simpleMessage("교통비"),
        "report_list_loading_1":
            MessageLookupByLibrary.simpleMessage("데이터 로딩 중입니다"),
        "report_list_loading_2":
            MessageLookupByLibrary.simpleMessage("PDF 변환 중입니다"),
        "report_list_non_taxable_amount":
            MessageLookupByLibrary.simpleMessage("(비과세) 수령금액"),
        "report_list_taxable_amount":
            MessageLookupByLibrary.simpleMessage("(과세) 수령금액"),
        "report_list_total_cost":
            MessageLookupByLibrary.simpleMessage("전체 비용 합계"),
        "report_new": MessageLookupByLibrary.simpleMessage("실무 결과 보고"),
        "report_new_choose": MessageLookupByLibrary.simpleMessage("실무 결과 보고"),
        "report_not_found":
            MessageLookupByLibrary.simpleMessage("출장 명령서를 찾을 수 없습니다."),
        "reset_password_button": MessageLookupByLibrary.simpleMessage("요청하기"),
        "reset_password_headline":
            MessageLookupByLibrary.simpleMessage("새 비밀번호 설정하기"),
        "reset_password_password": MessageLookupByLibrary.simpleMessage("비밀번호"),
        "reset_password_retry_1": MessageLookupByLibrary.simpleMessage("링크 만료"),
        "reset_password_retry_2": MessageLookupByLibrary.simpleMessage(
            "이 링크는 사용할 수 있는 시간이 지났거나,\n이미 비밀번호를 바꾸는 데 사용되었기 때문에 작동하지 않습니다."),
        "reset_password_retry_3":
            MessageLookupByLibrary.simpleMessage("비밀번호 재설정 요청을 다시 진행해 주세요."),
        "reset_password_retry_4":
            MessageLookupByLibrary.simpleMessage("다시 요청하기"),
        "reset_password_success":
            MessageLookupByLibrary.simpleMessage("비밀번호가 정상적으로 변경되었습니다."),
        "reset_password_title":
            MessageLookupByLibrary.simpleMessage("변경할 비밀번호를 입력해 주세요."),
        "schedule_edit": MessageLookupByLibrary.simpleMessage("근무 일정 수정"),
        "schedule_exists":
            MessageLookupByLibrary.simpleMessage("이미 생성된 근무 일정이 있습니다."),
        "schedule_form_date": MessageLookupByLibrary.simpleMessage("일정"),
        "schedule_form_date_select":
            MessageLookupByLibrary.simpleMessage("일정 선택"),
        "schedule_form_delete":
            MessageLookupByLibrary.simpleMessage("업무가 삭제되었습니다."),
        "schedule_form_delete_dialog_1":
            MessageLookupByLibrary.simpleMessage("일정을 삭제하시겠습니까?"),
        "schedule_form_delete_dialog_2": MessageLookupByLibrary.simpleMessage(
            "일정을 삭제하면 모든 내용과 구글 캘린더의 일정이 함께 삭제됩니다.\n계속하시겠습니까?"),
        "schedule_form_description": MessageLookupByLibrary.simpleMessage("설명"),
        "schedule_form_invalid_1":
            MessageLookupByLibrary.simpleMessage("프로젝트를 선택해 주세요"),
        "schedule_form_invalid_2":
            MessageLookupByLibrary.simpleMessage("일정을 선택해 주세요"),
        "schedule_form_invalid_3":
            MessageLookupByLibrary.simpleMessage("출장 목적을 입력해 주세요"),
        "schedule_form_project": MessageLookupByLibrary.simpleMessage("프로젝트"),
        "schedule_form_project_emtpy":
            MessageLookupByLibrary.simpleMessage("프로젝트가 없습니다"),
        "schedule_form_project_search":
            MessageLookupByLibrary.simpleMessage("프로젝트 검색"),
        "schedule_form_success":
            MessageLookupByLibrary.simpleMessage("일정을 등록했습니다"),
        "schedule_form_summary": MessageLookupByLibrary.simpleMessage("출장 목적"),
        "schedule_new": MessageLookupByLibrary.simpleMessage("근무 일정 등록"),
        "schedule_new_choose":
            MessageLookupByLibrary.simpleMessage("근무 일정 종류 선택"),
        "schedule_new_choose_1": MessageLookupByLibrary.simpleMessage("🚅 "),
        "schedule_new_choose_1_1":
            MessageLookupByLibrary.simpleMessage("국내 출장"),
        "schedule_new_choose_1_2":
            MessageLookupByLibrary.simpleMessage("새로운 국내 출장 일정을 등록합니다"),
        "schedule_new_choose_2": MessageLookupByLibrary.simpleMessage("✈️ "),
        "schedule_new_choose_2_1":
            MessageLookupByLibrary.simpleMessage("해외 출장"),
        "schedule_new_choose_2_2":
            MessageLookupByLibrary.simpleMessage("새로운 해외 출장 일정을 등록합니다"),
        "schedule_new_choose_3": MessageLookupByLibrary.simpleMessage("🏭 "),
        "schedule_new_choose_3_1":
            MessageLookupByLibrary.simpleMessage("화성 조립 센터"),
        "schedule_new_choose_3_2":
            MessageLookupByLibrary.simpleMessage("새로운 화성 조립 센터 일정을 등록합니다"),
        "schedule_new_choose_4": MessageLookupByLibrary.simpleMessage("💻 "),
        "schedule_new_choose_4_1":
            MessageLookupByLibrary.simpleMessage("원격 업무"),
        "schedule_new_choose_4_2":
            MessageLookupByLibrary.simpleMessage("새로운 원격 업무 일정을 등록합니다"),
        "schedule_new_choose_5": MessageLookupByLibrary.simpleMessage("🤝 "),
        "schedule_new_choose_5_1":
            MessageLookupByLibrary.simpleMessage("회의 • 협의"),
        "schedule_new_choose_5_2":
            MessageLookupByLibrary.simpleMessage("새로운 회의 또는 협의 일정을 등록합니다"),
        "schedule_not_found":
            MessageLookupByLibrary.simpleMessage("근무 일정을 찾을 수 없습니다."),
        "send_timeout":
            MessageLookupByLibrary.simpleMessage("요청을 보내는 도중 시간이 초과되었습니다."),
        "setting": MessageLookupByLibrary.simpleMessage("설정"),
        "setting_segment_1": MessageLookupByLibrary.simpleMessage("내 정보"),
        "setting_segment_2": MessageLookupByLibrary.simpleMessage("데이터"),
        "text_color": MessageLookupByLibrary.simpleMessage("텍스트 색상"),
        "too_many_forgot_password_requests":
            MessageLookupByLibrary.simpleMessage(
                "비밀번호 재설정은 1분에 한 번만 요청할 수 있습니다. 잠시 후 다시 시도해주세요."),
        "transaction_issue_exists":
            MessageLookupByLibrary.simpleMessage("이미 생성된 거래 명세/인보이스 업무가 있습니다."),
        "unspecified": MessageLookupByLibrary.simpleMessage("미지정"),
        "user_exists": MessageLookupByLibrary.simpleMessage(
            "해당 이메일로 이미 가입된 사용자가 있습니다.\n다른 이메일 주소를 사용해 주세요."),
        "user_not_found": MessageLookupByLibrary.simpleMessage(
            "입력한 이메일이 존재하지 않습니다.\n정보를 확인하고 다시 시도하세요."),
        "work": MessageLookupByLibrary.simpleMessage("업무"),
        "work_segment_1": MessageLookupByLibrary.simpleMessage("근무 일정"),
        "work_segment_2": MessageLookupByLibrary.simpleMessage("주간 업무 보고"),
        "wrong_approach_content":
            MessageLookupByLibrary.simpleMessage("확인 버튼을 누르면 이전 화면으로 돌아갑니다."),
        "wrong_approach_title":
            MessageLookupByLibrary.simpleMessage("잘못된 접근입니다")
      };
}
