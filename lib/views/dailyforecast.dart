class DailyForecast {
  final int id;
  final String imageId;
  final int highTemp;
  final int lowTemp;
  final String decription;

  const DailyForecast(
      {required this.id,
      required this.decription,
      required this.highTemp,
      required this.imageId,
      required this.lowTemp});

  static const List<String> weekdays = <String>[
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  String getWeekday(int today) {
    final int offset = today + id;
    final int day = offset >= 7 ? offset - 7 : offset;
    return weekdays[day];
  }

  int getDate(int today) => today + id;
}
