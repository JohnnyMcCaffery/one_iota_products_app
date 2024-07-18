import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money2/money2.dart';
import 'package:one_iota_products_app/features/products/model/product.dart';
import 'package:one_iota_products_app/features/recently_viewed/bloc/recently_viewed_bloc.dart';
import 'package:one_iota_products_app/features/recently_viewed/widgets/recently_viewed_area.dart';
import 'package:one_iota_products_app/pages/product_page.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;

  const ProductList({
    required this.products,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double spacing = 10.0;

    return SingleChildScrollView(
      child: Column(children: [
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          padding: EdgeInsets.all(spacing),
          mainAxisSpacing: spacing,
          crossAxisSpacing: spacing,
          childAspectRatio: 0.76,
          children: List.generate(products.length, (i) {
            Product product = products[i];
            String productPrice = Money.fromNum(
              double.parse(product.price['amount']),
              isoCode: product.price['currency'],
            ).toString();

            return GestureDetector(
              onTap: () {
                context.read<RecentlyViewedBloc>().add(RecentlyViewed(i));

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductPage(id: i)),
                );
              },
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(spacing / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(product.mainImage),
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
                      productPrice,
                      style: const TextStyle(
                          fontSize: 13.0, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
        const RecentlyViewedArea(),
      ]),
    );
  }
}
