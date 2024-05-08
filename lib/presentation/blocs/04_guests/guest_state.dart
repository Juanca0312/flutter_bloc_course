part of 'guest_bloc.dart';

enum GuestFilter { all, invited, noInvited }

class GuestState extends Equatable {
  const GuestState({this.filter = GuestFilter.all, this.guests = const []});

  final GuestFilter filter;
  final List<Todo> guests;

  GuestState copyWith({
    GuestFilter? filter,
    List<Todo>? guests,
  }) =>
      GuestState(
        filter: filter ?? this.filter,
        guests: guests ?? this.guests,
      );

  get filteredGuests {
    switch (filter) {
      case GuestFilter.invited:
        return guests.where((guest) => guest.done).toList();
      case GuestFilter.noInvited:
        return guests.where((guest) => !guest.done).toList();
      case GuestFilter.all:
        return guests;
    }
  }

  @override
  List<Object> get props => [
        filter,
        guests,
      ];
}
