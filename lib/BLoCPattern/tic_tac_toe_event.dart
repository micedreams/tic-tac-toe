abstract class TicTacToeEvent {}

class ResetEvent extends TicTacToeEvent {}

class ClickEvent extends TicTacToeEvent {
  final int index;
  ClickEvent(this.index);
}

class AddEvent extends TicTacToeEvent {
  AddEvent();
}

class PlayerEvent extends TicTacToeEvent {
  final bool isSingle;
  PlayerEvent(this.isSingle);
}
