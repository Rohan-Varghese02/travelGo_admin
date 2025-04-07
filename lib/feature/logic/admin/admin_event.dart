part of 'admin_bloc.dart';

@immutable
sealed class AdminEvent {}

// Category Action  -- Country//
class CountryAddButton extends AdminEvent {}

class CountryAdd extends AdminEvent {
  final String country;

  CountryAdd({required this.country});
}

// Category Action  -- Common for Both Category//
class CategoryEditEvent extends AdminEvent {
  final String name;
  final String id;

  CategoryEditEvent({required this.name, required this.id});
}

class CategoryUpdateEvent extends AdminEvent {
  final String name;
  final String id;

  CategoryUpdateEvent({required this.name, required this.id});
}

class CategoryDeleteBtn extends AdminEvent {
  final String name;
  final String id;

  CategoryDeleteBtn({required this.id, required this.name});
}

class CategoryDeleting extends AdminEvent {
  final String id;

  CategoryDeleting({required this.id});
}

// Category Action  -- Event//

class EventAddButton extends AdminEvent {}

class EventAddEvent extends AdminEvent {
  final String event;

  EventAddEvent({required this.event});
}

// Pending Organizer

class AcceptOrganizer extends AdminEvent {
  final String id;

  AcceptOrganizer({required this.id});
}

class RejectOrganizer extends AdminEvent {
  final String id;

  RejectOrganizer({required this.id});
  
}
