part of 'historic_location_bloc.dart';

/// State for [HistoricLocationBloc]
class HistoricLocationState extends Equatable {
  /// Creates a [HistoricLocationState]
  const HistoricLocationState({
    this.locations = const [],
  });

  /// List of locations
  final List<(double lat, double long)> locations;

  int get howManyLocations => locations.length;

  /// Copy of the state with new values
  HistoricLocationState copyWith({
    List<(double lat, double long)>? locations,
  }) =>
      HistoricLocationState(
        locations: locations ?? this.locations,
      );

  @override
  List<Object> get props => [locations];
}
