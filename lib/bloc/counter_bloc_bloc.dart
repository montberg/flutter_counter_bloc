import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'counter_bloc_event.dart';
part 'counter_bloc_state.dart';

class CounterBloc extends Bloc<CounterBlocEvent, CounterBlocState> {
  CounterBloc() : super(CounterBlocState(counter: 0)) {
    
    on<CounterBlocEvent>((event, emit){
      if(event is IncrementEvent) emit(CounterBlocState(counter: state.counter+1));
      if(event is DecrementEvent) emit(CounterBlocState(counter: state.counter-1));
    });
  }
  
}
