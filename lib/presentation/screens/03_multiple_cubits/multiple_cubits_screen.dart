import 'package:blocs_app/presentation/blocs/03_multiple_cubit/counter_cubit.dart';
import 'package:blocs_app/presentation/blocs/03_theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultipleCubitScreen extends StatelessWidget {
  const MultipleCubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = context.watch<CounterCubit>();
    final themeCubit = context.watch<ThemeCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiple Cubits'),
      ),
      body: Center(
          child: Column(
        children: [
          const Spacer(
            flex: 1,
          ),
          IconButton(
            icon: Icon(themeCubit.state.isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined, size: 100),
            onPressed: () => themeCubit.toggleTheme(),
          ),
          const Text('Fernando Herrera', style: TextStyle(fontSize: 25)),
          TextButton.icon(
            icon: const Icon(
              Icons.add,
              size: 50,
            ),
            label: Text(counterCubit.state.toString(), style: TextStyle(fontSize: 100)),
            onPressed: () => counterCubit.incrementBy(2),
          ),
          const Spacer(flex: 2),
        ],
      )),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Nombre aleatorio'),
        icon: const Icon(Icons.refresh_rounded),
        onPressed: () {},
      ),
    );
  }
}
