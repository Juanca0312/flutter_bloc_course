import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/domain/entities/todo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

part 'guest_event.dart';
part 'guest_state.dart';

const uuId = Uuid();

class GuestBloc extends Bloc<GuestEvent, GuestState> {
  GuestBloc()
      : super(GuestState(guests: [
          Todo(id: uuId.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
          Todo(id: uuId.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
          Todo(id: uuId.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now()),
          Todo(id: uuId.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
          Todo(id: uuId.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now()),
          Todo(id: uuId.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
        ])) {
    on<SetInvitedFilterEvent>((event, emit) {
      emit(state.copyWith(filter: GuestFilter.invited));
    });

    on<SetAllFilterEvent>((event, emit) {
      emit(state.copyWith(filter: GuestFilter.all));
    });

    on<SetNotInvitedFilterEvent>((event, emit) {
      emit(state.copyWith(filter: GuestFilter.noInvited));
    });

    on<SeCustomFilterEvent>((event, emit) {
      emit(state.copyWith(filter: event.filter));
    });

    on<AddGuestEvent>((event, emit) {
      final newGuest = Todo(id: uuId.v4(), description: event.name, completedAt: null);
      emit(state.copyWith(guests: [...state.guests, newGuest]));
    });

    on<ToggleGuestEvent>((event, emit) {
      final newGuests = state.guests.map((guest) {
        if (guest.id == event.id) {
          return guest.copyWith(completedAt: guest.completedAt == null ? DateTime.now() : null);
        } else {
          return guest;
        }
      }).toList();
      emit(state.copyWith(guests: newGuests));
    });
  }

  void changeFilter(GuestFilter newFilter) {
    switch (newFilter) {
      case GuestFilter.all:
        add(SetAllFilterEvent());
        break;
      case GuestFilter.invited:
        add(SetInvitedFilterEvent());
        break;
      case GuestFilter.noInvited:
        add(SetNotInvitedFilterEvent());
        break;
      default:
    }
  }
}
