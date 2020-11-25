import 'package:flutter/material.dart';

RaisedButton raisedButton(BuildContext context, formState, slot, value) {
  return RaisedButton(
    onPressed: () {
      formState.click(slot);
      formState.checkresult();
    },
    child: Text(value, style: Theme.of(context).textTheme.headline4),
  );
}