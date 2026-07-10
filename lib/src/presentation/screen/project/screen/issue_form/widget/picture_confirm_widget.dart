import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PictureConfirmWidget extends StatelessWidget {
  final Uint8List bytes;

  const PictureConfirmWidget({super.key, required this.bytes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.memory(bytes, fit: BoxFit.cover)),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: MediaQuery.of(context).padding.bottom + 32.0,
              ),
              constraints: BoxConstraints(maxWidth: 430.0),
              child: Material(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context).pop(false),
                      child: Ink(
                        width: 120.0,
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Theme.of(context).colorScheme.surface,
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.close),
                            SizedBox(width: 8.0),
                            Text(Intl.message('common_cancel')),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    InkWell(
                      onTap: () => Navigator.of(context).pop(true),
                      child: Ink(
                        width: 120.0,
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Theme.of(context).colorScheme.surface,
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.check),
                            SizedBox(width: 8.0),
                            Text(Intl.message('issue_form_camera_4')),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
