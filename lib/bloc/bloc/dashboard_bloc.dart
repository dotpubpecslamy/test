import 'package:bloc/bloc.dart';
import 'package:bloc_test/services/user.dart';
import 'package:equatable/equatable.dart';

import '../../model/user.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {

  final UserService _userService;

  DashboardBloc(this._userService) : super(DashboardLoadingState()) {
    on<FetchUserEvent>((event, emit) async {
      var user = await _userService.getUser();

      emit(DashBoardLoadedState(user));
    });

    on<CashInEvent>((event, emit) async {
      final state = this.state as DashBoardLoadedState;
      
      double newBalance = event.amt + double.parse(state.user.balance);
      double newPoints = (event.amt * .10) + double.parse(state.user.rewardPoints);
      // print('newBalance $newBalance');
      // print('newBalance $newPoints');

      // event.user.rewardPoints = newPoints.toString();
      // event.user.balance = newBalance.toString();
      // print(event.user.balance);
      // print(event.user.rewardPoints);

      emit(
        DashBoardLoadedState(
          state.user.copyWith(
            balance: newBalance.toString(),
            rewardPoints: newPoints.toString()
          )
        )
      );
    });
  }
}
