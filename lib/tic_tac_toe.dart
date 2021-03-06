import 'package:flutter/material.dart';

class TicTacToe extends StatefulWidget {
  static const routeName = '/TicTacToe';

  @override
  State<StatefulWidget> createState() => new _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  int clickCount = 0;
  int xCount = 0;
  int oCount = 0;
  String value = "";
  String result = "";
  

  String a = "";
  String b = "";
  String c = "";
  String d = "";
  String e = "";
  String f = "";
  String g = "";
  String h = "";
  String i = "";

  _box() {
    String _initialValue;
    setState(() {
      _initialValue = value;
    });
    if (_initialValue == "X") {
      oCount++;
      value = "O";
    } else {
      xCount++;
      value = "X";
    }
    return value;
  }

  checkresult() {
    if ((clickCount > 4)) {
      if ((a == b && a == c) || (a == d && a == g) || (a == e && a == i)) {
        result = a;
      } else if ((e == d && e == f) || (e == b && e == h) || (e == c && e == g)) {
        result = e;
      } else if ((i == g && i == h) || (i == c && i == f)) {
        result = i;
      } else if ((xCount > 4) || (oCount > 4)){
        result = "draw";
      }
    }
  }

  click(String slot) {
    if (slot == "a" && a == "") {
      clickCount++;
      a = _box();
    }
    if (slot == "b" && b == "") {
      clickCount++;
      b = _box();
    }
    if (slot == "c" && c == "") {
      clickCount++;
      c = _box();
    }
    if (slot == "d" && d == "") {
      clickCount++;
      d = _box();
    }
    if (slot == "e" && e == "") {
      clickCount++;
      e = _box();
    }
    if (slot == "f" && f == "") {
      clickCount++;
      f = _box();
    }
    if (slot == "g" && g == "") {
      clickCount++;
      g = _box();
    }
    if (slot == "h" && h == "") {
      clickCount++;
      h = _box();
    }
    if (slot == "i" && i == "") {
      clickCount++;
      i = _box();
    }
    if (slot == "result") {
      Navigator.of(context).pop();
      Navigator.of(context).pushNamed(TicTacToe.routeName);
    }
  }

  @override
  Widget build(context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("TicTacToe"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  box(context, this, "a", a),
                  box(context, this, "b", b),
                  box(context, this, "c", c),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  box(context, this, "d", d),
                  box(context, this, "e", e),
                  box(context, this, "f", f),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  box(context, this, "g", g),
                  box(context, this, "h", h),
                  box(context, this, "i", i),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  box(context, this, "result", result)
                ],
              ),
            ],
          ),
        ));
  }
}

Card box(BuildContext context,formState, slot, value) {
  return Card(
    color: Colors.blue.shade200,
    child: RaisedButton(
      color: Colors.blue.shade200,
      onPressed: () {
        formState.click(slot);
        formState.checkresult();
      },
      child: Center(
        child: Text(value, style: Theme.of(context).textTheme.headline4),
      ),
    )
  );
}
