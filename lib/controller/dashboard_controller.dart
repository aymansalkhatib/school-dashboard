import 'package:get/get.dart';
import 'package:sama/core/helper/date.dart';
import 'package:sama/model/date_model.dart';

abstract class DashboardController extends GetxController {
  int getDaysInMonth(int year, int month);
}

class DashboardControllerImp extends DashboardController {
  late DateTableModel dateTableModel;
  @override
  int getDaysInMonth(int year, int month) {
    // List<int> monthLengths = [
    //   31, // January
    //   (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)) ? 29 : 28, // February
    //   31, // March
    //   30, // April
    //   31, // May
    //   30, // June
    //   31, // July
    //   31, // August
    //   30, // September
    //   31, // October
    //   30, // November
    //   31 // December
    // ];

    //* [For the DateTime constructor, when passing 0 as the day parameter, it represents the last day of the previous month]
    return DateTime(year, month + 1, 0).day;

    // return monthLengths[month - 1];
  }

  List<String> getDayNamesInMonth(int year, int month) {
    List<String> dayNames = [];
    int daysInMonth = DateTime(year, month + 1, 0).day;

    for (int i = 0; i < daysInMonth; i++) {
      DateTime currentDate = DateTime(year, month, i + 1);
      dayNames.add(getNameDay(currentDate));
    }

    return dayNames;
  }

  DateTableModel fillTableDate(int year, int month) {
    // Number days in month
    int numDaysInThisMonth = getDaysInMonth(year, month);
    int numDaysInPreviousMonth = getDaysInMonth(year, month - 1);

    // Name day in month
    String lastDaysInPreviousMonth = getNameDay(DateTime(year, month, 0));
    List<String> titletable = getDayNamesInMonth(year, month).sublist(0, 6);

    List<int> fillTableNumber = [
      numDaysInPreviousMonth,
      ...List.generate(numDaysInThisMonth, (index) => index + 1),
      ...List.generate(35 - numDaysInThisMonth - 1, (index) => index + 1)
    ];

    ///Title tabel date
    titletable.insert(0, lastDaysInPreviousMonth);

    dateTableModel = DateTableModel(
      titleTable: titletable,
      fillGrid: fillTableNumber,
      today: DateTime.now().day,
      year: year.toString(),
      month: getMonthName(month),
    );
    update();
    return dateTableModel;
  }

  @override
  void onInit() {
    fillTableDate(DateTime.now().year, DateTime.now().month);
    super.onInit();
  }
}
