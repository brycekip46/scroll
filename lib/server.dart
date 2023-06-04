import 'package:scroll/views/weeklyforecast.dart';

class Server {
  static List getDailyForecastList() => kDummyData.values.toList();

  static getDailyForecastByID(int id) {
    assert(id >= 0 && id <= 6);
    return kDummyData[id];
  }
}
