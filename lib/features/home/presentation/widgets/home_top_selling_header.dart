import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/core/widgets/see_all_widget.dart';
import 'package:flutter/material.dart';

class HomeTopSellingHeader extends StatelessWidget {
  const HomeTopSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Top Selling', style: Styles.styleBold16),
        SeeAllWidget(onTap: () {}),
      ],
    );
  }
}