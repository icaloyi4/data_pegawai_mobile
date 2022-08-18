import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ojrek_hris/core/base/base_bloc.dart';
import 'package:ojrek_hris/core/base/bloc_event.dart';
import 'package:ojrek_hris/core/base/bloc_state.dart';
import 'package:flutter/foundation.dart';

import '../../../core/assets/my_cons.dart';
import '../../../core/widget/cool_alert.dart';
import '../data/remote/news_response.dart';
import '../domain/repository/home_repository.dart';
import 'package:weather/weather.dart';
part 'home_state.dart';
part 'home_event.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  final HomeRepository _repos;
  bool isOnProcess = false;

  HomeBloc(this._repos);
  @override
  void mapEventToState(HomeEvent event) {
    if (event is InitWeather) {
      initWeather(event);
    }
    if (event is GetNews) {
      getNews(event);
    }
  }

  void initWeather(InitWeather event) async {
    try {
      emitState(LoadingState());
      var position = await _determinePosition();
      // print(position);
      WeatherFactory wf = new WeatherFactory(MyCons.WEATHER_API_KEY);
      Weather w = await wf.currentWeatherByLocation(
          position.latitude, position.longitude);
      // print(w);
      emitState(GetWeather(w));
    } catch (e) {
      emitState(ErrorState('Connection Timeout'));
      print(e);
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  void getNews(GetNews event) async {
    emitState(LoadingState());
    await _repos.getNews(limit: event.limit,
      onSuccess: (news) {
        emitState(SuccessGetNews(news));
      },
      onError: (message, code) {
        emitState(ErrorGetNews());
        AlertMessage.showAlert(event.context,
            title: "Failed",
            message: "[$code] $message",
            type: CoolAlertType.error);
      },
    );
  }
}
