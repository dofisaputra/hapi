import 'package:get/get.dart';
import 'package:hapi/constants.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class CalendarController extends GetxController {
  final days = kDays;
  final months = kMonths;
  final years = kYears;
  final emotions = kEmotions;
  final dummyDate = kDummyDate;

  var selectedDate = DateTime.now().obs;
  var selectedYear = 0.obs;
  var selectedMonth = 0.obs;
  var selectedEmoji = 0.obs;

  var previusMonthCount = 0;
  var weekOption = true.obs;

  List<dynamic> listDate = List.empty().obs;
  List<dynamic> listReport = List.empty().obs;

  void generateWeekDates() {
    generateMonthDates();

    int weekOfMonth =
        (((selectedDate.value.day - 1) + previusMonthCount) ~/ 7) + 1;
    int indexForSub = 7 * (weekOfMonth - 1);
    listDate = listDate.sublist(indexForSub, indexForSub + 7);
  }

  void generateMonthDates() {
    int currentMonth = selectedDate.value.month;
    int currentYear = selectedDate.value.year;
    int currentMonthDays = DateTime(currentYear, currentMonth + 1, 0).day;

    String firstDayCurrentMonth = DateFormat('EEEE', 'id_ID')
        .format(DateTime(currentYear, currentMonth, 1));

    List<dynamic> previousMonthDates = generatePreviousMonth();
    previousMonthDates = previousMonthDates.sublist(
        previousMonthDates.length - days.indexOf(firstDayCurrentMonth));

    List<dynamic> currentMonthDates = currentMonth == 3 && currentYear == 2023
        ? dummyDate.map(
            (e) {
              var isSelected = selectedDate.value.day == e['date'];
              return {
                "date": e['date'],
                "emoji": e['emoji'],
                "isSelected": isSelected,
                "isCurrentMonth": true,
              };
            },
          ).toList()
        : List.generate(
            currentMonthDays,
            (index) {
              var isSelected = selectedDate.value.day == index + 1;
              return {
                "date": index + 1,
                "emoji": "",
                "isSelected": isSelected,
                "isCurrentMonth": true,
              };
            },
          );

    List<dynamic> result = [];
    result.addAll(previousMonthDates);
    result.addAll(currentMonthDates);
    result.addAll(generateNextMonth().sublist(0, 42 - result.length));

    previusMonthCount = previousMonthDates.length;
    listDate = result;
  }

  List<dynamic> generatePreviousMonth() {
    int previousMonth =
        (selectedDate.value.month == 1) ? 12 : selectedDate.value.month - 1;
    int previousYear = (selectedDate.value.month == 1)
        ? selectedDate.value.year - 1
        : selectedDate.value.year;
    int previousMonthDays = DateTime(previousYear, previousMonth + 1, 0).day;

    List<dynamic> result = List.generate(
      previousMonthDays,
      (index) => {
        "date": index + 1,
        "emoji": "",
        "isSelected": false,
        "isCurrentMonth": false,
      },
    );
    return result;
  }

  List<dynamic> generateNextMonth() {
    int nextMonth =
        (selectedDate.value.month == 12) ? 1 : selectedDate.value.month + 1;
    int nextYear = (selectedDate.value.month == 12)
        ? selectedDate.value.year + 1
        : selectedDate.value.year;
    int nextMonthDays = DateTime(nextYear, nextMonth + 1, 0).day;

    List<dynamic> result = List.generate(
      nextMonthDays,
      (index) => {
        "date": index + 1,
        "emoji": "",
        "isSelected": false,
        "isCurrentMonth": false,
      },
    );
    return result;
  }

  void changeSelectedDay() {
    listDate = listDate.map(
      (element) {
        var isSelected = selectedDate.value.day == element['date'] &&
            element['isCurrentMonth'] == true;
        return {
          "date": element['date'],
          "emoji": element['emoji'],
          "isSelected": isSelected,
          "isCurrentMonth": element['isCurrentMonth'],
        };
      },
    ).toList();
  }

  void changeCalenderOption() {
    weekOption.value = !weekOption.value;

    if (weekOption.value) {
      generateWeekDates();
    } else {
      generateMonthDates();
    }
  }

  @override
  void onInit() {
    initializeDateFormatting();
    generateWeekDates();
    super.onInit();
  }
}
