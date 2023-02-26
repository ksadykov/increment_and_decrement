import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<IncrimentEvent>((event, emit) async {
      emit(CounterLoading());
      await Future.delayed(
        const Duration(seconds: 1),
      );

      final result = event.counter + 1;
      emit(CounterSuccess(counter: result));
    });

    on<DecrimentEvent>((event, emit) async {
      emit(CounterLoading());
      await Future.delayed(
        const Duration(seconds: 1),
      );

      final result = event.decrimentcounter - 1;
      emit(CounterSuccess(counter: result));
    });
  }
}
