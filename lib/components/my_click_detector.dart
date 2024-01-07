import 'package:flutter/material.dart';

class MyClickDetector extends StatelessWidget {
  const MyClickDetector({
    super.key,
    required this.child,
    required this.onTap,
  });

  final Widget child;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: child,
    );
  }
}
