import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/tic_tac_toe_bloc.dart';
import 'package:tic_tac_toe/tic_tac_toe_event.dart';
import 'package:tic_tac_toe/tic_tac_toe_view.dart';
import 'tic_tac_toe.dart';

void main() {
  runApp(BLoCPatternFlutter());
}

class BLoCPatternFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TicTacToe",
      debugShowCheckedModeBanner: false,
      home: BlocProvider<TicTacToeBloc>(
        create: (context) => TicTacToeBloc()..add(ResetEvent()),
        child: TicTacToeView(),
      ),
    );
  }
}

class Vanilla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TicTacToe",
      debugShowCheckedModeBanner: false,
      home: TicTacToe(),
      routes: {
        "/TicTacToe": (ctx) => TicTacToe(),
      },
    );
  }
}