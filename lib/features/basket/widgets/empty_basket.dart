import 'package:flutter/material.dart';

class EmptyBasket extends StatelessWidget {
  const EmptyBasket({super.key});

  @override
  Widget build(BuildContext context) => Center(
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
      );
}
