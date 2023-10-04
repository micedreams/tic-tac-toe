class TicTacToeState {}

class BoardState extends TicTacToeState {
  final str;
  final result;
  BoardState({this.str, this.result = "reset"});
}

class ResetCardState extends TicTacToeState {}
