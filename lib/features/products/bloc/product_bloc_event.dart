part of 'products_bloc.dart';

abstract class ProductBlocEvent {
  ProductBlocEvent();
}

final class InitialiseProducts extends ProductBlocEvent {}