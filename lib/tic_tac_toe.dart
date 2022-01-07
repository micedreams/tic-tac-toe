import 'package:flutter/material.dart';

class TicTacToe extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  String reset = "reset";
  var str = List.filled(9, "", growable: false);
  String value = "";

  _box() {
    late String _initialValue;
    setState(() {
      _initialValue = value;
    });
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
      reset = str[0];
    } else if ((str[4] == str[3] && str[4] == str[5] && str[4] != "") ||
        (str[4] == str[1] && str[4] == str[7] && str[4] != "") ||
        (str[4] == str[2] && str[4] == str[6] && str[4] != "")) {
      reset = str[4];
    } else if ((str[8] == str[6] && str[8] == str[7] && str[8] != "") ||
        (str[8] == str[2] && str[8] == str[5] && str[8] != "")) {
      reset = str[8];
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

  @override
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
                  onPressed: () => click(index),
                  child: Text(str[index]),
                )),
              );
            }),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed("/TicTacToe");
            },
            child: Text(
                reset == "reset" || reset == "Draw" ? reset : "$reset Wins"),
          )
        ],
      ),
    );
  }
}
