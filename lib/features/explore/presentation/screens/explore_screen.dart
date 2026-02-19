import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodiex/constants/texts/custom_text.dart';
import 'package:foodiex/features/Home/presentation/widgets/search_bar.dart';
import 'package:foodiex/features/Home/presentation/widgets/top_bar_row.dart';
import 'package:foodiex/features/explore/presentation/widgets/explore_food_cards.dart';
import 'package:foodiex/features/explore/presentation/widgets/filter_bar.dart';

import '../widgets/food_cat_chips.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: const Color.fromARGB(255, 18, 26, 48),
        statusBarIconBrightness: Brightness.light,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 18, 26, 48),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: FoodSearchBar(),
              ),

              Row(
                mainAxisAlignment: .spaceAround,
                children: [
                  const SizedBox(width: 12),

                  divider(),

                  const SizedBox(width: 9),
                  CustomText(
                    text: "MADE FOR YOU",
                    colors: const Color.fromARGB(255, 178, 182, 184),
                    size: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(width: 9),

                  divider(),
                  const SizedBox(width: 12),
                ],
              ),

              // filtr,near,offer
              FilterBar(),

              // title
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: CustomText(
                  text: "What's on your mind ?",
                  colors: const Color.fromARGB(255, 231, 231, 231),
                  size: 16,
                ),
              ),
              SizedBox(height: 10),
              FoodCategorySelector(),

              Padding(
                padding: const EdgeInsets.only(left: 15, top: 7),
                child: CustomText(
                  text: "🍽️ Restaurants You Can't Miss",
                  colors: Colors.orange.shade200,
                  size: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),

              // foods cards
              // In ExploreScreen — fix the GridView aspect ratio
              GridView.builder(
                padding: const EdgeInsets.all(15),
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(), // ← add this too, inside ListView
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio:
                      0.62, // ← key fix: width/height ratio (~160/222)
                ),
                itemCount: imagess.length,
                itemBuilder: (context, index) {
                  return ExploreFoodCards(index: index);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget divider() {
    return Expanded(
      child: Divider(color: const Color.fromARGB(255, 147, 148, 148)),
    );
  }

  Widget items(String text, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Text(text, style: TextStyle(fontSize: 35)),
          Text(title, style: TextStyle(fontSize: 10, color: Colors.white)),
        ],
      ),
    );
  }
}

// Inside your ExploreScreen, replace the horizontal category list with this:
