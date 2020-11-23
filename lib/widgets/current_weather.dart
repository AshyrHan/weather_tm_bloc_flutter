import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_tm_bloc/models/weather_model.dart';
import 'package:weather_tm_bloc/styles/app_style.dart';
import 'package:weather_tm_bloc/utils.dart';

class CurrentWeather extends StatelessWidget {
  final WeatherCurrentModel model;

  CurrentWeather({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        //     color: Colors.lightBlue,
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        height: size.height * 0.15,
        width: size.width,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                leftMeteoInfo(context),
                currentDegree(context),
                Container(
                  // help container
                  width: MediaQuery.of(context).size.width * 0.30,
                  // color: Colors.amber,
                )
              ],
            ),
          ],
        ));
  }

  // widget

  Widget leftMeteoInfo(BuildContext context) {
    final String windKm = model.current.windKph?.round().toString();
    final String humadity = model.current.humidity.toString();
    final String pressure = model.current.pressureMb?.round().toString();
    return Container(
      width: MediaQuery.of(context).size.width * 0.30,
      // color: Colors.amber,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: SvgPicture.asset(
                    'assets/images/wind.svg',
                    color: Style.primaryColor,
                  ),
                ),
                const SizedBox(
                  width: 7.0,
                ),
                Text(
                  //  model.current.windKph.toString(),
                  '$windKm km/sag',
                  style: Style.meteoInfoStyle(),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: SvgPicture.asset('assets/images/arrow.svg'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: SvgPicture.asset(
                    'assets/images/humadity.svg',
                    color: Style.primaryColor,
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  '$humadity%',
                  style: Style.meteoInfoStyle(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: SvgPicture.asset(
                    'assets/images/pressure.svg',
                    color: Style.primaryColor,
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  '$pressure mm r.s.',
                  style: Style.meteoInfoStyle(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // widget

  Widget currentDegree(
    BuildContext context,
  ) {
    final temp = model.current.temp_c;
    final feelsLike = model.current.feelslikeC;
    return Expanded(
      child: Container(
        //  color: Colors.amberAccent,
        child: Column(
          children: [
            Text(
              Utils.formatTemp(temp),
              style: Style.currentDegreeStyle(),
            ),
            Text(
              '${Utils.formatTemp(feelsLike)}',
              style: TextStyle(fontSize: 12, color: Style.primaryColor),
            )
          ],
        ),
      ),
    );
  }
}
