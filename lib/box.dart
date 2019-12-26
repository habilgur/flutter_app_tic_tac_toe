import 'package:flutter/material.dart';
import 'state_enum.dart';

class Box extends StatelessWidget {
  final AssetImage image;
  final BoxState boxState;

  Box({this.image, this.boxState = BoxState.empty});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Image(
        image: image,
      ),
    );
  }
}
