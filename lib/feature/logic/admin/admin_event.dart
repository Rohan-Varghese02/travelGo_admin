part of 'admin_bloc.dart';

@immutable
sealed class AdminEvent {}

class CountryAddButton extends AdminEvent {}

// Category Action  -- Country//
class CountryAdd extends AdminEvent {
  final String country;

  CountryAdd({required this.country});
}

class CountryEditEvent extends AdminEvent {
  final String name;
  final String id;

  CountryEditEvent({required this.name, required this.id});
}

class CountryUpdateEvent extends AdminEvent {
  final String name;
  final String id;

  CountryUpdateEvent({required this.name, required this.id});
}

class CountryDeleteBtn extends AdminEvent {
  final String name;
  final String id;

  CountryDeleteBtn({required this.id, required this.name});
}

class CountryDeleting extends AdminEvent {
  final String id;

  CountryDeleting({required this.id});
}
