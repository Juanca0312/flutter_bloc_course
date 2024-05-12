import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'historic_location_event.dart';
part 'historic_location_state.dart';

class HistoricLocationBloc extends Bloc<HistoricLocationEvent, HistoricLocationState> {
  HistoricLocationBloc() : super(const HistoricLocationState()) {
    on<NewLocation>((event, emit) {
      emit(state.copyWith(locations: [...state.locations, event.location]));
    });
  }

  void onNewUserLocation((double lat, double long) location) {
    add(NewLocation(location));
  }
}
