import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:math' as math;

// Shared presentation widgets and their feature-grouped parts.

import 'package:collection/collection.dart';
import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:dio/dio.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' hide Provider;
import 'package:image/image.dart' as img;
import 'package:path/path.dart' as path;
import 'package:provider/provider.dart' hide FutureProvider;
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:share_plus/share_plus.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/core/core.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/shared/platform/clipboard_image_listener.dart';
import 'package:taskflow/src/shared/platform/clipboard_image_writer.dart';
import 'package:taskflow/src/shared/theme/color_extension.dart';
import 'package:taskflow/src/shared/tool/functions.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:gpt_markdown/gpt_markdown.dart';
import 'package:gpt_markdown/custom_widgets/markdown_config.dart';
import 'package:url_launcher/url_launcher.dart';

export 'package:taskflow/src/shared/theme/color_extension.dart';

// Generated
part 'widget.freezed.dart';

// Attachment
part 'attachment/attachment_widgets.dart';

// Calendar
part 'calendar/calendar_widget.dart';

// Controls
part 'controls/buttons.dart';
part 'controls/dropdowns.dart';

// Dialog
part 'dialog/common_dialogs.dart';
part 'dialog/date_picker_dialogs.dart';
part 'dialog/image_detail_dialog.dart';
part 'dialog/navigation_search_dialog.dart';
part 'dialog/send_email_dialog.dart';
part 'dialog/user_selector_dialog.dart';

// Display
part 'display/app_logo.dart';
part 'display/client_info.dart';
part 'display/content_containers.dart';
part 'display/data_table_widgets.dart';
part 'display/issue_category_badge.dart';
part 'display/markdown_widget.dart';
part 'display/radial_gauge.dart';
part 'display/user_info.dart';

// Editor
part 'editor/link_overlay.dart';
part 'editor/palette_overlay.dart';
part 'editor/rich_text_editor.dart';
part 'editor/toolbar_overlay.dart';

// Feedback
part 'feedback/feedback_overlays.dart';
part 'feedback/toast.dart';
part 'feedback/validation_error_message.dart';

// Layout
part 'layout/bento_grid.dart';
part 'layout/sliver_app_bar_delegate.dart';

// Model
part 'model/account_section.dart';
part 'model/action_menu_item.dart';
part 'model/admin_data_section.dart';
part 'model/bottom_sheet_action.dart';
part 'model/client_brand.dart';
part 'model/client_marker.dart';
part 'model/document_sort_option.dart';
part 'model/navigation_item.dart';
part 'model/project_view_options.dart';
part 'model/schedule_section.dart';
part 'model/sort_direction.dart';
part 'model/validation_rule.dart';
part 'model/work_view_options.dart';

// Navigation
part 'navigation/dashboard_drawer.dart';

// Preset
part 'preset/dashboard_content_presets.dart';
part 'preset/navigation_items.dart';
part 'preset/password_validation_rules.dart';
part 'preset/project_detail_action_menu.dart';
part 'preset/ui_configuration.dart';
