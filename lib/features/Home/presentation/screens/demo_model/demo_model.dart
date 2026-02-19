
  import 'package:flutter/material.dart';
import 'package:foodiex/features/Home/data/ui_model/food_model.dart';

final List<FoodCategory> categories = const [
    FoodCategory(label: "All", emoji: "🍽️", color: Color(0xFFFF6B35)),
    FoodCategory(label: "Burgers", emoji: "🍔", color: Color(0xFFF59E0B)),
    FoodCategory(label: "Pizza", emoji: "🍕", color: Color(0xFFEF4444)),
    FoodCategory(label: "Sushi", emoji: "🍣", color: Color(0xFF14B8A6)),
    FoodCategory(label: "Desserts", emoji: "🍰", color: Color(0xFFEC4899)),
    FoodCategory(label: "Drinks", emoji: "🧋", color: Color(0xFF8B5CF6)),
  ];

  final List<FoodItem> popular = const [
    FoodItem(
      name: "Classic Smash Burger",
      restaurant: "Burger Craft",
      price: "₹280",
      rating: "4.9",
      time: "20 min",
      tag: "Bestseller",
      tagColor: Color(0xFFFF6B35),
    ),
    FoodItem(
      name: "Margherita Royale",
      restaurant: "Pizza Planet",
      price: "₹320",
      rating: "4.7",
      time: "30 min",
      tag: "Popular",
      tagColor: Color(0xFF8B5CF6),
    ),
    FoodItem(
      name: "Dragon Roll",
      restaurant: "Sakura House",
      price: "₹450",
      rating: "4.8",
      time: "25 min",
      tag: "New",
      tagColor: Color(0xFF14B8A6),
    ),
    FoodItem(
      name: "Chicken Shawarma",
      restaurant: "Spice Route",
      price: "₹180",
      rating: "4.6",
      time: "15 min",
      tag: "Trending",
      tagColor: Color(0xFFF59E0B),
    ),
  ];

  final List<FoodItem> nearby = const [
    FoodItem(
      name: "Masala Dosa",
      restaurant: "South Side Kitchen",
      price: "₹120",
      rating: "4.5",
      time: "10 min",
      tag: "Veg",
      tagColor: Color(0xFF22C55E),
    ),
    FoodItem(
      name: "Paneer Tikka",
      restaurant: "Tandoor Tales",
      price: "₹220",
      rating: "4.6",
      time: "18 min",
      tag: "Veg",
      tagColor: Color(0xFF22C55E),
    ),
    FoodItem(
      name: "Prawn Biryani",
      restaurant: "Coastal Flavours",
      price: "₹380",
      rating: "4.8",
      time: "35 min",
      tag: "Chef's Pick",
      tagColor: Color(0xFFFF6B35),
    ),
  ];

  final List<OfferItem> offers = const [
    OfferItem(
      title: "50% OFF",
      subtitle: "On your first order above ₹299",
      code: "FIRST50",
      gradient: [Color(0xFFFF6B35), Color(0xFFFF8C5A)],
    ),
    OfferItem(
      title: "Free Delivery",
      subtitle: "All weekend orders, no minimum",
      code: "FREEDEL",
      gradient: [Color(0xFF8B5CF6), Color(0xFFA78BFA)],
    ),
    OfferItem(
      title: "BOGO",
      subtitle: "Buy 1 Get 1 on all burgers today",
      code: "BOGO2024",
      gradient: [Color(0xFF14B8A6), Color(0xFF2DD4BF)],
    ),
  ];
