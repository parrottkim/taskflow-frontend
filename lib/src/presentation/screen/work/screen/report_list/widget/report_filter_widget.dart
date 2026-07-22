import 'package:flutter/material.dart';
import 'package:taskflow/src/presentation/screen/work/screen/report_list/widget/category_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/work/screen/report_list/widget/client_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/work/screen/report_list/widget/date_range_select_widget.dart';
import 'package:taskflow/src/presentation/screen/work/screen/report_list/widget/mobile_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/work/screen/report_list/widget/reset_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/work/screen/report_list/widget/search_widget.dart';
import 'package:taskflow/src/presentation/screen/work/screen/report_list/widget/sort_widget.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class ReportFilterWidget extends StatelessWidget {
  const ReportFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Responsive(desktop: _DesktopWidget(), mobile: _MobileWidget()),
    );
  }
}

class _DesktopWidget extends StatelessWidget {
  const _DesktopWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClientFilterWidget(),
        SizedBox(width: 8.0),
        CategoryFilterWidget(),
        SizedBox(width: 8.0),
        DateRangeSelectWidget(),
        SizedBox(width: 8.0),
        SortWidget(),
        Spacer(),
        ResetFilterWidget(),
        SizedBox(width: 8.0),
        SearchWidget(),
      ],
    );
  }
}

class _MobileWidget extends StatelessWidget {
  const _MobileWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [MobileFilterWidget(), Spacer(), ResetFilterWidget()]),
        SizedBox(height: 8.0),
        Row(children: [Expanded(child: SearchWidget())]),
      ],
    );
  }
}
