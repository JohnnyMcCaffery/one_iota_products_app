import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money2/money2.dart';
import 'package:one_iota_products_app/features/products/bloc/products_bloc.dart';
import 'package:one_iota_products_app/features/products/model/product.dart';
import 'package:one_iota_products_app/features/recently_viewed/widgets/recently_viewed_area.dart';
import 'package:one_iota_products_app/pages/widgets/add_to_basket_button.dart';

class ProductPage extends StatefulWidget {
  final int id;

  const ProductPage({super.key, required this.id});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late int id;
  late int shoeSize;

  @override
  void initState() {
    super.initState();

    id = widget.id;
    shoeSize = 8;
  }

  @override
  Widget build(BuildContext context) {
    double spacing = 10.0;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<ProductsBloc, ProductBlocState>(
          builder: (context, state) {
        Product product = state.products[id];
        String productPrice = Money.fromNum(
          double.parse(product.price['amount']),
          isoCode: product.price['currency'],
        ).toString();

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.network(product.mainImage),
              Text(product.brandName,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 121, 121, 121))),
              SizedBox(height: spacing / 2),
              Text(
                product.name,
              ),
              SizedBox(height: spacing / 2),
              Text(
                productPrice,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: spacing,
              ),
              Text(product.stockStatus),
              SizedBox(
                height: spacing,
              ),
              Text('Color: ${product.colour}'),
              SizedBox(
                height: spacing,
              ),
              Text('SKU: ${product.sku}'),
              SizedBox(
                height: spacing * 2,
              ),
              const Text(
                "Sizes:",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: spacing,
              ),
              SizedBox(
                height: 30.0,
                child: GridView.count(
                  mainAxisSpacing: 5.0,
                  crossAxisSpacing: 5.0,
                  crossAxisCount: 4,
                  childAspectRatio: 3.0,
                  children: List.generate(product.sizes.length, (i) {
                    return GestureDetector(
                      onTap: () {
                        shoeSize = int.parse(product.sizes[i]);
                        setState(() {});
                      },
                      child: Container(
                        color: int.parse(product.sizes[i]) == shoeSize
                            ? const Color.fromARGB(255, 168, 200, 255)
                            : const Color.fromARGB(255, 233, 233, 233),
                        child: Center(child: Text(product.sizes[i])),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(
                height: spacing,
              ),
              Text('Description: ${product.description}'),
              AddToBasketButton(
                productId: id,
                productSize: shoeSize,
                total: double.parse(product.price['amount']),
                isDisabled: product.stockStatus == "OUT OF STOCK",
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  height: 215.0,
                  child: const RecentlyViewedArea()),
            ]),
          ),
        );
      }),
    );
  }
}
