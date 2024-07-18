import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_iota_products_app/common/navigation_screen.dart';
import 'package:one_iota_products_app/features/basket/bloc/basket_bloc.dart';
import 'package:one_iota_products_app/features/navigation/bloc/navigation_bloc.dart';
import 'package:one_iota_products_app/features/products/bloc/products_bloc.dart';
import 'package:one_iota_products_app/features/recently_viewed/bloc/recently_viewed_bloc.dart';

class InitialiseBlocs extends StatelessWidget {
  const InitialiseBlocs({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => NavigationBloc(),
          ),
          BlocProvider(
            create: (context) => ProductsBloc()..add(InitialiseProducts()),
          ),
          BlocProvider(create: (context) => BasketBloc()),
          BlocProvider(create: (context) => RecentlyViewedBloc()),
        ],
        child: const NavigationScreen(),
      );
}
