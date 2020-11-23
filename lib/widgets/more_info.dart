import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_tm_bloc/models/weather_model.dart';
import 'package:weather_tm_bloc/styles/app_style.dart';
import 'package:weather_tm_bloc/utils.dart';

class MoreInfo extends StatelessWidget {
  final WeatherCurrentModel model;

  MoreInfo({Key key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Howanyň ortaça gözkezijileri',
                  style: Style.primarytextStyle()
                      .copyWith(fontWeight: FontWeight.w600))
            ],
          ),
          Divider(),
          moreTemp(context),
          Divider(),
          moreInfoWidget(),
        ],
      ),
    );
  }

  Widget moreTemp(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    child: SvgPicture.asset(
                      'assets/images/temp.svg',
                      height: 20,
                      color: Colors.red,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Iň beýik\ntemperatura',
                      style: Style.meteoInfoStyle(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  //Divider(),
                  Text(
                      Utils.formatTemp(
                          model.forecast.forecastday.first.day.maxTemp),
                      style: Style.meteoInfoStyle()),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    child: SvgPicture.asset(
                      'assets/images/temp.svg',
                      height: 20,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Ortaça\ntemperatura',
                      style: Style.meteoInfoStyle(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                      Utils.formatTemp(
                          model.forecast.forecastday.first.day.avgTemp),
                      style: Style.meteoInfoStyle()),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    child: SvgPicture.asset(
                      'assets/images/temp.svg',
                      height: 20,
                      color: Colors.blue,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Iň pes\ntemperatura',
                      style: Style.meteoInfoStyle(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // Divider(),
                  Text(
                      Utils.formatTemp(
                          model.forecast.forecastday.first.day.minTemp),
                      style: Style.meteoInfoStyle()),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget moreInfoWidget() {
    return Container(
      child: Column(
        children: [
          Container(
            height: 100.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          child: SvgPicture.asset(
                            'assets/images/pressure.svg',
                            height: 20,
                            color: Colors.blue,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Basyşlyk',
                            style: Style.meteoInfoStyle(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        //Divider(),
                        Text(
                            '${model.current.pressureMb?.round().toString()}mm/r.s',
                            style: Style.meteoInfoStyle()),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          child: SvgPicture.asset(
                            'assets/images/uv.svg',
                            height: 20,
                            color: Colors.blue,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Magnit güýji',
                            style: Style.meteoInfoStyle(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Text(
                            model.forecast.forecastday.first.day.uv
                                ?.round()
                                .toString(),
                            style: Style.meteoInfoStyle()),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.visibility_sharp,
                          size: 20.0,
                          color: Colors.blue,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Görüjilik',
                            style: Style.meteoInfoStyle(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        // Divider(),
                        Text('${model.current.visKm?.round().toString()} km',
                            style: Style.meteoInfoStyle()),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          Container(
            height: 100.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          child: SvgPicture.asset(
                            'assets/images/humadity.svg',
                            height: 20,
                            color: Colors.blue,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Çyglylyk',
                            style: Style.meteoInfoStyle(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        //Divider(),
                        Text(
                            '${model.forecast.forecastday.first.day.avghumidity?.round().toString()}%',
                            style: Style.meteoInfoStyle()),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          child: SvgPicture.asset(
                            'assets/images/wind.svg',
                            height: 20,
                            color: Colors.blue,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Şemal',
                            style: Style.meteoInfoStyle(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Text(
                            '${model.forecast.forecastday.first.day.maxWind?.round().toString()}km/sag çenli',
                            style: Style.meteoInfoStyle()),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          child: SvgPicture.asset(
                            'assets/images/precip.svg',
                            height: 18,
                            color: Colors.blue,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Ygal, mm',
                            style: Style.meteoInfoStyle(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        // Divider(),
                        Text(
                            '${model.forecast.forecastday.first.day.totalPrecip.toString()}mm',
                            style: Style.meteoInfoStyle()),
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
