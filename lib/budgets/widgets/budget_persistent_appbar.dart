import 'package:flutter/material.dart';

class BudgetPersistentAppBar extends StatelessWidget {
  const BudgetPersistentAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _FixedHeaderDelegate(
        child: Container(
          color: Theme.of(context).colorScheme.primary,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.keyboard_arrow_left_outlined),
              ),
              Text(
                "January",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.keyboard_arrow_right_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FixedHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  _FixedHeaderDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 60;
  @override
  double get minExtent => 60;
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
