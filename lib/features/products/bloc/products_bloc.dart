import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:one_iota_products_app/features/products/data/product_list.dart';
import 'package:one_iota_products_app/features/products/model/product.dart';

part 'product_bloc_event.dart';
part 'product_bloc_state.dart';

class ProductsBloc extends Bloc<ProductBlocEvent, ProductBlocState> {
  ProductsBloc() : super(ProductInit()) {
    on<InitialiseProducts>(
      (event, emit) => _initialiseProducts(emit),
    );
  }

  void _initialiseProducts(emit) async {
    try {
      emit(ProductsStatusUpdate("loading"));

      Response response = await getProductList();

      Map<String, dynamic> parsed =
          (json.decode(response.body) as Map<String, dynamic>);

      final List<Product> products = parsed['data']
          .map<Product>((json) => Product.fromJson(json))
          .toList();

      emit(ProductsInitialise(products: products));
    } catch (e) {
      emit(ProductsStatusUpdate("error"));
    }
  }
}
