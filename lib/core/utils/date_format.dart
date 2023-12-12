String formatDateTime(DateTime selectedDate) {
  String formattedDate =
      "${_getTwoDigitDay(selectedDate.day)} ${_getMonthName(selectedDate.month)} ${selectedDate.year}";

  return formattedDate;
}

String _getTwoDigitDay(int day) {
  return day.toString().padLeft(2, '0');
}

String _getMonthName(int month) {
  List<String> monthNames = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  return monthNames[month - 1];
}
