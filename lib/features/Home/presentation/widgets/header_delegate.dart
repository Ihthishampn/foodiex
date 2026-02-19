

import 'package:flutter/material.dart';
import 'package:foodiex/constants/colors/my_colors.dart';

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  HeaderDelegate({required this.child, required this.height});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: AppColors.surface,
      alignment: Alignment.center,
      child: child,
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
