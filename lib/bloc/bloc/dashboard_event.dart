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

  const CashInEvent(this.amt);

  @override
  List<Object> get props => [amt];
}


