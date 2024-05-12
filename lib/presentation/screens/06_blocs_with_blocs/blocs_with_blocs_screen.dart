import 'package:blocs_app/presentation/blocs/historic/historic_location_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocsWithBlocsScreen extends StatelessWidget {
  const BlocsWithBlocsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final historicBloc = context.watch<HistoricLocationBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Ubicaciones: ${historicBloc.state.howManyLocations}'),
      ),
      body: Center(
          child: ListView.builder(
        itemCount: historicBloc.state.howManyLocations,
        itemBuilder: (context, index) {
          final location = historicBloc.state.locations[index];
          return ListTile(
            title: Text('Lat: ${location.$1} - Long: ${location.$2}'),
          );
        },
      )),
    );
  }
}
