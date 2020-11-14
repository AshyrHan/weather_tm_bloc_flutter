import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:weather_tm_bloc/bloc/bloc/weather_bloc.dart';
import 'package:weather_tm_bloc/const.dart';
import 'package:weather_tm_bloc/styles/app_style.dart';

Widget customAppBar(BuildContext context) {
  // ignore: close_sinks
  final weatherBloc = BlocProvider.of<WeatherBloc>(context);
  return SafeArea(
    child: Container(
      height: 30.0,
      //   color: Colors.red,
      child: Row(
        children: [
          IconButton(
              icon: Icon(
                Icons.menu,
                color: HexColor('2E3442'),
              ),
              onPressed: () {
                weatherBloc.add(FetchWeather(latlan: maryCity));
              }),
        ],
      ),
    ),
  );
}

Widget cityName(BuildContext context) {
  return Container(
    // color: Colors.amber,
    height: MediaQuery.of(context).size.height * 0.12,
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        Text(
          'Mary',
          style: Style.cityNameStyle(),
        ),
        Text(
          'Turkmenistan',
          style: Style.stateNameStyle(),
        )
      ],
    ),
  );
}

Widget weatherIcon(BuildContext context) {
  return Container(
      //   color: Colors.lightBlue,
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.6,
      child: Container(
        child: Image.asset('assets/images/main.png'),
      ));
}

Widget currentWeather(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return Container(
      //     color: Colors.lightBlue,
      padding: EdgeInsets.only(left: 20.0),
      height: size.height * 0.15,
      width: size.width,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [leftMeteoInfo(context), currentDegree()],
          ),
        ],
      ));
}

Widget leftMeteoInfo(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.30,
    //color: Colors.amber,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(0.0),
                child: SvgPicture.asset(
                  'assets/images/wind.svg',
                  color: Style.primaryColor,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                '8 km/sag',
                style: Style.meteoInfoStyle(),
              ),
              Padding(
                padding: EdgeInsets.all(0.0),
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
                padding: EdgeInsets.all(0.0),
                child: SvgPicture.asset(
                  'assets/images/humadity.svg',
                  color: Style.primaryColor,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                '87%',
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
                padding: EdgeInsets.all(0.0),
                child: SvgPicture.asset(
                  'assets/images/pressure.svg',
                  color: Style.primaryColor,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                '746 mm r.s.',
                style: Style.meteoInfoStyle(),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget currentDegree() {
  return Container(
    child: Column(
      children: [
        Text(
          '35\'C',
          style: Style.currentDegreeStyle(),
        ),
        Text(
          'bulutly',
          style: Style.conditionNameStyle(),
        )
      ],
    ),
  );
}

Widget hourWeather(BuildContext context) {
  return Container(
    //  color: Colors.redAccent,
    height: 100,
    child: ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: [
        SizedBox(
          width: 20.0,
        ),
        ListView.builder(
          //physics: AlwaysScrollableScrollPhysics(),
          itemCount: 23,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return hourWeatherWidget(index);
          },
        ),
      ],
    ),
  );
}

Widget hourWeatherWidget(index) {
  return Container(
    margin: EdgeInsets.only(right: 5.0),
    // color: Colors.amberAccent[200],
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Text(
            '$index:00',
            style: Style.meteoInfoStyle(),
          ),
        ),
        Container(
          height: 50.0,
          width: 60.0,
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: SvgPicture.asset('assets/images/partyCloudly.svg'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            '+11\'C',
            style: Style.primarytextStyle(),
          ),
        ),
      ],
    ),
  );
}
