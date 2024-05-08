import 'package:blocs_app/presentation/blocs/01_simple_subit/username_cubit.dart';
import 'package:blocs_app/presentation/blocs/03_multiple_cubit/counter_cubit.dart';
import 'package:blocs_app/presentation/blocs/03_theme/theme_cubit.dart';
import 'package:blocs_app/presentation/blocs/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:blocs_app/config/config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  serviceLocator();
  runApp(const BlocsProviders());
}

class BlocsProviders extends StatelessWidget {
  const BlocsProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<UsernameCubit>()),
        BlocProvider(create: (_) => getIt<RouterSimpleCubit>()),
        BlocProvider(create: (_) => getIt<CounterCubit>()),
        BlocProvider(create: (_) => getIt<ThemeCubit>()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter BLoC',
      debugShowCheckedModeBanner: false,
      routerConfig: context.read<RouterSimpleCubit>().state,
      theme: AppTheme(isDarkmode: context.watch<ThemeCubit>().state.isDarkMode).getTheme(),
    );
  }
}
