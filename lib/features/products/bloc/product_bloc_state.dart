part of 'products_bloc.dart';

abstract class ProductBlocState {
  List<Product> products = [];

  String status = 'none';
}

class ProductInit extends ProductBlocState{}

class ProductsInitialise extends ProductBlocState {
  ProductsInitialise({products, brands}){
    super.products = products;
    super.status = "completed";
  }
}

class ProductsStatusUpdate extends ProductBlocState {
  ProductsStatusUpdate(status){
    super.status = status;
  }
}