
// ─────────────────────────────────────────────
//  DATA MODELS
// ─────────────────────────────────────────────

import 'package:flutter/material.dart';

class FoodCategory {
  final String label;
  final String emoji;
  final Color color;
  const FoodCategory({
    required this.label,
    required this.emoji,
    required this.color,
  });
}

class FoodItem {
  final String name;
  final String restaurant;
  final String price;
  final String rating;
  final String time;
  final String tag;
  final Color tagColor;
  const FoodItem({
    required this.name,
    required this.restaurant,
    required this.price,
    required this.rating,
    required this.time,
    required this.tag,
    required this.tagColor,
  });
}

class OfferItem {
  final String title;
  final String subtitle;
  final String code;
  final List<Color> gradient;
  const OfferItem({
    required this.title,
    required this.subtitle,
    required this.code,
    required this.gradient,
  });
}