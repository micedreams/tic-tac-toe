import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/tic_tac_toe_cubit.dart';

class TicTacToeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TicTacToeViewState();
}

class _TicTacToeViewState extends State<TicTacToeView> {
  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("TicTacToe"),
        ),
        body: BlocBuilder<TicTacToeCubit, List<String>>(
          builder: (context, strings) {
            return Column(
              children: [
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  children: List.generate(9, (index) {
                    return GridTile(
                      child: Card(
                          child: ElevatedButton(
                        onPressed: () {},
                        child: Text(strings[index]),
                      )),
                    );
                  }),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed("/TicTacToeView");
                  },
                  child: Text("reset"),
                )
              ],
            );
          },
        ));
  }
}
