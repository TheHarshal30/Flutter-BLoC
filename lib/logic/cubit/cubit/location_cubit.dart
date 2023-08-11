import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationLoading()) {
    changeLocation();
  }
  Future<void> changeLocation() async {
    if (await Permission.location.isDenied) {
      await Permission.location.request();
    }
    if (await Permission.location.isGranted) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      state.lat = position.latitude.toString();
      state.long = position.longitude.toString();
      String ans = state.lat + "," + state.long;
      emit(LocationLoaded(lat: state.lat, long: state.long));
    }
  }
}
