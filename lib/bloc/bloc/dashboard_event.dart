part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class FetchUserEvent extends DashboardEvent {
  @override
  List<Object> get props => [];
}

class CashInEvent extends DashboardEvent {
  final double amt;
  final User user;

  const CashInEvent(this.amt, this.user);

  @override
  List<Object> get props => [amt, user];
}


