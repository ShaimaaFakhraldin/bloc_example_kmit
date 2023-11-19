import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvents, CounterState> {
  CounterBloc() : super(CounterState(counter: 0)) {
    on<IncrementCounterEvent>((event, emit) {
      int count = ++state.counter;
      var myState = CounterState(counter: count);
      emit(myState);
    });

    on<DecrementCounterEvent>((event, emit) {
      int count = --state.counter;
      var myState = CounterState(counter: count);
      emit(myState);
    });
  }
}
