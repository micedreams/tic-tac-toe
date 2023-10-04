import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/BLoCPattern/tic_tac_toe_event.dart';
import 'package:tic_tac_toe/BLoCPattern/tic_tac_toe_state.dart';
import 'package:tic_tac_toe/tic_tac_toe_functions.dart';

class TicTacToeBloc extends Bloc<TicTacToeEvent, TicTacToeState> {
  TicTacToeFunctions function = new TicTacToeFunctions();
  var str = List.filled(9, "", growable: false);
  TicTacToeBloc()
      : super(TicTacToeState(str: List.filled(9, "", growable: false))) {
    on<ResetEvent>((event, emit) {
      var dispose = function.dispose();
      str = dispose[0];
      emit(TicTacToeState(str: dispose[0], result: dispose[1]));
    });
    on<ClickEvent>((event, emit) {
      var click = function.click(event.index, str);
      emit(TicTacToeState(str: click[0], result: click[1]));

      if (str.contains(''))
        Future.delayed(
          const Duration(milliseconds: 500),
          () => add(AddEvent()),
        );
    });

    on<AddEvent>((event, emit) {
      final index = function.getRandomEmptyIndex(str);
      var click = function.click(index, str);
      emit(TicTacToeState(str: click[0], result: click[1]));
    });
  }
}
