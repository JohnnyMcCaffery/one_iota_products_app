import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_iota_products_app/common/route_navigation.dart';
import 'package:one_iota_products_app/features/navigation/bloc/navigation_bloc.dart';
import 'package:one_iota_products_app/features/navigation/data/router.dart';
import 'package:one_iota_products_app/features/navigation/widgets/basket_icon.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  static Map<int, String> routes = {
    0: "/",
    1: "/basket",
  };

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<NavigationBloc, NavigationBlocState>(
        builder: (BuildContext context, NavigationBlocState state) =>
            MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: SafeArea(child: RouteNavigation(router: router)),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.activeIndex,
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              selectedItemColor: const Color.fromARGB(255, 70, 82, 126),
              unselectedItemColor: const Color.fromARGB(255, 145, 145, 145),
              iconSize: 30.0,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: BasketIcon(),
                  label: "Basket",
                ),
              ],
              onTap: (value) {
                router.go(Uri(path: routes[value]).toString());
                context
                    .read<NavigationBloc>()
                    .add(NavigationSetActivePage(value));
              },
            ),
          ),
        ),
      );
}
