import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_tm_bloc/models/weather_model.dart';
import 'package:weather_tm_bloc/styles/app_style.dart';
import '../utils.dart';

Widget customAppBar(
  BuildContext context,
  GlobalKey<ScaffoldState> key,
) {
  return SafeArea(
    child: Container(
      height: 30.0,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: SizedBox(
              width: 24.0,
              child: InkWell(
                child: SvgPicture.asset(
                  'assets/images/menu.svg',
                  color: Style.primaryColor,
                ),
                onTap: () => key.currentState.openDrawer(),
              ),
            ),
          )
          // IconButton(
          //     icon: Icon(
          //       Icons.menu,
          //       color: Style.primaryColor,
          //     ),
          //     onPressed: () {
          //       key.currentState.openDrawer();
          //     }),
        ],
      ),
    ),
  );
}

Widget cityNameWidget(BuildContext context, String cityName) {
  return Container(
    // color: Colors.amber,
    height: MediaQuery.of(context).size.height * 0.10,
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        Text(
          cityName ?? '',
          maxLines: 1,
          overflow: TextOverflow.clip,
          style: Style.cityNameStyle(),
        ),
        Text(
          'Türkmenistan',
          style: Style.stateNameStyle(),
        )
      ],
    ),
  );
}

Widget weatherIcon(BuildContext context, int code) {
  return Container(
      // color: Colors.lightBlue,
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width * 0.6,
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Utils.codeToMainImage(code, DateTime.now()),
        ),
      ));
}

Widget hourWeather(BuildContext context, WeatherCurrentModel model) {
  return Container(
    //  color: Colors.redAccent,
    height: 100,
    child: ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: [
        const SizedBox(
          width: 20.0,
        ),
        ListView.builder(
          //physics: AlwaysScrollableScrollPhysics(),
          itemCount: model.forecast.forecastday.first.hour.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (
            context,
            index,
          ) {
            return hourWeatherWidget(index, model);
          },
        ),
      ],
    ),
  );
}

Widget hourWeatherWidget(int index, WeatherCurrentModel model) {
  return Container(
    margin: const EdgeInsets.only(right: 5.0),
    // color: Colors.amberAccent[200],
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Text(
            Utils.dateFormatHour(
              model.forecast.forecastday.first.hour[index].time,
            ),
            // model.forecast.forecastday.first.hour[index].time,
            style: Style.meteoInfoStyle(),
          ),
        ),
        Container(
          height: 50.0,
          width: 60.0,
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Utils.codeToImage(
                model.forecast.forecastday.first.hour[index].condition.code,
                model.forecast.forecastday.first.hour[index].time),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            Utils.formatTemp(
                model.forecast.forecastday.first.hour[index].tempC),
            style: Style.primarytextStyle(),
          ),
        ),
      ],
    ),
  );
}
