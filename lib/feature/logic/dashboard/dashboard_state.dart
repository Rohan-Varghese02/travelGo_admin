part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardState {}


class DashboardInitial extends DashboardState {}

// Specific states for different pages (optional if you want to track more than just index)
class DashboardPageSelected extends DashboardState {
  final int selectedIndex;

   DashboardPageSelected(this.selectedIndex);


  List<Object?> get props => [selectedIndex];
}