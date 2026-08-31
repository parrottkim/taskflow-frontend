import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class RequestedAndOrderedUserWidget extends StatelessWidget {
  final User? requestedUser;
  final User? orderedUser;
  const RequestedAndOrderedUserWidget({
    super.key,
    this.requestedUser,
    this.orderedUser,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.only(top: 4.0, left: 16.0, right: 16.0, bottom: 16.0),
      child: ContentContainer(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        borderRadius: BorderRadius.circular(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (requestedUser != null)
              SizedBox(
                height: 32.0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: Responsive.isDesktop(context) ? 160.0 : 100.0,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Symbols.shopping_cart_rounded,
                            size: 18.0,
                            color: colorScheme.onSurface.strong,
                          ),
                          SizedBox(width: 6.0),
                          Text(
                            Intl.message('issue_form_procurement_20'),
                            style: TextStyle(
                              color: colorScheme.onSurface.strong,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: UserInfo.compact(user: requestedUser!),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
