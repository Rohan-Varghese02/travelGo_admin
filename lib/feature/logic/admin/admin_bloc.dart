import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:travelgo_admin/core/service/api_services.dart';
import 'package:travelgo_admin/data/models/request_data.dart';

part 'admin_event.dart';
part 'admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  AdminBloc() : super(AdminInitial()) {
    // Category Action  -- Country//
    on<CountryAddButton>(countryAddButton);
    on<CountryAdd>(countryAdd);
    on<CategoryEditEvent>(countryEditEvent);
    on<CategoryUpdateEvent>(countryUpdateEvent);
    on<CategoryDeleteBtn>(countryDeleteBtn);
    on<CategoryDeleting>(countryDeleting);

    // Category Action  -- Event//
    on<EventAddButton>(eventAddButton);
    on<EventAddEvent>(eventAddEvent);

    // Pending Organizer
    on<AcceptOrganizer>(acceptOrganizer);
    on<RejectOrganizer>(rejectOrganizer);

    ///
    on<IsFeaturedSwitch>(isFeaturedSwitch);
    //Dashboard
    on<RequestAccept>(requestAccept);
    on<RequestReject>(requestReject);
  }

  // Category Action  -- Country//
  FutureOr<void> countryAddButton(
    CountryAddButton event,
    Emitter<AdminState> emit,
  ) {
    emit(CountryAddMenuOpen());
  }

  FutureOr<void> countryAdd(CountryAdd event, Emitter<AdminState> emit) async {
    final api = ApiServices();
    api.addCountryCategory(event.country);
    emit(CategoryAdded());
  }

  FutureOr<void> countryEditEvent(
    CategoryEditEvent event,
    Emitter<AdminState> emit,
  ) {
    emit(EditCategoryState(name: event.name, id: event.id));
  }

  FutureOr<void> countryUpdateEvent(
    CategoryUpdateEvent event,
    Emitter<AdminState> emit,
  ) {
    final api = ApiServices();
    api.editCountryCategory(event.name, event.id);
    emit(CategoryUpdated());
  }

  FutureOr<void> countryDeleteBtn(
    CategoryDeleteBtn event,
    Emitter<AdminState> emit,
  ) {
    emit(DeleteIntitateCategoryState(id: event.id, name: event.name));
  }

  FutureOr<void> countryDeleting(
    CategoryDeleting event,
    Emitter<AdminState> emit,
  ) {
    final api = ApiServices();
    api.deleteCountryCategory(event.id);
    emit(CategoryDeletedSuccessful());
  }

  // Category Action  -- Event//

  FutureOr<void> eventAddButton(
    EventAddButton event,
    Emitter<AdminState> emit,
  ) {
    emit(EventAddMenuOpen());
  }

  FutureOr<void> eventAddEvent(EventAddEvent event, Emitter<AdminState> emit) {
    final api = ApiServices();
    api.addEventCategory(event.event);
    emit(EventAddedSuccessfully());
  }

  FutureOr<void> acceptOrganizer(
    AcceptOrganizer event,
    Emitter<AdminState> emit,
  ) {
    final api = ApiServices();
    api.acceptOrganizer(event.id);
    emit(OrganizerAccepted());
  }

  FutureOr<void> rejectOrganizer(
    RejectOrganizer event,
    Emitter<AdminState> emit,
  ) {
    final api = ApiServices();
    api.rejectOrganizer(event.id);
    emit(OrganizerRejected());
  }

  FutureOr<void> isFeaturedSwitch(
    IsFeaturedSwitch event,
    Emitter<AdminState> emit,
  ) {
    bool isFeature = !event.isFeatured;
    log(isFeature.toString());
    ApiServices().isFeatureCategory(isFeature, event.uid);
    emit(FeatureStatus());
  }

  FutureOr<void> requestAccept(
    RequestAccept event,
    Emitter<AdminState> emit,
  ) async {
    try {
      await ApiServices().approveRequest(event.request);
      emit(RequestStatus(message: 'Request status Approved'));
    } catch (e) {
      print(e);
    }
  }

  FutureOr<void> requestReject(
    RequestReject event,
    Emitter<AdminState> emit,
  ) async {
    try {
      await ApiServices().rejectRequest(event.request);
      emit(RequestStatus(message: 'Request status Declined'));
    } catch (e) {
      print(e);
    }
  }
}
