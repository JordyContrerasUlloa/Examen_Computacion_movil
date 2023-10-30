import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget child;

  const CardContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: cardDecoration(),
        child: child,
      ),
    );
  }
}

BoxDecoration cardDecoration() => BoxDecoration(
        color: Color.fromARGB(255, 118, 238, 102),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(color: Colors.black, blurRadius: 15, offset: Offset(0, 5)),
        ]);
