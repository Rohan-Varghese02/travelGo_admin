part of 'admin_bloc.dart';

@immutable
sealed class AdminState {}

final class AdminInitial extends AdminState {}

// Category Action  -- Country//
class CountryAddMenuOpen extends AdminState {}

class CategoryAdded extends AdminState {}

// Category Action  -- Common for both category//
class EditCategoryState extends AdminState {
  final String name;
  final String id;

  EditCategoryState({required this.name, required this.id});
}

class CategoryUpdated extends AdminState {}

class DeleteIntitateCategoryState extends AdminState {
  final String name;
  final String id;

  DeleteIntitateCategoryState({required this.id, required this.name});
}

class CategoryDeletedSuccessful extends AdminState{
  
}

// Category Action  -- Event//
class EventAddMenuOpen extends AdminState{}

class EventAddedSuccessfully extends AdminState{}

// Pending Organizer --- Event
class OrganizerAccepted extends AdminState{}

class OrganizerRejected extends AdminState{}