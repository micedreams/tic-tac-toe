import 'package:flutter/material.dart';
import 'tic_tac_toe.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
