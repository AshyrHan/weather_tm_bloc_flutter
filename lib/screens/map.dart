import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:weather_tm_bloc/bloc/bloc/weather_bloc.dart';
import 'package:weather_tm_bloc/const.dart';
import 'package:weather_tm_bloc/repository/weather-repo.dart';
import 'package:weather_tm_bloc/screens/weather_ui.dart';
import 'package:weather_tm_bloc/styles/app_style.dart';

class MapTm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks

    return BlocProvider<WeatherBloc>(
        create: (context) =>
            WeatherBloc(weatherRepository: WeatherRepository()),
        child: Scaffold(
          backgroundColor: HexColor('313745'),
          body:
              BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
            if (state is Weatherinitial) {
              return mapWidget(context);
            }
            if (state is WeatherRegionChoosed) {
              return CityChooseWidget(
                map: state.map,
                svgName: state.svgName,
                regionName: state.regionName,
              );
            }
            if (state is WeatherLoaded) {
              return WeatherUI();
            }
            if (state is WeatherLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Container(child: Text('Error'));
            }
          }),
        ));
  }

  Widget mapWidget(BuildContext context) {
    void onTap(Map map, String name, String svgName) {
      // ignore: close_sinks
      final bloc = BlocProvider.of<WeatherBloc>(context);
      bloc.add(ChooseCity(
        map: map,
        regionName: name,
        svgName: svgName,
      ));
    }

    // ignore: close_sinks
    //final blocc = BlocProvider.of<WeatherBloc>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'Welaýatyňyzy saýlaň',
            style: TextStyle(
                color: Colors.white,
                fontFamily: Style.primaryFont,
                fontSize: 18.0),
          ),
        ),
        Center(
          child: Container(
            width: 350,
            height: 350,
            child: Stack(
              children: [
                Align(
                  // balkan
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      print('balkan');

                      onTap(balkanMap, 'BALKAN', 'balkan.svg');
                    },
                    child: SvgPicture.asset(
                      'assets/images/balkan.svg',
                      height: 150,
                    ),
                  ),
                ),
                Positioned(
                  left: 95,
                  bottom: 45,
                  child: GestureDetector(
                    onTap: () {
                      print('ahal');

                      onTap(ahalMap, 'AHAL', 'ahal.svg');
                    },
                    child: SvgPicture.asset(
                      'assets/images/ahal.svg',
                      height: 148,
                    ),
                  ),
                ),
                Positioned(
                  left: 99,
                  top: 83,
                  child: GestureDetector(
                    onTap: () {
                      print('dashoguz');
                      onTap(dashoguzMap, 'DAŞOGUZ', 'dashoguz.svg');
                    },
                    child: SvgPicture.asset(
                      'assets/images/dashoguz.svg',
                      //height: 100,
                      width: 105,
                    ),
                  ),
                ),
                Positioned(
                  right: 45,
                  bottom: 30,
                  child: GestureDetector(
                    onTap: () {
                      print('mary');
                      onTap(maryMap, 'MARY', 'mary.svg');
                    },
                    child: SvgPicture.asset(
                      'assets/images/mary.svg',
                      height: 140,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 85,
                  child: GestureDetector(
                    onTap: () {
                      print('lebap');
                      onTap(lebapMap, 'LEBAP', 'lebap.svg');
                    },
                    child: SvgPicture.asset(
                      'assets/images/lebap.svg',
                      height: 136,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CityChooseWidget extends StatelessWidget {
  final String regionName;
  final Map map;
  final String svgName;

  const CityChooseWidget(
      {Key key, this.regionName, @required this.map, @required this.svgName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    var _weatherbloc = BlocProvider.of<WeatherBloc>(context);
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () => _weatherbloc.add(ToInitial())),
              ],
            ),
            Container(
              height: 300,
              child: SvgPicture.asset('assets/images/$svgName'),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    '$regionName WELAÝATY',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontFamily: Style.primaryFont,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Şäheriňizi saýlaň:',
                style: Style.primarytextStyle().copyWith(color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: map.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 3.0),
                    child: Row(
                      children: [
                        Text(
                          '●',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            print(map.entries.elementAt(index).key);
                            print(map.entries.elementAt(index).value);
                            // ignore: close_sinks

                            _weatherbloc.add(FetchWeather(
                              latlan: map.entries.elementAt(index).value,
                              cityName: map.entries.elementAt(index).key,
                            ));
                          },
                          child: Text(
                            map.entries.elementAt(index).key,
                            style: Style.primarytextStyle()
                                .copyWith(color: Colors.white, fontSize: 16.0),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
