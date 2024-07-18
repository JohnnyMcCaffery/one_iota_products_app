import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money2/money2.dart';
import 'package:one_iota_products_app/features/basket/bloc/basket_bloc.dart';
import 'package:one_iota_products_app/features/products/model/product.dart';
import 'package:one_iota_products_app/features/recently_viewed/widgets/recently_viewed_area.dart';
import 'package:one_iota_products_app/pages/product_page.dart';

import '../features/products/bloc/products_bloc.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 204, 204, 204),
        body: BlocBuilder<BasketBloc, BasketBlocState>(
            builder: (BuildContext context, BasketBlocState state) {
          var productBloc = context.read<ProductsBloc>().state;
          List<Product> products = productBloc.products;
          List<int> orderedProductsKeys = [];
          double spacing = 10;

          state.orderedProducts.forEach(
            (key, value) {
              orderedProductsKeys.add(key);
            },
          );

          String totalPrice = "";

          if (state.total > 0) {
            totalPrice = Money.fromNum(
              state.total,
              isoCode: products[0].price['currency'],
            ).toString();
          }

          return state.total == 0
              ? Center(
                  child: Container(
                    color: Colors.white,
                    height: 180.0,
                    padding: const EdgeInsets.all(10.0),
                    child: const Column(
                      children: [
                        Text(
                          "Empty Basket",
                          style: TextStyle(
                              fontSize: 30.0,
                              letterSpacing: 1.0,
                              color: Color.fromARGB(255, 103, 103, 103)),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Icon(
                          Icons.shopping_basket,
                          size: 100.0,
                          color: Color.fromARGB(255, 103, 103, 103),
                        )
                      ],
                    ),
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text(
                          "Total $totalPrice",
                          style: const TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.0,
                            color: Color.fromARGB(255, 79, 79, 79),
                          ),
                        ),
                        SizedBox(
                          height: spacing,
                        ),
                        SingleChildScrollView(
                          child: Center(
                            child: SizedBox(
                              width: 250.0,
                              child: Column(
                                children: List.generate(
                                    orderedProductsKeys.length, (i) {
                                  Product product =
                                      products[orderedProductsKeys[i]];

                                  List showSizes = state
                                      .orderedProducts[orderedProductsKeys[i]];
                                  int numberOfSizes = showSizes.length;

                                  String productPrice = Money.fromNum(
                                    double.parse(product.price['amount']) *
                                        numberOfSizes,
                                    isoCode: product.price['currency'],
                                  ).toString();

                                  return Container(
                                    color: Colors.white,
                                    padding: const EdgeInsets.fromLTRB(
                                        10.0, 0, 10.0, 10.0),
                                    margin: EdgeInsets.only(bottom: spacing),
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ProductPage(
                                                            id: orderedProductsKeys[
                                                                i])),
                                              );
                                            },
                                            child: Image.network(
                                                product.mainImage)),
                                        SizedBox(
                                          height: spacing,
                                        ),
                                        Text(
                                          product.name,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 13.0,
                                          ),
                                        ),
                                        SizedBox(height: spacing),
                                        Text(
                                            'Size: ${showSizes.toString().substring(1, showSizes.toString().length - 1)}'),
                                        SizedBox(height: spacing),
                                        Text(
                                          productPrice,
                                          style: const TextStyle(
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: spacing,
                                        ),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 194, 75, 75),
                                            ),
                                            onPressed: () {
                                              context.read<BasketBloc>().add(
                                                    RemoveItemFromBasket(
                                                      orderedProductsKeys[i],
                                                      double.parse(
                                                              product.price[
                                                                  'amount']) *
                                                          numberOfSizes,
                                                      numberOfSizes,
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        const SnackBar(
                                                            content: Text(
                                                                'Removed item from basket')),
                                                      ),
                                                    ),
                                                  );
                                            },
                                            child: const Text(
                                              "Remove",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  letterSpacing: 1.0),
                                            )),
                                      ],
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),
                        ),
                        const RecentlyViewedArea(),
                      ],
                    ),
                  ),
                );
        }),
      );
}
