import 'package:flutter_bloc/flutter_bloc.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';

enum Events {
  increment,
  decrement
}

class CountBloc extends Bloc<BlocEvent, BlocState> {
  CountBloc() : super(CountInit()){
   on<CountIncrement>((event, emit) => _countIncrement(emit),);
   on<CountDecrement>((event, emit) => _countDecrement(emit),);
  }

  void _countIncrement(emit){
    final int count = state.count + 1;
    emit(IncrementCount(count: count));
  }

  void _countDecrement(emit){
    final int count = state.count - 1;
    emit(DecrementCount(count: count));
  }
}