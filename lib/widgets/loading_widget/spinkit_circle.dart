import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PrimarySpinkitCircle extends StatelessWidget {
  const PrimarySpinkitCircle({this.size = 48.0});
  final double size;

  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(
      color: Theme.of(context).colorScheme.primary,
      size: size,
    );
  }
}
