import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_iota_products_app/features/products/bloc/products_bloc.dart';
import 'package:one_iota_products_app/features/products/widgets/product_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 204, 204, 204),
        body: BlocBuilder<ProductsBloc, ProductBlocState>(
            buildWhen: (previous, current) => current.status != previous.status,
            builder: (BuildContext context, ProductBlocState state) {
              if (state.status != 'error') {
                if (state.status != 'completed') {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ProductList(products: state.products);
                }
              } else {
                return const Center(
                  child: Text("Something has gone wrong!"),
                );
              }
            }));
  }
}
