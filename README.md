# tic_tac_toe

A Simple Flutter application which shows 3 * 3 grid where "X"s and "O"s can be input and shows result in the end
```
 $ flutter pub get
 
 $ flutter run
 ```
How I turned my Set state flutter project into BLoC pattern flutter project
1. first I figured out states of my flutter widgits (in this case I just have 1 state..)
2. then I defined the state class 
 ```class TicTacToeState {
  final str;
  final result;
  TicTacToeState({this.str, this.result = "reset"});
}
```

3. then I figured out events that cuase change for in my board (basically the click events and reset event)
  
 ```abstract class TicTacToeEvent {}```
 
 if there is more than one event it is good to first define an abstract class 
 then define separate classes for each event and  extend those events to the abstact class so if there is a common methods 
 you can define it in the abstract class..and later override it in the classes that extend it `Abstract Factory Pattern`
 
 

```class ResetEvent extends TicTacToeEvent {}```

```class ClickEvent extends TicTacToeEvent {
  final int index;
  ClickEvent(this.index);
}```

5. after I imported flutter_bloc package into my project
6. I defined a Bloc class....`class TicTacToeBloc extends Bloc<TicTacToeEvent, TicTacToeState>{}`
7. defined event methods that emits the required state `on<EventClass>((event, emit) {emit();});`
8. to set this all up in main method used the BlocProvider widget giving it the inital state event for its create property 
9. and in View Class in the on pressed button, where set state was being called I replaced it with the BlocProvider's add(event) function 
10. and tada things started to work

 
This App uses the flutter BLoC pattern.

(if you want the app to use vanilla Flutter just change `runApp(BLoCPatternFlutter());` to `runApp(Vanilla());` in the `main.dart` file 😉😉)

 https://user-images.githubusercontent.com/8918999/148472228-bd72a1eb-5d40-4f92-b199-872f60c7c81d.mov

