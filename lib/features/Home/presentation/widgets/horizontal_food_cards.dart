
import 'package:flutter/material.dart';
import 'package:foodiex/features/Home/data/ui_model/food_model.dart';
import 'package:foodiex/features/Home/presentation/widgets/food_card.dart';

class HorizontalFoodCards extends StatelessWidget {
  final List<FoodItem> items;
  const HorizontalFoodCards({
    
  super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: items.length,
        itemBuilder: (context, i) => FoodCard(item: items[i]),
      ),
    );
  }
}