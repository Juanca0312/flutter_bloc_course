part of 'guest_bloc.dart';

sealed class GuestEvent extends Equatable {
  const GuestEvent();

  @override
  List<Object> get props => [];
}

class SetAllFilterEvent extends GuestEvent {}

class SetInvitedFilterEvent extends GuestEvent {}

class SetNotInvitedFilterEvent extends GuestEvent {}

class SeCustomFilterEvent extends GuestEvent {
  final GuestFilter filter;

  const SeCustomFilterEvent({required this.filter});

  @override
  List<Object> get props => [
        filter,
      ];
}

class AddGuestEvent extends GuestEvent {
  final String name;

  const AddGuestEvent({required this.name});
}

class ToggleGuestEvent extends GuestEvent {
  final String id;

  const ToggleGuestEvent({required this.id});
}
