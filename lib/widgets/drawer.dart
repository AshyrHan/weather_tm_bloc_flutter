import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_tm_bloc/bloc/bloc/weather_bloc.dart';
import 'package:weather_tm_bloc/bloc/choose_bloc/bloc/choosebloc_bloc.dart';
import 'package:weather_tm_bloc/const.dart';

import 'package:weather_tm_bloc/styles/app_style.dart';

// ignore: must_be_immutable
class DrawerWidget extends StatelessWidget {
  getCity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('city') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final cBloc = BlocProvider.of<ChooseblocBloc>(context);
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Drawer(
        child: ListView(
          physics: AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            Container(
              color: Colors.blue[200],
              child: ListTile(
                title: Text(
                  'Saýlanan şäher',
                  style: Style.primarytextStyle(),
                ),
                subtitle: Text(
                  getCity(),
                  style: Style.conditionNameStyle(),
                ),
                trailing: Container(
                  width: 80.0,
                  child: Row(
                    children: [
                      Icon(
                        Icons.wb_sunny,
                        color: Colors.yellow,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text('+17\'C'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: expTile(ahalMap, 'Ahal welayat'),
            ),
            Container(
              child: expTile(balkanMap, 'Balkan welayat'),
            ),
            Container(
              child: expTile(dashoguzMap, 'Dashoguz welayat'),
            ),
            Container(
              child: expTile(maryMap, 'Mary welayat'),
            ),
            Container(
              child: expTile(lebapMap, 'Lebap welayat'),
            ),
            IconButton(
                icon: Icon(Icons.gps_off),
                onPressed: () {
                  cBloc.add(OnTapedInitial());
                  print('object');
                })
            //  ButtonInitial(),
          ],
        ),
      ),
    );
  }

  Widget expTile(Map cities, String title) {
    return ExpansionTileCard(
        elevation: 0,
        animateTrailing: true,
        title: Text(
          title,
          style: Style.primarytextStyle(),
        ),
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: cities.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    // ignore: close_sinks
                    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
                    weatherBloc.add(FetchWeather(
                      latlan: cities.entries.elementAt(index).value,
                      cityName: cities.entries.elementAt(index).key,
                    ));
                    prefs.setString(
                        'city', cities.entries.elementAt(index).key);
                  },
                  title: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      cities.entries.elementAt(index).key,
                      style: Style.primarytextStyle(),
                    ),
                  ),
                  // trailing: IconButton(
                  //     icon: Icon(
                  //       Icons.star_border,
                  //       //color: Colors.yellow,
                  //     ),
                  //     onPressed: () {}),
                );
              }),
        ]);
  }

//   Map _ahalMap = {'ashgabat': '1010', 'anew': '1020', 'ak bugday': '1030'};
//   Map _balkanMap = {'ashgabat': '1010', 'anew': '1020', 'ak bugday': '1030'};
//   Map _dashoguzMap = {'ashgabat': '1010', 'anew': '1020', 'ak bugday': '1030'};
//   Map _maryMap = {'ashgabat': '1010', 'anew': '1020', 'ak bugday': '1030'};
//   Map _lebapMap = {'ashgabat': '1010', 'anew': '1020', 'ak bugday': '1030'};
// }

}

// class ButtonInitial extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<ChooseblocBloc>(
//       create: (context) => ChooseblocBloc(),
//       child: IconButton(
//         icon: Icon(Icons.get_app),
//         onPressed: () {
//           // ignore: close_sinks
//           var _choosebloc = BlocProvider.of<ChooseblocBloc>(context);
//           _choosebloc.add(OnTapedInitial());
//           print('pressed');
//         },
//       ),
//     );
//   }
// }
