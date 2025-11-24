import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:share_plus/share_plus.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/widget/button.dart';
import 'package:taskflow/src/presentation/widget/toast.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/shared/provider.dart';
import 'package:taskflow/src/shared/tool/functions.dart';
import 'package:url_launcher/url_launcher.dart';

class AttachmentWidget extends ConsumerWidget {
  final List<ReportAttachment> attachments;

  const AttachmentWidget({super.key, required this.attachments});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: attachments.length,
        itemBuilder: (context, index) => ContainerWidget(
          elevation: 0.0,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          borderRadius: BorderRadius.circular(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Icon(
                    Symbols.draft_rounded,
                    size: 24.0,
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                  Positioned(
                    bottom: 4.0,
                    child: Container(
                      width: 20.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.0),
                        color: colorScheme.primary.withValues(alpha: 0.7),
                      ),
                      child: Text(
                        extension(attachments[index].filename).substring(1),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 8.0,
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  attachments[index].filename,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(width: 8.0),
              // 파일 크기 표시
              Text(
                formatBytes(attachments[index].size),
                style: textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
              SizedBox(width: 8.0),
              CustomIconButton(
                onTap: () async {
                  final path = attachments[index].path;
                  final filename = attachments[index].filename;

                  final uri = Uri(
                    scheme: Uri.base.scheme,
                    host: Uri.base.host,
                    port: Uri.base.hasPort ? Uri.base.port : null,
                    path: Routes.download,
                    queryParameters: {
                      'path': path,
                      'filename': filename,
                    },
                  );

                  if (isDesktopPlatform()) {
                    await Clipboard.setData(
                        ClipboardData(text: uri.toString()));

                    ref.read(toastProvider).showToast(
                          child: Toast(
                            type: ToastType.standard,
                            message: Intl.message('common_copied'),
                          ),
                        );
                  } else {
                    SharePlus.instance.share(ShareParams(uri: uri));
                  }
                },
                icon: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: const Icon(
                    Symbols.share_rounded,
                    size: 20.0,
                    weight: 500.0,
                  ),
                ),
              ),
              CustomIconButton(
                onTap: () async {
                  final path = attachments[index].path;
                  final filename = attachments[index].filename;

                  final uri = Uri(
                    scheme: Uri.base.scheme,
                    host: Uri.base.host,
                    port: Uri.base.hasPort ? Uri.base.port : null,
                    path: Routes.download,
                    queryParameters: {
                      'path': path,
                      'filename': filename,
                    },
                  );

                  await launchUrl(
                    uri,
                    webOnlyWindowName: '_blank',
                  );
                },
                icon: Icon(
                  Symbols.download_rounded,
                ),
              ),
            ],
          ),
        ),
        separatorBuilder: (_, __) => SizedBox(height: 8.0),
      ),
    );
  }
}
