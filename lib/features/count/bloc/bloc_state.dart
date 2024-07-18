part of 'bloc.dart';


abstract class BlocState {
  BlocState({this.count = 0});

  int count;
}

final class CountInit extends BlocState {}

final class IncrementCount extends BlocState {
  IncrementCount({super.count});
}

final class DecrementCount extends BlocState {
  DecrementCount({super.count});
}