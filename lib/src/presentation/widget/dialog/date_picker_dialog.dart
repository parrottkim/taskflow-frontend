part of '../widget.dart';

class DatePickerDialog extends HookWidget {
  final DateTime? initialDate;
  final String? title;

  const DatePickerDialog({super.key, this.initialDate, this.title});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final selectedDate = useState<DateTime?>(initialDate);

    return Dialog(
      child: ContainerWidget(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        constraints: const BoxConstraints(maxWidth: 400.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                title ?? Intl.message('date_title'),
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: 400.0,
                child: Calendar.day(
                  onDateSelected: (value) {
                    selectedDate.value = value;
                  },
                  initialDate: initialDate,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => context.pop(),
                      child: Text(
                        Intl.message('common_close'),
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: selectedDate.value != null
                          ? () {
                              context.pop(selectedDate.value);
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: colorScheme.onPrimary,
                        backgroundColor: colorScheme.primary,
                      ),
                      child: Text(
                        Intl.message('common_ok'),
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
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

class DateRangePickerDialog extends HookConsumerWidget {
  final DateTime? startDate;
  final DateTime? endDate;
  final String? title;

  const DateRangePickerDialog({
    super.key,
    this.startDate,
    this.endDate,
    this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final rangeStartDate = useState<DateTime?>(startDate);
    final rangeEndDate = useState<DateTime?>(endDate);

    return Dialog(
      child: ContainerWidget(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        constraints: const BoxConstraints(maxWidth: 400.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                title ?? Intl.message('date_range_title'),
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: 400.0,
                child: Calendar.range(
                  onDateRangeSelected: (value) {
                    rangeStartDate.value = value.start;
                    rangeEndDate.value = value.end;
                  },
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => context.pop(),
                      child: Text(
                        Intl.message('common_close'),
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed:
                          rangeStartDate.value != null &&
                              rangeEndDate.value != null
                          ? () {
                              context.pop({
                                'start': rangeStartDate.value!,
                                'end': rangeEndDate.value!,
                              });
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: colorScheme.onPrimary,
                        backgroundColor: colorScheme.primary,
                      ),
                      child: Text(
                        Intl.message('common_ok'),
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
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
