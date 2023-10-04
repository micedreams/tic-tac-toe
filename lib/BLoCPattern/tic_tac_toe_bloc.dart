import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/BLoCPattern/tic_tac_toe_event.dart';
import 'package:tic_tac_toe/BLoCPattern/tic_tac_toe_state.dart';
import 'package:tic_tac_toe/tic_tac_toe_functions.dart';

class TicTacToeBloc extends Bloc<TicTacToeEvent, TicTacToeState> {
  TicTacToeFunctions function = new TicTacToeFunctions();
  var str = List.filled(9, "", growable: false);
  var isSingle = false;
  TicTacToeBloc() : super(ResetCardState()) {
    on<ResetEvent>((event, emit) {
      var dispose = function.dispose();
      str = dispose[0];
      emit(ResetCardState());
    });

    on<PlayerEvent>((event, emit) {
      isSingle = event.isSingle;
      emit(BoardState(str: str, result: "Reset"));
    });

    on<ClickEvent>((event, emit) {
      var click = function.click(event.index, str);
      emit(BoardState(str: click[0], result: click[1]));

      if (isSingle && str.contains(''))
        Future.delayed(
          const Duration(milliseconds: 500),
          () => add(AddEvent()),
        );
    });

    on<AddEvent>((event, emit) {
      final index = function.getRandomEmptyIndex(str);
      var click = function.click(index, str);
      emit(BoardState(str: click[0], result: click[1]));
    });
  }
}
