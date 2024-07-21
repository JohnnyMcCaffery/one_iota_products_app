import 'package:flutter/material.dart';

class WarningMessage extends StatelessWidget {
  final String message;

  const WarningMessage(this.message, {super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          color: const Color.fromARGB(255, 59, 54, 54),
          height: 250.0,
          width: 250.0,
          child: Column(
            children: [
              const Icon(
                Icons.warning,
                size: 120,
                color: Colors.yellow,
              ),
              Text(
                textAlign: TextAlign.center,
                message,
                style: const TextStyle(
                  fontSize: 30.0,
                  letterSpacing: 1.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
}
