import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_tm_bloc/bloc/bloc/weather_bloc.dart';
import 'package:weather_tm_bloc/const.dart';
import 'package:weather_tm_bloc/styles/app_style.dart';
import 'package:weather_tm_bloc/utils.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Drawer(
        child: Container(
          color: Style.bgColor,
          child: ListView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            shrinkWrap: true,
            children: [
              BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
                if (state is WeatherLoaded) {
                  return Container(
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                      tileColor: Colors.blue[200],
                      title: Text(
                        'Saýlanan şäher',
                        style: Style.primarytextStyle(),
                      ),
                      subtitle: Text(
                        state.nameCity ?? '',
                        style: Style.conditionNameStyle(),
                      ),
                      trailing: Container(
                        width: 90.0,
                        alignment: Alignment.centerRight,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: Utils.codeToImage(
                                state.weatherModel.current.condition.code,
                                DateTime.now().toString(),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Text(
                                Utils.formatTemp(
                                  state.weatherModel.current.temp_c,
                                ),
                                style: Style.conditionNameStyle(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                return Container();
              }),
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
              Divider(),
              ListTile(
                title: Text('created by:'),
                subtitle: Text(
                  'Yyldyrym.Design',
                  style: Style.primarytextStyle(),
                ),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }

  Widget expTile(Map cities, String title) {
    return ExpansionTileCard(
        baseColor: Style.bgColor,
        expandedColor: Style.bgColor,
        elevation: 0,
        animateTrailing: true,
        title: Text(title,
            style: Style.primarytextStyle()
                .copyWith(fontSize: 16.0, fontWeight: FontWeight.w600)),
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: cities.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () async {
                    // ignore: close_sinks
                    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
                    weatherBloc.add(FetchWeather(
                      latlan: cities.entries.elementAt(index).value,
                      cityName: cities.entries.elementAt(index).key,
                    ));
                  },
                  title: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(cities.entries.elementAt(index).key,
                        style: Style.primarytextStyle()),
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
