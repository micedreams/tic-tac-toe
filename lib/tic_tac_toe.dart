import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/BLoCPattern/tic_tac_toe_bloc.dart';
import 'package:tic_tac_toe/BLoCPattern/tic_tac_toe_event.dart';
import 'package:tic_tac_toe/BLoCPattern/tic_tac_toe_state.dart';

class TicTacToe extends StatefulWidget {
  @override
  State createState() => _TicTacToeViewState();
}

class _TicTacToeViewState extends State<TicTacToe> {
  @override
  Widget build(context) => Scaffold(
      appBar: AppBar(
        title: Text("TicTacToe"),
      ),
      body: BlocBuilder<TicTacToeBloc, TicTacToeState>(
        builder: (context, state) {
          final blocContext = BlocProvider.of<TicTacToeBloc>(context);

          return Column(
            children: [
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                children: List.generate(
                  9,
                  (index) => GridTile(
                    child: Card(
                      child: ElevatedButton(
                        onPressed: () => blocContext.add(ClickEvent(index)),
                        child: Text(state.str[index]),
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => blocContext.add(ResetEvent()),
                child: Text(state.result),
              ),
            ],
          );
        },
      ));
}
