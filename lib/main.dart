import 'package:flutter/material.dart';
import 'tic_tac_toe.dart';

void main() {
  runApp(VanillaFlutter());
}

class VanillaFlutter extends StatelessWidget {
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
