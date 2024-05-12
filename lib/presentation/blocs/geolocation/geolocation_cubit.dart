import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

part 'geolocation_state.dart';

class GeolocationCubit extends Cubit<GeolocationState> {
  final void Function((double lat, double long) location)? onNewUserLocationCallback;

  GeolocationCubit({
    this.onNewUserLocationCallback,
  }) : super(const GeolocationState());

  Future<void> checkStatus() async {
    final serviceEnable = await Geolocator.isLocationServiceEnabled();
    LocationPermission permissionGranted = await Geolocator.checkPermission();
    if (permissionGranted == LocationPermission.denied) {
      permissionGranted = await Geolocator.requestPermission();
    }

    emit(state.copyWith(
      serviceEnable: serviceEnable,
      permissionGranted: permissionGranted == LocationPermission.always || permissionGranted == LocationPermission.whileInUse,
    ));
  }

  Future<void> watchUserLocation() async {
    await checkStatus();
    if (state.serviceEnable && state.permissionGranted) {
      const locationSettings = LocationSettings(
        accuracy: LocationAccuracy.bestForNavigation,
        distanceFilter: 15,
      );

      Geolocator.getPositionStream(locationSettings: locationSettings).listen((position) {
        onNewUserLocationCallback?.call((position.latitude, position.longitude));
        emit(state.copyWith(
          location: (position.latitude, position.longitude),
        ));
      });
    }
  }
}
