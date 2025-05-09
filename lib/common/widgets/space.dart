import 'package:flutter/material.dart';

enum SpaceSize {
  simple,
  double,
  triple;

  int get value {
    switch (this) {
      case SpaceSize.simple:
        return 1;
      case SpaceSize.double:
        return 2;
      case SpaceSize.triple:
        return 3;
    }
  }
}

enum SpaceType { width, height }

class Space extends StatelessWidget {
  final SpaceSize? spaceSize;
  final SpaceType? spaceType;

  const Space({super.key, this.spaceSize, this.spaceType});

  @override
  Widget build(BuildContext context) {
    final SpaceType type = spaceType ?? SpaceType.height;
    final double total = spaceSize != null
        ? spaceSize!.value / 100
        : SpaceSize.simple.value / 100;

    return type == SpaceType.width
        ? SizedBox(width: MediaQuery.of(context).size.width * total)
        : SizedBox(height: MediaQuery.of(context).size.height * total);
  }
}
