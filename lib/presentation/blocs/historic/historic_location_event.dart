part of 'historic_location_bloc.dart';

sealed class HistoricLocationEvent extends Equatable {
  const HistoricLocationEvent();

  @override
  List<Object> get props => [];
}

class NewLocation extends HistoricLocationEvent {
  const NewLocation(this.location);

  final (double lat, double long) location;

  @override
  List<Object> get props => [location];
}
