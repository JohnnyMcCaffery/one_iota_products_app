import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'basket_bloc_event.dart';
part 'basket_bloc_state.dart';

class BasketBloc extends Bloc<BasketBlocEvent, BasketBlocState> {
  BasketBloc()
      : super(BasketInit(
          numberOfOrderedProducts: 0,
          orderedProducts: {},
          total: 0.0,
        )) {
    on<AddItemToBasket>(
      (event, emit) => _addItemToBasket(event, emit),
    );
    on<RemoveItemFromBasket>(
      (event, emit) => _removeItemFromBasket(event, emit),
    );
  }

  void _addItemToBasket(event, emit) {
    if (state.orderedProducts[event.productId] == null) {
      state.orderedProducts[event.productId] = [event.productSize];
    } else {
      state.orderedProducts[event.productId].add(event.productSize);
    }

    emit(AddToOrderedProduct(
      numberOfOrderedProducts: state.numberOfOrderedProducts + 1,
      orderedProducts: state.orderedProducts,
      total: event.total + state.total,
    ));
  }

  void _removeItemFromBasket(event, emit) {
    state.orderedProducts.remove(event.productId);

    emit(RemoveFromOrderedProduct(
      numberOfOrderedProducts:
          (state.numberOfOrderedProducts - event.minus).toInt(),
      orderedProducts: state.orderedProducts,
      total: state.total - event.total,
    ));
  }
}
