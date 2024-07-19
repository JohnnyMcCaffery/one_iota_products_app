part of 'products_bloc.dart';

abstract class ProductBlocState {
  ProductBlocState({required this.status});
  List<Product> products = [];

  String status = 'none';
}

class ProductInit extends ProductBlocState {
  ProductInit({required super.status});
}

class ProductsInitialise extends ProductBlocState {
  ProductsInitialise({products, required super.status}) {
    super.products = products;
  }
}

class ProductsStatusUpdate extends ProductBlocState {
  ProductsStatusUpdate({required super.status});
}
