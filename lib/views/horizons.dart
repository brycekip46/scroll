import 'package:flutter/material.dart';
import 'package:scroll/views/weeklyforecast.dart';
import 'package:scroll/views/scrollbehaviour.dart';
import 'dart:convert';
import 'package:http/http.dart';

class HorizonsApp extends StatelessWidget {
  const HorizonsApp({super.key});

  void getData() async {
    var key = '';
    var lat = "1.2921°";
    var long = "36.8219°";

    var url = Uri.https("api.openweathermap.org",
        "/data/3.0/onecall?$lat&$long&exclude=minutely&&hourly&&daily,appid={$key");
    Response res = await get(url);
    Map data = jsonDecode(res.body);
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      scrollBehavior: const ConstantScrollBehavior(),
      title: 'Weather App',
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              stretch: true,
              onStretchTrigger: () async {},
              backgroundColor: Color.fromRGBO(0, 0, 0, 0.678),
              floating: true,
              pinned: false,
              snap: true,
              expandedHeight: 20,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                title: Text(
                  'Horizons',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                centerTitle: true,
                background: DecoratedBox(
                  position: DecorationPosition.foreground,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Colors.blueGrey,
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: Image.network(
                    headerImage,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            WeeklyForecastList()
          ],
        ),
      ),
    );
  }
}
