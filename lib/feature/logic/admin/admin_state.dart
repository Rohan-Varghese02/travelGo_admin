part of 'admin_bloc.dart';

@immutable
sealed class AdminState {}

final class AdminInitial extends AdminState {}

// Category Action  -- Country//
class CountryAddMenuOpen extends AdminState {}

class CountryAdded extends AdminState {}

class EditCountryState extends AdminState {
  final String name;
  final String id;

  EditCountryState({required this.name, required this.id});
}

class CountryUpdated extends AdminState {}

class DeleteIntitateCountryState extends AdminState {
  final String name;
  final String id;

  DeleteIntitateCountryState({required this.id, required this.name});
}

class CountryDeletedSuccessful extends AdminState{
  
}