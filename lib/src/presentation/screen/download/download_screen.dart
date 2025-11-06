import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class DownloadScreen extends ConsumerWidget {
  final String? path;
  final String? filename;

  const DownloadScreen({super.key, this.path, this.filename});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final download =
        ref.watch(downloadControllerProvider(path: path, filename: filename));

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Logo(),
            SizedBox(height: 24.0),
            Text(
              Intl.message('common_download_1'),
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              Intl.message('common_download_2'),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 24.0),
              constraints: BoxConstraints(maxWidth: 400.0),
              child: Divider(),
            ),
            Text(
              Intl.message('common_download_3'),
            ),
            SizedBox(height: 8.0),
            ElevatedButton.icon(
              onPressed: () {
                ref.invalidate(
                    downloadControllerProvider(path: path, filename: filename));
              },
              icon: Icon(Symbols.save_rounded),
              label: Text(
                Intl.message('common_download_4'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
