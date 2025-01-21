import 'package:flutter/material.dart';
import 'package:fruit_hup/core/widgets/fruit_item.dart';
class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163 / 214,
        mainAxisExtent: 200, // Ensure this matches the height of FruitItem
        crossAxisSpacing: 16,
        mainAxisSpacing: 16, // Add spacing to the main axis if needed
      ),
      itemBuilder: (context, index) {
        return FruitItem();
      },
    );
  }
}