import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/remote_services.dart';
import '../models/weather.dart';
import 'cubit/location_cubit.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final LocationCubit locationCubit;
  late StreamSubscription locationSubscription;
  final bool isLoaded;
  WeatherCubit({required this.locationCubit, this.isLoaded = false})
      : super(WeatherState(weather: null)) {
    locationSubscription = locationCubit.stream.listen((locationState) {
      if (locationState is LocationLoaded) {
        getWeather();
      }
    });
  }
  getWeather() async {
    try {
      WeatherService weatherService = WeatherService(
          lats: locationCubit.state.lat, longs: locationCubit.state.long);
      Weather weather = await weatherService.getWeather();
      if (weather != null) {
        emit(WeatherState(weather: weather, isLoaded: true));
      }
    } catch (e) {
      print(e);
    }
  }
}
