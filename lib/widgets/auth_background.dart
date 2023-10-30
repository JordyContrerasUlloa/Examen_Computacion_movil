import 'package:flutter/material.dart';
import 'package:negocio_jordy/widgets/widgets.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;
  const AuthBackground({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 90, 179, 102),
      width: double.infinity,
      height: double.infinity,
      child: Stack(children: [
        AuthBackgorundC1(),
        SafeArea(
            child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 10),
          child: const Icon(
            Icons.person_pin_circle_rounded,
            color: Color.fromARGB(255, 0, 0, 0),
            size: 100,
          ),
        )),
        child,
      ]),
    );
  }
}
