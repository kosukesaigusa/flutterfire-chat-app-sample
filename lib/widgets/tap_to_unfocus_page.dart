import 'package:flutter/material.dart';

class TapToUnfocusPage extends StatelessWidget {
  const TapToUnfocusPage({required this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: child,
    );
  }
}
