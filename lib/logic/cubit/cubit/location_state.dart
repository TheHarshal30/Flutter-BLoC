part of 'location_cubit.dart';

@immutable
abstract class LocationState {
  String lat;
  String long;
  LocationState({required this.lat, required this.long});
}

class LocationLoading extends LocationState {
  LocationLoading() : super(lat: "", long: "");
}

class LocationLoaded extends LocationState {
  LocationLoaded({required String lat, required String long})
      : super(lat: lat, long: long);
}
