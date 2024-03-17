String getMonthName(int monthNumber) {
  if (monthNumber < 1 || monthNumber > 12) return "invalid number";
  return [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ][monthNumber - 1];
}

int getMonthNumber(String monthName) {
  return [
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December'
      ].indexOf(monthName) +
      1;
}

String getNameDay(DateTime currentDate) {
  switch (currentDate.weekday) {
    case DateTime.monday:
      return 'Monday';
    case DateTime.tuesday:
      return 'Tuesday';

    case DateTime.wednesday:
      return 'Wednesday';

    case DateTime.thursday:
      return 'Thursday';

    case DateTime.friday:
      return 'Friday';

    case DateTime.saturday:
      return 'Saturday';

    case DateTime.sunday:
      return 'Sunday';
  }
  return currentDate.weekday.toString();
}
