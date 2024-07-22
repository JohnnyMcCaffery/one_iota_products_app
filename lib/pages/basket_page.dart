import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money2/money2.dart';
import 'package:one_iota_products_app/features/basket/bloc/basket_bloc.dart';
import 'package:one_iota_products_app/features/basket/widgets/basket_list.dart';
import 'package:one_iota_products_app/features/basket/widgets/empty_basket.dart';
import 'package:one_iota_products_app/features/products/model/product.dart';
import 'package:one_iota_products_app/features/recently_viewed/widgets/recently_viewed_area.dart';

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
              ? const EmptyBasket()
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
                        const SizedBox(
                          height: 10.0,
                        ),
                        SingleChildScrollView(
                          child: Center(
                            child: SizedBox(
                              width: 250.0,
                              child: BasketList(
                                orderedProductsKeys: orderedProductsKeys,
                                products: products,
                                readBasketBloc: context.read<BasketBloc>(),
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
