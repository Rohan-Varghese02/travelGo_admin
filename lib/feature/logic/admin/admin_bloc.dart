import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:travelgo_admin/core/service/api_services.dart';

part 'admin_event.dart';
part 'admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  AdminBloc() : super(AdminInitial()) {
    // Category Action  -- Country//
    on<CountryAddButton>(countryAddButton);
    on<CountryAdd>(countryAdd);
    on<CountryEditEvent>(countryEditEvent);
    on<CountryUpdateEvent>(countryUpdateEvent);
    on<CountryDeleteBtn>(countryDeleteBtn);
    on<CountryDeleting>(countryDeleting);
  }

  FutureOr<void> countryAddButton(
    CountryAddButton event,
    Emitter<AdminState> emit,
  ) {
    emit(CountryAddMenuOpen());
  }

  FutureOr<void> countryAdd(CountryAdd event, Emitter<AdminState> emit) async {
    final api = ApiServices();
    api.addCountryCategory(event.country);
    emit(CountryAdded());
  }

  FutureOr<void> countryEditEvent(
    CountryEditEvent event,
    Emitter<AdminState> emit,
  ) {
    emit(EditCountryState(name: event.name, id: event.id));
  }

  FutureOr<void> countryUpdateEvent(
    CountryUpdateEvent event,
    Emitter<AdminState> emit,
  ) {
    final api = ApiServices();
    api.editCountryCategory(event.name, event.id);
    emit(CountryUpdated());
  }

  FutureOr<void> countryDeleteBtn(
    CountryDeleteBtn event,
    Emitter<AdminState> emit,
  ) {
    emit(DeleteIntitateCountryState(id: event.id, name: event.name));
  }

  FutureOr<void> countryDeleting(
    CountryDeleting event,
    Emitter<AdminState> emit,
  ) {
    final api = ApiServices();
    api.deleteCountryCategory(event.id);
    emit(CountryDeletedSuccessful());
  }
}
