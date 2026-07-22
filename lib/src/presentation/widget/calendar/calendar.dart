part of '../widget.dart';

// 캘린더 모드를 나타내는 내부 enum (외부 노출 X)
enum SelectionMode {
  day, // 단일 날짜 선택 모드
  range, // 날짜 범위 선택 모드
}

// 새로운 캘린더 뷰 모드 정의
enum CalendarViewMode {
  day, // 일별 뷰 (기존 달력)
  month, // 월별 뷰 (연도 내 12개 월 표시)
  year, // 연도별 뷰 (10년 단위 연도 표시)
}

class Calendar extends HookWidget {
  final SelectionMode _mode; // 내부에서만 사용할 모드
  final DateTime? initialDate;
  final DateTime? initialStartDate;
  final DateTime? initialEndDate;
  final ValueChanged<DateTime>? onDateSelected;
  final ValueChanged<DateTimeRange>? onDateRangeSelected;

  // 프라이빗 기본 생성자 - 직접 호출 방지
  const Calendar._({
    Key? key,
    required SelectionMode mode,
    this.initialDate,
    this.initialStartDate,
    this.initialEndDate,
    this.onDateSelected,
    this.onDateRangeSelected,
  }) : _mode = mode,
       super(key: key);

  // --- 단일 날짜 선택 모드 생성자 ---
  /// 단일 날짜를 선택하는 캘린더를 생성합니다.
  ///
  /// [initialDate]는 초기 선택된 날짜입니다.
  /// [onDateSelected]는 날짜가 선택될 때 호출되는 콜백입니다.
  factory Calendar.day({
    Key? key,
    DateTime? initialDate,
    ValueChanged<DateTime>? onDateSelected,
  }) {
    return Calendar._(
      key: key,
      mode: SelectionMode.day,
      initialDate: initialDate,
      onDateSelected: onDateSelected,
    );
  }

  // --- 날짜 범위 선택 모드 생성자 ---
  /// 날짜 범위를 선택하는 캘린더를 생성합니다.
  ///
  /// [initialStartDate]는 초기 범위의 시작 날짜입니다.
  /// [initialEndDate]는 초기 범위의 종료 날짜입니다.
  /// [onDateRangeSelected]는 날짜 범위가 선택될 때 호출되는 콜백입니다.
  factory Calendar.range({
    Key? key,
    DateTime? initialStartDate,
    DateTime? initialEndDate,
    ValueChanged<DateTimeRange>? onDateRangeSelected,
  }) {
    return Calendar._(
      key: key,
      mode: SelectionMode.range,
      initialStartDate: initialStartDate,
      initialEndDate: initialEndDate,
      onDateRangeSelected: onDateRangeSelected,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // useState 훅을 사용하여 상태 관리
    // focusedDay: 현재 보고 있는 월/연도/10년 주기를 결정
    final focusedDay = useState<DateTime>(
      initialDate ?? initialStartDate ?? DateTime.now(),
    );
    // selectedDay: 단일 선택 모드에서 선택된 날짜
    final selectedDay = useState<DateTime?>(initialDate);
    // rangeStart, rangeEnd: 범위 선택 모드에서 시작 및 종료 날짜
    final rangeStart = useState<DateTime?>(initialStartDate);
    final rangeEnd = useState<DateTime?>(initialEndDate);
    // currentViewMode: 현재 캘린더의 뷰 모드 (일, 월, 연도)
    final currentViewMode = useState<CalendarViewMode>(CalendarViewMode.day);

    // PageController 계산 기준 연도 (무한 스크롤 대신 특정 범위 지정)
    final int minYear = 1900;
    final int maxYear = 2100;

    // 각 뷰 모드에 맞는 PageController 초기화
    final dayPageController = useMemoized(
      () => PageController(
        initialPage:
            (focusedDay.value.year - minYear) * 12 + focusedDay.value.month - 1,
      ),
      [focusedDay.value.year, focusedDay.value.month, minYear],
    );

    final monthPageController = useMemoized(
      () => PageController(initialPage: focusedDay.value.year - minYear),
      [focusedDay.value.year, minYear],
    );

    final yearPageController = useMemoized(
      () =>
          PageController(initialPage: (focusedDay.value.year - minYear) ~/ 10),
      [focusedDay.value.year, minYear],
    );

    // // focusedDay 변경 시 해당 PageView의 페이지로 이동
    // useEffect(() {
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     void animateToPageIfNecessary(
    //         PageController controller, int targetPage) {
    //       if (controller.hasClients && controller.page?.round() != targetPage) {
    //         controller.animateToPage(targetPage,
    //             duration: const Duration(milliseconds: 300),
    //             curve: Curves.easeOut);
    //       }
    //     }

    //     if (currentViewMode.value == CalendarViewMode.day) {
    //       final int targetPage = (focusedDay.value.year - minYear) * 12 +
    //           focusedDay.value.month -
    //           1;
    //       animateToPageIfNecessary(dayPageController, targetPage);
    //     } else if (currentViewMode.value == CalendarViewMode.month) {
    //       final int targetPage = focusedDay.value.year - minYear;
    //       animateToPageIfNecessary(monthPageController, targetPage);
    //     } else if (currentViewMode.value == CalendarViewMode.year) {
    //       final int targetPage = (focusedDay.value.year - minYear) ~/ 10;
    //       animateToPageIfNecessary(yearPageController, targetPage);
    //     }
    //   });
    //   return null;
    // }, [
    //   focusedDay.value,
    //   currentViewMode.value,
    //   dayPageController,
    //   monthPageController,
    //   yearPageController,
    //   minYear,
    // ]);

    // 초기 범위가 주어졌고, 시작일이 종료일보다 늦으면 스왑
    useEffect(() {
      if (_mode == SelectionMode.range &&
          rangeStart.value != null &&
          rangeEnd.value != null &&
          rangeStart.value!.isAfter(rangeEnd.value!)) {
        final temp = rangeStart.value;
        rangeStart.value = rangeEnd.value;
        rangeEnd.value = temp;
      }
      return null;
    }, [_mode]);

    // 달력 헤더 (연도, 월 표시 및 이전/다음 버튼)
    Widget buildHeader() {
      final currentLocale = Localizations.localeOf(context).languageCode;
      String headerText;
      VoidCallback? onHeaderTap;
      VoidCallback? onLeftArrowTap;
      VoidCallback? onRightArrowTap;

      switch (currentViewMode.value) {
        case CalendarViewMode.day:
          headerText = DateFormat.yMMMM(currentLocale).format(focusedDay.value);
          onHeaderTap = () => currentViewMode.value = CalendarViewMode.month;
          onLeftArrowTap = () {
            if (dayPageController.hasClients) {
              dayPageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            }
          };
          onRightArrowTap = () {
            if (dayPageController.hasClients) {
              dayPageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            }
          };
          break;
        case CalendarViewMode.month:
          headerText = DateFormat.y(currentLocale).format(focusedDay.value);
          onHeaderTap = () => currentViewMode.value = CalendarViewMode.year;
          onLeftArrowTap = () {
            if (monthPageController.hasClients) {
              monthPageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            }
          };
          onRightArrowTap = () {
            if (monthPageController.hasClients) {
              monthPageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            }
          };
          break;
        case CalendarViewMode.year:
          final startYear = (focusedDay.value.year ~/ 10) * 10;
          final endYear = startYear + 9;
          headerText = '$startYear - $endYear';
          onHeaderTap = null; // 연도 뷰에서는 더 이상 상위 뷰로 이동하지 않음
          onLeftArrowTap = () {
            if (yearPageController.hasClients) {
              yearPageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            }
          };
          onRightArrowTap = () {
            if (yearPageController.hasClients) {
              yearPageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            }
          };
          break;
      }

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Symbols.chevron_left_rounded),
            onPressed: onLeftArrowTap,
            color: colorScheme.onSurface,
          ),
          InkWell(
            onTap: onHeaderTap,
            borderRadius: BorderRadius.circular(4.0),
            highlightColor: colorScheme.primary.withValues(alpha: 0.1),
            splashColor: colorScheme.primary.withValues(alpha: 0.2),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 4.0,
              ),
              child: Text(
                headerText,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Symbols.chevron_right_rounded),
            onPressed: onRightArrowTap,
            color: colorScheme.onSurface,
          ),
        ],
      );
    }

    // 요일 표시 (일, 월, 화, 수, 목, 금, 토)
    Widget buildWeekDays() {
      if (currentViewMode.value != CalendarViewMode.day) {
        return const SizedBox.shrink(); // 일별 뷰가 아니면 숨김
      }
      final List<String> displayWeekDays = [];

      for (int i = 0; i < 7; i++) {
        print(Intl.getCurrentLocale());
        // 임의의 날짜를 사용하여 해당 요일의 이름을 가져옵니다.
        // 2024년 1월 7일은 일요일입니다. (기준점)
        DateTime date = DateTime(2024, 1, 7).add(Duration(days: i));
        displayWeekDays.add(DateFormat.E(Intl.getCurrentLocale()).format(date));
      }

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: displayWeekDays.map((day) {
          return Expanded(
            child: Container(
              // buildDaysGrid와 동일한 간격 적용을 위해 Container 추가
              margin: const EdgeInsets.all(2.0), // buildDaysGrid의 셀과 동일한 마진
              alignment: Alignment.center,
              child: Text(
                day,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
            ),
          );
        }).toList(),
      );
    }

    // 두 DateTime 객체가 같은 날짜인지 확인 (시간 무시)
    bool isSameDay(DateTime a, DateTime b) {
      return a.year == b.year && a.month == b.month && a.day == b.day;
    }

    // 날짜 선택 로직 (모드에 따라 분기)
    void onDaySelected(DateTime day) {
      // PageController 이동을 먼저 처리
      final int targetPage = (day.year - minYear) * 12 + day.month - 1;
      if (dayPageController.hasClients) {
        // animateToPage 대신 jumpToPage를 써도 됩니다.
        dayPageController.animateToPage(
          targetPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }

      if (_mode == SelectionMode.day) {
        selectedDay.value = day;
        onDateSelected?.call(day);
      } else if (_mode == SelectionMode.range) {
        if (rangeStart.value == null || rangeEnd.value != null) {
          // 새로 시작하거나 기존 범위 선택이 완료된 상태
          rangeStart.value = day;
          rangeEnd.value = null; // 종료일 초기화
        } else {
          // 시작일이 선택된 상태에서 종료일 선택
          if (day.isBefore(rangeStart.value!)) {
            // 선택한 날짜가 시작일보다 빠르면 스왑
            rangeEnd.value = rangeStart.value;
            rangeStart.value = day;
          } else {
            rangeEnd.value = day;
          }
          if (rangeStart.value != null && rangeEnd.value != null) {
            onDateRangeSelected?.call(
              DateTimeRange(start: rangeStart.value!, end: rangeEnd.value!),
            );
          }
        }
      }
      // 날짜 선택 후, 해당 날짜가 있는 월로 focusedDay 업데이트 (헤더 동기화)
      if (!isSameDay(focusedDay.value, DateTime(day.year, day.month, 1))) {
        focusedDay.value = DateTime(day.year, day.month, 1);
      }
    }

    // --- 연도별 선택 그리드 (Page View 적용) ---
    Widget buildYearsGrid() {
      final int totalDecades = (maxYear - minYear) ~/ 10 + 1; // 10년 단위 블록의 총 개수

      // 연도별 뷰에서 해당 연도가 선택 범위에 포함되는지 확인하는 헬퍼 함수
      bool isYearInRange(int year) {
        if (_mode != SelectionMode.range || rangeStart.value == null)
          return false;

        final DateTime start = rangeStart.value!;
        final DateTime end = rangeEnd.value ?? start;

        final DateTime yearStart = DateTime(year, 1, 1);
        final DateTime yearEnd = DateTime(year, 12, 31);

        return (yearStart.isBefore(end) || isSameDay(yearStart, end)) &&
            (yearEnd.isAfter(start) || isSameDay(yearEnd, start));
      }

      // 연도가 범위의 시작 연도인지 확인
      bool isYearRangeStart(int year) {
        if (_mode != SelectionMode.range || rangeStart.value == null)
          return false;
        return year == rangeStart.value!.year;
      }

      // 연도가 범위의 종료 연도인지 확인
      bool isYearRangeEnd(int year) {
        if (_mode != SelectionMode.range || rangeEnd.value == null)
          return false;
        return year == rangeEnd.value!.year;
      }

      return PageView.builder(
        controller: yearPageController,
        itemCount: totalDecades,
        onPageChanged: (pageIndex) {
          final newStart = minYear + pageIndex * 10;
          focusedDay.value = DateTime(newStart, focusedDay.value.month, 1);
        },
        itemBuilder: (context, pageIndex) {
          final startYear = minYear + pageIndex * 10;
          final years = List.generate(10, (i) => startYear + i);

          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.5,
            ),
            itemCount: years.length,
            itemBuilder: (context, idx) {
              final year = years[idx];

              final bool isTodayYear = year == DateTime.now().year;

              final bool isInRange = isYearInRange(year);
              final bool isRangeStart = isYearRangeStart(year);
              final bool isRangeEnd = isYearRangeEnd(year);

              BoxDecoration backgroundDecoration = BoxDecoration();
              BoxDecoration foregroundDecoration = BoxDecoration();
              BoxDecoration todayDecoration = BoxDecoration();

              Color textColor = colorScheme.onSurface;

              if (isTodayYear) {
                todayDecoration = BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(
                    color: isRangeStart || isRangeEnd
                        ? colorScheme.tertiary
                        : colorScheme.primary,
                  ),
                );
                textColor = colorScheme.primary;
              }

              if (_mode == SelectionMode.range) {
                if (isRangeStart) {
                  foregroundDecoration = BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: colorScheme.primary,
                  );
                  backgroundDecoration = BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(50.0),
                    ),
                    color: colorScheme.primary.withValues(alpha: 0.1),
                  );
                  textColor = colorScheme.onPrimary;
                } else if (isRangeEnd) {
                  foregroundDecoration = BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: colorScheme.primary,
                  );
                  backgroundDecoration = BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(50.0),
                    ),
                    color: colorScheme.primary.withValues(alpha: 0.1),
                  );
                  textColor = colorScheme.onPrimary;
                } else if (isInRange) {
                  backgroundDecoration = BoxDecoration(
                    color: colorScheme.primary.withValues(alpha: 0.1),
                  );
                  textColor = colorScheme.primary;
                }
              }

              EdgeInsets cellPadding;
              if (_mode == SelectionMode.range && isInRange) {
                if (isRangeStart && !isRangeEnd) {
                  // 시작일이지만 단일 선택은 아님
                  cellPadding = const EdgeInsets.only(
                    top: 8.0,
                    bottom: 8.0,
                    left: 8.0,
                    right: 0.0,
                  );
                } else if (isRangeEnd && !isRangeStart) {
                  // 종료일이지만 단일 선택은 아님
                  cellPadding = const EdgeInsets.only(
                    top: 8.0,
                    bottom: 8.0,
                    left: 0.0,
                    right: 8.0,
                  );
                } else if (isRangeStart && isRangeEnd) {
                  // 시작일이자 종료일 (단일 선택)
                  cellPadding = const EdgeInsets.all(8.0); // 이때는 패딩을 균일하게
                } else {
                  // 범위 내의 중간 날짜
                  cellPadding = const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 0.0,
                  );
                }
              } else {
                cellPadding = const EdgeInsets.all(8.0);
              }

              return InkWell(
                onTap: () {
                  focusedDay.value = DateTime(year, 1, 1);
                  currentViewMode.value = CalendarViewMode.month;
                },
                borderRadius: BorderRadius.circular(8.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: cellPadding,
                      decoration: backgroundDecoration,
                    ),
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: foregroundDecoration,
                    ),
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: todayDecoration,
                    ),
                    Text(
                      '$year',
                      style: TextStyle(
                        color: textColor,
                        fontWeight: (isTodayYear || isRangeStart || isRangeEnd)
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      );
    }

    // --- 월별 선택 그리드 (Page View 적용) ---
    Widget buildMonthsGrid() {
      final currentLocale = Localizations.localeOf(context).languageCode;
      final int totalYears = maxYear - minYear + 1;

      // 월별 뷰에서 해당 월이 선택 범위에 포함되는지 확인하는 헬퍼 함수
      bool isMonthInRange(DateTime monthDate) {
        if (_mode != SelectionMode.range || rangeStart.value == null)
          return false;

        final DateTime start = rangeStart.value!;
        final DateTime end =
            rangeEnd.value ?? start; // rangeEnd가 null이면 start와 동일

        final DateTime monthStart = DateTime(
          monthDate.year,
          monthDate.month,
          1,
        );
        final DateTime monthEnd = DateTime(
          monthDate.year,
          monthDate.month + 1,
          0,
        );

        return (monthStart.isBefore(end) || isSameDay(monthStart, end)) &&
            (monthEnd.isAfter(start) || isSameDay(monthEnd, start));
      }

      // 월이 범위의 시작 월인지 확인
      bool isMonthRangeStart(DateTime monthDate) {
        if (_mode != SelectionMode.range || rangeStart.value == null)
          return false;
        return monthDate.year == rangeStart.value!.year &&
            monthDate.month == rangeStart.value!.month;
      }

      // 월이 범위의 종료 월인지 확인
      bool isMonthRangeEnd(DateTime monthDate) {
        if (_mode != SelectionMode.range || rangeEnd.value == null)
          return false;
        return monthDate.year == rangeEnd.value!.year &&
            monthDate.month == rangeEnd.value!.month;
      }

      return PageView.builder(
        controller: monthPageController,
        itemCount: totalYears,
        onPageChanged: (pageIndex) {
          final newYear = minYear + pageIndex;
          focusedDay.value = DateTime(newYear, focusedDay.value.month, 1);
        },
        itemBuilder: (context, pageIndex) {
          final int yearToShow = minYear + pageIndex;
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.5,
            ),
            itemCount: 12,
            itemBuilder: (context, index) {
              final monthDate = DateTime(yearToShow, index + 1, 1);

              // 상태 계산
              final bool isTodayMonth =
                  monthDate.year == DateTime.now().year &&
                  monthDate.month == DateTime.now().month;

              final bool isInRange = isMonthInRange(monthDate);
              final bool isRangeStart = isMonthRangeStart(monthDate);
              final bool isRangeEnd = isMonthRangeEnd(monthDate);

              // Decoration 레이어 정의
              BoxDecoration backgroundDecoration = BoxDecoration();
              BoxDecoration foregroundDecoration = BoxDecoration();
              BoxDecoration todayDecoration = BoxDecoration();

              Color textColor = colorScheme.onSurface;

              if (isTodayMonth) {
                todayDecoration = BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(
                    color: isRangeStart || isRangeEnd
                        ? colorScheme.tertiary
                        : colorScheme.primary,
                  ),
                );
                textColor = colorScheme.primary;
              }

              if (_mode == SelectionMode.range) {
                if (isRangeStart) {
                  foregroundDecoration = BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: colorScheme.primary,
                  );
                  backgroundDecoration = BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(50.0),
                    ),
                    color: colorScheme.primary.withValues(alpha: 0.1),
                  );
                  textColor = colorScheme.onPrimary;
                } else if (isRangeEnd) {
                  foregroundDecoration = BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: colorScheme.primary,
                  );
                  backgroundDecoration = BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(50.0),
                    ),
                    color: colorScheme.primary.withValues(alpha: 0.1),
                  );
                  textColor = colorScheme.onPrimary;
                } else if (isInRange) {
                  backgroundDecoration = BoxDecoration(
                    color: colorScheme.primary.withValues(alpha: 0.1),
                  );
                  textColor = colorScheme.primary;
                }
              }

              EdgeInsets cellPadding;
              if (_mode == SelectionMode.range && isInRange) {
                if (isRangeStart && !isRangeEnd) {
                  // 시작일이지만 단일 선택은 아님
                  cellPadding = const EdgeInsets.only(
                    top: 8.0,
                    bottom: 8.0,
                    left: 8.0,
                    right: 0.0,
                  );
                } else if (isRangeEnd && !isRangeStart) {
                  // 종료일이지만 단일 선택은 아님
                  cellPadding = const EdgeInsets.only(
                    top: 8.0,
                    bottom: 8.0,
                    left: 0.0,
                    right: 8.0,
                  );
                } else if (isRangeStart && isRangeEnd) {
                  // 시작일이자 종료일 (단일 선택)
                  cellPadding = const EdgeInsets.all(8.0); // 이때는 패딩을 균일하게
                } else {
                  // 범위 내의 중간 날짜
                  cellPadding = const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 0.0,
                  );
                }
              } else {
                cellPadding = const EdgeInsets.all(8.0);
              }

              return InkWell(
                onTap: () {
                  focusedDay.value = monthDate;
                  currentViewMode.value = CalendarViewMode.day;
                },
                borderRadius: BorderRadius.circular(8.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // 범위 배경
                    Container(
                      margin: cellPadding,
                      decoration: backgroundDecoration,
                    ),
                    // 선택 전경
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: foregroundDecoration,
                    ),
                    // 오늘 테두리
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: todayDecoration,
                    ),
                    // 월 텍스트
                    Text(
                      DateFormat.MMM(currentLocale).format(monthDate),
                      style: TextStyle(
                        color: textColor,
                        fontWeight: (isTodayMonth || isRangeStart || isRangeEnd)
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      );
    }

    // 날짜 그리드 (Page View 적용)
    Widget buildDaysGrid() {
      final int totalMonths = (maxYear - minYear + 1) * 12;

      // 일별 뷰에서 해당 날짜가 선택 범위에 포함되는지 확인하는 헬퍼 함수
      bool isDayInRange(DateTime dayDate) {
        if (_mode != SelectionMode.range || rangeStart.value == null)
          return false;

        final DateTime start = rangeStart.value!;
        final DateTime end =
            rangeEnd.value ?? start; // rangeEnd가 null이면 start와 동일

        return (dayDate.isAfter(start) || isSameDay(dayDate, start)) &&
            (dayDate.isBefore(end) || isSameDay(dayDate, end));
      }

      // 날짜가 범위의 시작 날짜인지 확인
      bool isDayRangeStart(DateTime dayDate) {
        if (_mode != SelectionMode.range || rangeStart.value == null)
          return false;
        return isSameDay(dayDate, rangeStart.value!);
      }

      // 날짜가 범위의 종료 날짜인지 확인
      bool isDayRangeEnd(DateTime dayDate) {
        if (_mode != SelectionMode.range || rangeEnd.value == null)
          return false;
        return isSameDay(dayDate, rangeEnd.value!);
      }

      // 날짜가 단일 선택 모드에서 선택된 날짜인지 확인
      bool isDaySelected(DateTime dayDate) {
        if (_mode != SelectionMode.day || selectedDay.value == null)
          return false;
        return isSameDay(dayDate, selectedDay.value!);
      }

      return PageView.builder(
        controller: dayPageController,
        itemCount: totalMonths,
        onPageChanged: (pageIndex) {
          final int year = minYear + (pageIndex ~/ 12);
          final int month = (pageIndex % 12) + 1;
          focusedDay.value = DateTime(year, month, 1);
        },
        itemBuilder: (context, pageIndex) {
          final int year = minYear + (pageIndex ~/ 12);
          final int month = (pageIndex % 12) + 1;
          final DateTime monthToDisplay = DateTime(year, month, 1);

          final DateTime firstDayOfMonth = DateTime(
            monthToDisplay.year,
            monthToDisplay.month,
            1,
          );
          // 캘린더는 일요일부터 시작한다고 가정하므로, 일요일을 0으로 맞추기 위해 조정
          final int firstDayWeekday = firstDayOfMonth.weekday % 7;

          final DateTime startDay = firstDayOfMonth.subtract(
            Duration(days: firstDayWeekday),
          );

          final DateTime lastDayOfMonth = DateTime(
            monthToDisplay.year,
            monthToDisplay.month + 1,
            0,
          );

          final int totalDays =
              (lastDayOfMonth.difference(startDay).inDays + 1);
          final int numRows = (totalDays / 7).ceil();
          final int gridCellCount = numRows * 7;

          final List<DateTime> days = List.generate(gridCellCount, (index) {
            return startDay.add(Duration(days: index));
          });

          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1.0,
            ),
            itemCount: days.length,
            itemBuilder: (context, index) {
              final day = days[index];
              final bool isToday = isSameDay(day, DateTime.now());
              final bool isCurrentMonth = day.month == monthToDisplay.month;

              // 헬퍼 함수를 사용하여 상태 변수 설정
              final bool isSelected = isDaySelected(day);
              final bool isInRange = isDayInRange(day);
              final bool isRangeStart = isDayRangeStart(day);
              final bool isRangeEnd = isDayRangeEnd(day);

              BoxDecoration todayDecoration = BoxDecoration();
              BoxDecoration foregroundDecoration = BoxDecoration();
              BoxDecoration backgroundDecoration = BoxDecoration();

              Color textColor = isCurrentMonth
                  ? colorScheme
                        .onSurface // 현재 월 날짜는 기본 색상
                  : colorScheme.onSurface.withValues(alpha: 0.4);

              if (isToday) {
                todayDecoration = BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(
                    color: isRangeStart || isRangeEnd
                        ? colorScheme.tertiary
                        : colorScheme.primary,
                  ),
                );
                textColor = colorScheme.primary;
              }

              if (_mode == SelectionMode.day && isSelected) {
                foregroundDecoration = BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: colorScheme.primary,
                );
                textColor = colorScheme.onPrimary;
              } else if (_mode == SelectionMode.range) {
                if (isRangeStart &&
                    isRangeEnd &&
                    rangeStart.value != null &&
                    rangeEnd.value != null &&
                    isSameDay(rangeStart.value!, rangeEnd.value!)) {
                  // 시작일과 종료일이 같을 때 (단일 날짜 범위 선택)
                  foregroundDecoration = BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: colorScheme.primary,
                  );
                  textColor = colorScheme.onPrimary;
                } else if (isRangeStart) {
                  foregroundDecoration = BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: colorScheme.primary,
                  );
                  if (rangeStart.value != null && rangeEnd.value != null) {
                    backgroundDecoration = BoxDecoration(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(50.0),
                      ),
                      color: colorScheme.primary.withValues(alpha: 0.1),
                    );
                  }
                  textColor = colorScheme.onPrimary;
                } else if (isRangeEnd) {
                  foregroundDecoration = BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: colorScheme.primary,
                  );
                  backgroundDecoration = BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(50.0),
                    ),
                    color: colorScheme.primary.withValues(alpha: 0.1),
                  );
                  textColor = colorScheme.onPrimary;
                } else if (isInRange) {
                  backgroundDecoration = BoxDecoration(
                    color: colorScheme.primary.withValues(alpha: 0.1),
                  );
                  textColor = colorScheme.primary;
                }
              }

              EdgeInsets cellPadding;
              if (_mode == SelectionMode.range && isInRange) {
                if (isRangeStart && !isRangeEnd) {
                  // 시작일이지만 단일 선택은 아님
                  cellPadding = const EdgeInsets.only(
                    top: 8.0,
                    bottom: 8.0,
                    left: 8.0,
                    right: 0.0,
                  );
                } else if (isRangeEnd && !isRangeStart) {
                  // 종료일이지만 단일 선택은 아님
                  cellPadding = const EdgeInsets.only(
                    top: 8.0,
                    bottom: 8.0,
                    left: 0.0,
                    right: 8.0,
                  );
                } else if (isRangeStart && isRangeEnd) {
                  // 시작일이자 종료일 (단일 선택)
                  cellPadding = const EdgeInsets.all(8.0); // 이때는 패딩을 균일하게
                } else {
                  // 범위 내의 중간 날짜
                  cellPadding = const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 0.0,
                  );
                }
              } else {
                cellPadding = const EdgeInsets.all(8.0);
              }

              return InkWell(
                onTap: () => onDaySelected(day),
                customBorder: CircleBorder(),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: cellPadding,
                      decoration: backgroundDecoration,
                    ),
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: foregroundDecoration,
                    ),
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: todayDecoration,
                    ),
                    Text(
                      '${day.day}',
                      style: TextStyle(
                        color: textColor,
                        fontWeight:
                            (isToday ||
                                isSelected ||
                                isRangeStart ||
                                isRangeEnd)
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      );
    }

    return Column(
      children: [
        buildHeader(), // 캘린더 헤더 (월/연도 표시 및 이동 버튼)
        SizedBox(height: 16.0),
        buildWeekDays(), // 요일 표시 (일, 월, 화 등)
        Expanded(
          child: AnimatedSwitcher(
            // 뷰 모드(일,월,연도) 전환 시 애니메이션 효과
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: Builder(
              // 현재 뷰 모드에 따라 적절한 그리드 위젯 표시
              key: ValueKey<CalendarViewMode>(currentViewMode.value),
              builder: (context) {
                switch (currentViewMode.value) {
                  case CalendarViewMode.day:
                    return buildDaysGrid();
                  case CalendarViewMode.month:
                    return buildMonthsGrid();
                  case CalendarViewMode.year:
                    return buildYearsGrid();
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
