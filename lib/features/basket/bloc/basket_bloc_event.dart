part of 'basket_bloc.dart';

abstract class BasketBlocEvent {
  const BasketBlocEvent();
}

final class AddItemToBasket extends BasketBlocEvent {
  final int productId;
  final int productSize;
  final double total;

  const AddItemToBasket(this.productId, this.productSize, this.total);
}

final class RemoveItemFromBasket extends BasketBlocEvent {
  final int productId;
  final double total;
  final int minus;

  const RemoveItemFromBasket(this.productId, this.total, this.minus,
      ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar);
}
