import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/BLoCPattern/tic_tac_toe_bloc.dart';
import 'package:tic_tac_toe/BLoCPattern/tic_tac_toe_event.dart';
import 'package:tic_tac_toe/BLoCPattern/tic_tac_toe_state.dart';

class TicTacToe extends StatelessWidget {
  @override
  Widget build(context) => Scaffold(
      appBar: AppBar(
        title: Text("TicTacToe"),
      ),
      body: BlocBuilder<TicTacToeBloc, TicTacToeState>(
        builder: (context, state) {
          final blocContext = BlocProvider.of<TicTacToeBloc>(context);

          if (state is BoardState) return buildBoard(blocContext, state);

          return buildResetCard(blocContext);
        },
      ));

  Widget buildResetCard(TicTacToeBloc blocContext) {
    return Center(
      child: Card(
        child: ButtonBar(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => blocContext.add(PlayerEvent(true)),
              child: Text('Single player'),
            ),
            ElevatedButton(
              onPressed: () => blocContext.add(PlayerEvent(false)),
              child: Text('Multi player'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoard(TicTacToeBloc blocContext, BoardState state) {
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
  }
}
