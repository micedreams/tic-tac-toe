import 'package:flutter_bloc/flutter_bloc.dart';

class TicTacToeCubit extends Cubit<List<String>> {
  TicTacToeCubit() : super([]);
  var str = List.filled(9, "", growable: false);

  void getList() async {
    emit(str);
  }
}
