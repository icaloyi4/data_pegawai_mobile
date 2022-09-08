import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kiwi/kiwi.dart';
import 'package:ojrek_hris/core/base/base_stateful.dart';
import 'package:ojrek_hris/core/widget/error_text.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:weather/weather.dart';

import '../../../../../core/assets/my_cons.dart';
import '../../bloc/home_bloc.dart';

class WeatherCard extends StatefulWidget {
  @override
  _Weather createState() => _Weather();
}

class _Weather extends BaseState<HomeBloc, HomeState, WeatherCard> {
  var _datenow = new DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.calendar,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("${DateFormat('EEEE').format(_datenow)}",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(
                          width: 10,
                        ),
                        Text("${DateFormat.yMMMMd('en_US').format(_datenow)}"),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                    alignment: Alignment.centerRight,
                    child: DigitalClock(
                      areaWidth: 70,
                      areaDecoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      hourMinuteDigitDecoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      secondDigitDecoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      hourMinuteDigitTextStyle: TextStyle(
                        color: MyCons.darkModeEnabled
                            ? Colors.black38
                            : Colors.blueGrey,
                        fontSize: 15,
                      ),
                    ),
                  ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              StreamBuilder<HomeState>(
                  stream: bloc.stateStream,
                  initialData: LoadingState(),
                  builder: (blocCtx, snapshot) =>
                      mapStateHandler(snapshot.data)),
              // weatherCard(),
            ],
          ),
        ))
      ],
    );
  }

  Widget weatherCard(Weather w) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Row(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Text("Weather",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  Expanded(
                    child: Text(
                      "${w.weatherMain}",
                      textAlign: TextAlign.end,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                child: Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Text("Temperature",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    Expanded(
                      child: Text(
                        "${w.temperature?.celsius?.toStringAsFixed(2)} \u2103",
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Row(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Text("Humidity",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  Expanded(
                    child: Text(
                      "${w.humidity}%",
                      textAlign: TextAlign.end,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                child: Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Text("Wind",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    Expanded(
                      child: Text(
                        "${w.windSpeed} km/h",
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.pushEvent(InitWeather());
  }

  @override
  HomeBloc initBloc() {
    return KiwiContainer().resolve<HomeBloc>();
  }

  @override
  Widget mapStateHandler(HomeState? state) {
    if (state is LoadingState) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(child: Text("Get weather information ...")),
      );
    }
    if (state is ErrorState) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: ErrorText(
            message: state.message,
            tryAgain: () {
              bloc.pushEvent(InitWeather());
            }),
      );
    }
    if (state is GetWeather) {
      return weatherCard(state.weather);
    }
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ErrorText(
          message: "Something Wrong, tap to try again",
          tryAgain: () {
            bloc.pushEvent(InitWeather());
          }),
    );
  }
}
