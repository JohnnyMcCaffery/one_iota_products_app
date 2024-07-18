part of 'basket_bloc.dart';

abstract class BasketBlocState {
  BasketBlocState({
    required this.numberOfOrderedProducts,
    required this.orderedProducts,
    required this.total,
  });

  int numberOfOrderedProducts;
  Map<int, dynamic> orderedProducts;
  double total;
}

final class BasketInit extends BasketBlocState {
  BasketInit({
    required super.numberOfOrderedProducts,
    required super.orderedProducts,
    required super.total,
  });
}

final class AddToOrderedProduct extends BasketBlocState {
  AddToOrderedProduct({
    required super.numberOfOrderedProducts,
    required super.orderedProducts,
    required super.total,
  });
}

final class RemoveFromOrderedProduct extends BasketBlocState {
  RemoveFromOrderedProduct({
    required super.numberOfOrderedProducts, 
    required super.orderedProducts,
    required super.total,
  });
}