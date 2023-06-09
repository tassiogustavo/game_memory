import 'package:flutter/material.dart';

class FrontFlipCard extends StatelessWidget {
  const FrontFlipCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 100,
        height: 150,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(214, 255, 255, 255),
              Color.fromARGB(214, 170, 170, 170)
            ],
          ),
        ),
      ),
    );
  }
}
