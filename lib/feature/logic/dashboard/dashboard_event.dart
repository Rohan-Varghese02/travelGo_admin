part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardEvent {}
class SelectDashboardPage extends DashboardEvent {
  final int index;

  SelectDashboardPage({required this.index});


  @override
  List<Object> get props => [index];
}