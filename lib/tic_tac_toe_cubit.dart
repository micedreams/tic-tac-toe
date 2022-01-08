import 'package:flutter_bloc/flutter_bloc.dart';

class TicTacToeCubit extends Cubit<List<String>> {
  TicTacToeCubit() : super([]);
  var str = List.filled(9, "", growable: false);

  void getList() async {
    emit(str);
  }
}

class TicTacToeBloc extends Bloc<TicTacToeEvent, TicTacToeState> {
  String reset = "reset";
  var str = List.filled(9, "", growable: false);
  String value = "";
  TicTacToeBloc()
      : super(TicTacToeState(str: List.filled(9, "", growable: false))) {
    on<ResetEvent>((event, emit) =>
        emit(TicTacToeState(str: List.filled(9, "", growable: false))));
    on<ClickEvent>((event, emit) {
      click(event.index);
      emit(TicTacToeState(str: str, result: reset));
    });
  }

  _box() {
    String _initialValue = value;

    if (_initialValue == "X") {
      value = "O";
    } else {
      value = "X";
    }
    return value;
  }

  _checkresult() {
    if ((str[0] == str[1] && str[0] == str[2] && str[0] != "") ||
        (str[0] == str[3] && str[0] == str[6] && str[0] != "") ||
        (str[0] == str[4] && str[0] == str[8] && str[0] != "")) {
      reset = "${str[0]} Winns";
    } else if ((str[4] == str[3] && str[4] == str[5] && str[4] != "") ||
        (str[4] == str[1] && str[4] == str[7] && str[4] != "") ||
        (str[4] == str[2] && str[4] == str[6] && str[4] != "")) {
      reset = "${str[4]} Winns";
    } else if ((str[8] == str[6] && str[8] == str[7] && str[8] != "") ||
        (str[8] == str[2] && str[8] == str[5] && str[8] != "")) {
      reset = "${str[8]} Winns";
    } else if (!str.contains("")) {
      reset = "Draw";
    }
  }

  click(index) {
    if (str[index] == "" && reset == "reset") {
      str[index] = _box();
      if (str.where((e) => e != "").length > 4) _checkresult();
    }
  }
}

abstract class TicTacToeEvent {}

class ResetEvent extends TicTacToeEvent {}

class ClickEvent extends TicTacToeEvent {
  final int index;
  ClickEvent(this.index);
}

class TicTacToeState {
  final str;
  final result;
  TicTacToeState({this.str, this.result = "reset"});
}
