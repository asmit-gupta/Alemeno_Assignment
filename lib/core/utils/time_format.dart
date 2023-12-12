String formatTime(String timeStr) {
  List<String> parts = timeStr.split(' ');
  List<String> timeParts = parts[0].split(':');
  int hour = int.parse(timeParts[0]);
  String period = parts[1];

  if (hour > 12) {
    hour -= 12;
  }

  return '$hour $period';
}
