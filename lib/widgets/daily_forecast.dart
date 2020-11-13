import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_tm_bloc/styles/app_style.dart';

class DailyForecast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            child: dailyItem(context),
          );
        },
      ),
    );
  }

  Widget dailyItem(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: size.width * 0.40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '13 noyabr',
                  style: Style.meteoInfoStyle(),
                ),
                Text(
                  'Shu gun',
                  style: Style.primarytextStyle(),
                ),
              ],
            ),
          ),

          //

          Container(
            width: 50.0,
            height: 40.0,
            child: Padding(
              padding: EdgeInsets.all(1.0),
              child: SvgPicture.asset('assets/images/partyCloudly.svg'),
            ),
          ),

          //

          Container(
            child: Text(
              '+11\'C',
              style: Style.primarytextStyle(),
            ),
          ),

          //

          Container(
            child: Text(
              '+8\'C',
              style: Style.meteoInfoStyle(),
            ),
          ),
        ],
      ),
    );
  }
}
