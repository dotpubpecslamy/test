part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();
  
  @override
  List<Object> get props => [];
}

class DashboardLoadingState extends DashboardState {
  @override
  List<Object> get props => [];
}

class DashBoardLoadedState extends DashboardState {
  final User user;

  const DashBoardLoadedState(this.user);

  @override
  List<Object> get props => [user];
}
