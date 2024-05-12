import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/presentation/blocs/01_simple_subit/username_cubit.dart';
import 'package:blocs_app/presentation/blocs/03_multiple_cubit/counter_cubit.dart';
import 'package:blocs_app/presentation/blocs/03_theme/theme_cubit.dart';
import 'package:blocs_app/presentation/blocs/04_guests/guest_bloc.dart';
import 'package:blocs_app/presentation/blocs/geolocation/geolocation_cubit.dart';
import 'package:blocs_app/presentation/blocs/historic/historic_location_bloc.dart';
import 'package:blocs_app/presentation/blocs/pokemon/pokemon_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void serviceLocator() {
  getIt.registerSingleton(UsernameCubit());
  getIt.registerSingleton(RouterSimpleCubit());
  getIt.registerSingleton(CounterCubit());
  getIt.registerSingleton(ThemeCubit());
  getIt.registerSingleton(GuestBloc());
  getIt.registerSingleton(PokemonBloc(fetchPokemonName: PokemonInformation.getPokemonName));
  getIt.registerSingleton(HistoricLocationBloc());
  getIt.registerSingleton(GeolocationCubit(
    onNewUserLocationCallback: getIt<HistoricLocationBloc>().onNewUserLocation,
  )..watchUserLocation());
}
