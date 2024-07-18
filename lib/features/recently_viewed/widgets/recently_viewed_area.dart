import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_iota_products_app/features/products/bloc/products_bloc.dart';
import 'package:one_iota_products_app/features/products/model/product.dart';
import 'package:one_iota_products_app/features/recently_viewed/bloc/recently_viewed_bloc.dart';
import 'package:one_iota_products_app/pages/product_page.dart';

class RecentlyViewedArea extends StatelessWidget {
  const RecentlyViewedArea({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> products = context.read<ProductsBloc>().state.products;
    double spacing = 10.0;

    return BlocBuilder<RecentlyViewedBloc, RecentlyViewedBlocState>(
        builder: (BuildContext context, RecentlyViewedBlocState state) => state
                .recentlyViewedProducts.isEmpty
            ? const SizedBox()
            : Container(
                width: double.infinity,
                color: const Color.fromARGB(255, 110, 116, 130),
                child: Column(
                  children: [
                    const Text(
                      "Recently Viewed",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        letterSpacing: 1.0,
                      ),
                    ),
                    SizedBox(
                      height: spacing / 4,
                    ),
                    Container(
                      height: 180.0,
                      padding: const EdgeInsets.all(10.0),
                      child: GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 1,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                            state.recentlyViewedProducts.length, (i) {
                          Product product =
                              products[state.recentlyViewedProducts[i]];

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductPage(
                                        id: state.recentlyViewedProducts[i])),
                              );
                            },
                            child: Container(
                              color: Colors.white,
                              padding: EdgeInsets.all(spacing / 2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(product.mainImage),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ));
  }
}
