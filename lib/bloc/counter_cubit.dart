import 'package:bloc_example/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counter: 0));
  decrement() {
    int count = --state.counter;
    var myState = CounterState(counter: count);
    emit(myState);
  }

  incremint() {
    int count = ++state.counter;
    var myState = CounterState(counter: count);
    var myState1 = CounterState(counter: count);
    emit(myState);
  }
}
