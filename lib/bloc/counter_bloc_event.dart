part of 'counter_bloc_bloc.dart';



@immutable
sealed class CounterBlocEvent {}

class IncrementEvent extends CounterBlocEvent {}

class DecrementEvent extends CounterBlocEvent {}