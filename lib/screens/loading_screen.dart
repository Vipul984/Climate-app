import 'package:climate/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:climate/screens/loaction_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:climate/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getCurrentPosition();
  }

  void getCurrentPosition() async {
    WeatherModel wm = WeatherModel();
    var weatherdata = await wm.getWeatherData();

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => LocationScreen(weatherdata)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
