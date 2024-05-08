import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/presentation/blocs/01_simple_subit/username_cubit.dart';
import 'package:blocs_app/presentation/blocs/03_multiple_cubit/counter_cubit.dart';
import 'package:blocs_app/presentation/blocs/03_theme/theme_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void serviceLocator() {
  getIt.registerSingleton(UsernameCubit());
  getIt.registerSingleton(RouterSimpleCubit());
  getIt.registerSingleton(CounterCubit());
  getIt.registerSingleton(ThemeCubit());
}
