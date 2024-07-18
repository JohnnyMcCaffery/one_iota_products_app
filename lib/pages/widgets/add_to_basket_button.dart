import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_iota_products_app/features/basket/bloc/basket_bloc.dart';

class AddToBasketButton extends StatelessWidget {
  final int productId;
  final int productSize;
  final double total;
  final bool isDisabled;

  const AddToBasketButton({
    required this.productId,
    required this.productSize,
    required this.total,
    required this.isDisabled,
    super.key,
  });

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<BasketBloc, BasketBlocState>(
          builder: (BuildContext context, BasketBlocState state) {
        return Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SizedBox(
            width: double.infinity, // Makes the button take the full width
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  disabledBackgroundColor:
                      const Color.fromARGB(255, 200, 200, 200),
                  backgroundColor: const Color.fromARGB(255, 165, 222, 195)),
              onPressed: isDisabled
                  ? null
                  : () {
                      context
                          .read<BasketBloc>()
                          .add(AddItemToBasket(productId, productSize, total));

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Item added to Basket')),
                      );
                    },
              child: Text(
                isDisabled ? 'Disabled' : 'Add to Basket',
                style: const TextStyle(color: Colors.black, letterSpacing: 1.0),
              ),
            ),
          ),
        );
      });
}
