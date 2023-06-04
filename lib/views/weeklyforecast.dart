import 'package:flutter/material.dart';
import 'package:scroll/server.dart';
import 'package:scroll/views/dailyforecast.dart';

class WeeklyForecastList extends StatelessWidget {
  const WeeklyForecastList({super.key});

  Widget build(BuildContext context) {
    final DateTime currentDate = DateTime.now();
    final TextTheme textTheme = Theme.of(context).textTheme;
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        final DailyForecast daily = Server.getDailyForecastByID(index);
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        DecoratedBox(
                          position: DecorationPosition.foreground,
                          decoration: BoxDecoration(
                            gradient: RadialGradient(
                              colors: <Color>[
                                Colors.grey[800]!,
                                Colors.transparent,
                              ],
                            ),
                          ),
                          child: Image.network(
                            daily.imageId,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Center(
                          child: Text(
                            '${daily.getDate(currentDate.day)}',
                            style: textTheme.headlineMedium,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          daily.getWeekday(currentDate.weekday),
                          style: textTheme.headlineMedium,
                        ),
                        Text(daily.decription)
                      ],
                    ),
                  ),
                  Text('${daily.highTemp}|${daily.lowTemp}F',
                      style: textTheme.titleSmall)
                ]),
          ),
        );
      },
      childCount: 7,
    ));
  }
}

const String baseAssetURL =
    'https://dartpad-workshops-io2021.web.app/getting_started_with_slivers/';
const String headerImage = '${baseAssetURL}assets/header.jpeg';

const Map<int, DailyForecast> kDummyData = {
  0: DailyForecast(
    id: 0,
    imageId: '${baseAssetURL}assets/day_0.jpeg',
    highTemp: 73,
    lowTemp: 52,
    decription:
        'Partly cloudy in the morning, with sun appearing in the afternoon.',
  ),
  1: DailyForecast(
    id: 1,
    imageId: '${baseAssetURL}assets/day_1.jpeg',
    highTemp: 70,
    lowTemp: 50,
    decription: 'Partly sunny.',
  ),
  2: DailyForecast(
    id: 2,
    imageId: '${baseAssetURL}assets/day_2.jpeg',
    highTemp: 71,
    lowTemp: 55,
    decription: 'Party cloudy.',
  ),
  3: DailyForecast(
    id: 3,
    imageId: '${baseAssetURL}assets/day_3.jpeg',
    highTemp: 74,
    lowTemp: 60,
    decription: 'Thunderstorms in the evening.',
  ),
  4: DailyForecast(
    id: 4,
    imageId: '${baseAssetURL}assets/day_4.jpeg',
    highTemp: 67,
    lowTemp: 60,
    decription: 'Severe thunderstorm warning.',
  ),
  5: DailyForecast(
    id: 5,
    imageId: '${baseAssetURL}assets/day_5.jpeg',
    highTemp: 73,
    lowTemp: 57,
    decription: 'Cloudy with showers in the morning.',
  ),
  6: DailyForecast(
    id: 6,
    imageId: '${baseAssetURL}assets/day_6.jpeg',
    highTemp: 75,
    lowTemp: 58,
    decription: 'Sun throughout the day.',
  ),
};
