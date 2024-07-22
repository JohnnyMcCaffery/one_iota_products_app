import 'package:flutter/material.dart';
import 'package:money2/money2.dart';
import 'package:one_iota_products_app/features/basket/bloc/basket_bloc.dart';
import 'package:one_iota_products_app/features/products/model/product.dart';
import 'package:one_iota_products_app/pages/product_page.dart';

class BasketList extends StatelessWidget {
  final List<int> orderedProductsKeys;
  final List<Product> products;
  final BasketBloc readBasketBloc;

  const BasketList({
    required this.orderedProductsKeys,
    required this.products,
    required this.readBasketBloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: List.generate(orderedProductsKeys.length, (i) {
          Product product = products[orderedProductsKeys[i]];

          List showSizes =
              readBasketBloc.state.orderedProducts[orderedProductsKeys[i]];
          int numberOfSizes = showSizes.length;

          String productPrice = Money.fromNum(
            double.parse(product.price['amount']) * numberOfSizes,
            isoCode: product.price['currency'],
          ).toString();

          double spacing = 10;

          return Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
            margin: EdgeInsets.only(bottom: spacing),
            child: Column(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProductPage(id: orderedProductsKeys[i])),
                      );
                    },
                    child: Image.network(product.mainImage)),
                SizedBox(
                  height: spacing,
                ),
                paddingText(
                  text: product.name,
                  textStyle: const TextStyle(
                    fontSize: 13.0,
                  ),
                ),
                paddingText(
                  text:
                      'Size: ${showSizes.toString().substring(1, showSizes.toString().length - 1)}',
                ),
                paddingText(
                  text: productPrice,
                  textStyle: const TextStyle(
                      fontSize: 13.0, fontWeight: FontWeight.w600),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 194, 75, 75),
                    ),
                    onPressed: () {
                      readBasketBloc.add(
                        RemoveItemFromBasket(
                          orderedProductsKeys[i],
                          double.parse(product.price['amount']) * numberOfSizes,
                          numberOfSizes,
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Removed item from basket')),
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "Remove",
                      style: TextStyle(color: Colors.white, letterSpacing: 1.0),
                    )),
              ],
            ),
          );
        }),
      );

  Widget paddingText({required String text, TextStyle? textStyle}) => Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Text(
          overflow: TextOverflow.ellipsis,
          text,
          style: textStyle,
        ),
      );
}
