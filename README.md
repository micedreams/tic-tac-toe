# tic_tac_toe

A Simple Flutter application which shows 3 * 3 grid where "X"s and "O"s can be input and shows result in the end
```
 $ flutter pub get
 
 $ flutter run
 ```

 
This App uses the flutter BLoC pattern.

BLoC = business logic component.

BLoC pattern is better than the setState State management system because it sepates out view and business logic.

(if you want the app to use setState Flutter just change `runApp(BLoCPatternFlutter());` to `runApp(Vanilla());` in the `main.dart` file 😉😉)

 https://user-images.githubusercontent.com/8918999/148472228-bd72a1eb-5d40-4f92-b199-872f60c7c81d.mov

## How I turned my Set state flutter project into BLoC pattern flutter project

1. First we need to figure out states of our flutter widgits (in this case we just have 1 state..) then we define the state class 

 ```
 class TicTacToeState {
  final str;
  final result;
  TicTacToeState({this.str, this.result = "reset"});
}
```
 `Abstract Factory Pattern`: If there is more than one state it is good to first define an abstract class 
 then define separate classes for each state and  extend those states to the abstact class so if there is a common methods 
 you can define it in the abstract class..and later override it in the classes that extend it..same thing happens with events. 
 
2. Next we need to figure out the events that cuase changes in our board.

   Our projects has 2 types of events 
    1. reset event: event that can be seen as soon as the app opens or when clicked on reset button to bring it back to the initial state
    2. click event: event that triggers the start of the game... or the next move....
  
 ```
 abstract class TicTacToeEvent {}
 
class ResetEvent extends TicTacToeEvent {}

class ClickEvent extends TicTacToeEvent {
  final int index;
  ClickEvent(this.index);
}
```
3. After that we need to import the [flutter_bloc](https://pub.dev/packages/flutter_bloc) library into the project 
4. Defining BLoC Class 
   
   Our BLoC class looks something like this 
   ```
   class TicTacToeBloc extends Bloc<TicTacToeEvent, TicTacToeState> {
      TicTacToeFunctions function = new TicTacToeFunctions();
      var str = List.filled(9, "", growable: false);
      TicTacToeBloc()
         : super(TicTacToeState(str: List.filled(9, "", growable: false))) {
       on<ResetEvent>((event, emit) {
         var dispose = function.dispose();
         str = dispose[0];
         emit(TicTacToeState(str: dispose[0], result: dispose[1]));
       });
       on<ClickEvent>((event, emit) {
         var click = function.click(event.index, str);
         emit(TicTacToeState(str: click[0], result: click[1]));
       });
      }
   }
 
  It has a constructor that takes in an initial value and on<event> functions 
 
  (note: in `on<event>` event is a string used by the BlocProvider to trigger the specific event defined in the method)
 
  when `on<event>` is triggered by the BlocProvider it emits a state.
 
  In our case `ResetEvent` calls the dispose function and sets everything to initial value and `Click event` simply calls the click function
 
5. Finally tieing things together,
 
 
  i.  In main.dart file, wrap the viewClass widget with `BlocProvider` widget, give its create property the value of initial event 
    
 in our case the ResetEvent
 ```
 home: BlocProvider<TicTacToeBloc>(
        create: (context) => TicTacToeBloc()..add(ResetEvent()),
        child: TicTacToeView(),
      ),
 ```
 
 ii. In ViewClass, inside the build method wrap the widget that is being returned with a `BlocBuilder` 
 
 iii. replace setState functions with  ```BlocProvider.of<TicTacToeBloc>(context).add(eventCall)```
 
 
in our case
 
 The ResetEvent gets triggered by 
 ```
 BlocProvider.of<TicTacToeBloc>(context).add(ResetEvent());
 ```
 
 The ClickEvent gets triggered by 
 ```
 BlocProvider.of<TicTacToeBloc>(context).add(ClickEvent(index));
 ```
 
 and We are Done!!

