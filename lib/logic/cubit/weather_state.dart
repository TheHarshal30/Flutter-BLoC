part of 'weather_cubit.dart';

@immutable
class WeatherState {
  final Weather? weather;
  final bool isLoaded;
  WeatherState({required this.weather, this.isLoaded = false});
}
