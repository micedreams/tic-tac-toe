class TicTacToeState {}

class Board extends TicTacToeState {
  final str;
  final result;
  Board({this.str, this.result = "reset"});
}

class ResetCard extends TicTacToeState {}
