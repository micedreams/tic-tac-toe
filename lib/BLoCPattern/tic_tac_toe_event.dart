abstract class TicTacToeEvent {}

class ResetEvent extends TicTacToeEvent {}

class ClickEvent extends TicTacToeEvent {
  final int index;
  ClickEvent(this.index);
}