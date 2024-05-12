import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final Future<String> Function(int pokemonId) _fetchPokemonName;

  PokemonBloc({
    required Future<String> Function(int pokemonId) fetchPokemonName,
  })  : _fetchPokemonName = fetchPokemonName,
        super(const PokemonState()) {
    on<PokemonAdd>((event, emit) {
      final pokemons = Map<int, String>.from(state.pokemons);
      pokemons[event.id] = event.name;
      emit(state.copyWith(pokemons: pokemons));
    });
  }

  Future<String> fetchPokemonName(int id) async {
    if (state.pokemons.containsKey(id)) {
      return state.pokemons[id]!;
    }

    try {
      final pokemonName = await _fetchPokemonName(id);
      add(PokemonAdd(id: id, name: pokemonName));
      return pokemonName;
    } catch (e) {
      throw Exception('Failed to fetch pokemon name');
    }
  }
}
