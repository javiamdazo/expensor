import 'package:flutter/material.dart';

enum SpaceEnum {
  simple,
  double,
  triple;

  int get value {
    switch (this) {
      case SpaceEnum.simple:
        return 1;
      case SpaceEnum.double:
        return 2;
      case SpaceEnum.triple:
        return 3;
    }
  }
}

enum SpaceType { width, height }

class Space extends StatelessWidget {
  final SpaceEnum? space;
  final SpaceType? spaceType;

  const Space({super.key, this.space, this.spaceType});

  @override
  Widget build(BuildContext context) {
    final SpaceType type = spaceType ?? SpaceType.height; 
    final double total =
        space != null ? space!.value / 100 : SpaceEnum.simple.value / 100;

    return type == SpaceType.width
        ? SizedBox(width: MediaQuery.of(context).size.width * total)
        : SizedBox(height: MediaQuery.of(context).size.height * total);
  }
}
