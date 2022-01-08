import 'package:flutter/material.dart';
import 'package:tic_tac_toe/tic_tac_toe_functions.dart';

class TicTacToe extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  TicTacToeFunctions function = new TicTacToeFunctions();
  String reset = "reset";
  var str = List.filled(9, "", growable: false);
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TicTacToe"),
      ),
      body: Column(
        children: [
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            children: List.generate(9, (index) {
              return GridTile(
                child: Card(
                    child: ElevatedButton(
                  onPressed: () {
                    var click = function.click(index, str);
                    setState(() {
                      reset = click[1];
                      str = click[0];
                    });
                  },
                  child: Text(str[index]),
                )),
              );
            }),
          ),
          ElevatedButton(
            onPressed: () {
              var dispose = function.dispose();
              setState(() {
                reset = dispose[1];
                str = dispose[0];
              });
            },
            child: Text(reset),
          )
        ],
      ),
    );
  }
}
