import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_iota_products_app/features/basket/bloc/basket_bloc.dart';

class BasketIcon extends StatelessWidget {
  const BasketIcon({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<BasketBloc, BasketBlocState>(
        builder: (BuildContext context, BasketBlocState state) => badges.Badge(
            showBadge: state.numberOfOrderedProducts > 0,
            badgeContent: Text(
              state.numberOfOrderedProducts.toString(),
              style: const TextStyle(color: Colors.white),
            ),
            child: const Icon(Icons.shopping_basket)),
      );
}
