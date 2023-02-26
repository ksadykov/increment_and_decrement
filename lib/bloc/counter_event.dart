part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class IncrimentEvent extends CounterEvent {
  final int counter;
  IncrimentEvent({required this.counter});
}

class DecrimentEvent extends CounterEvent {
  final int decrimentcounter;
  DecrimentEvent({required this.decrimentcounter});
}
