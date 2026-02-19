import 'package:flutter/material.dart';
import '../../../../constants/colors/my_colors.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/category_secction.dart';
import '../widgets/home_screen_header.dart';
import '../widgets/horizontal_food_cards.dart';
import '../widgets/offer_banner_secction.dart';
import '../widgets/quick_action_card.dart';
import '../widgets/recent_order.dart';
import '../widgets/restuarant_card.dart';
import '../widgets/section_header.dart';
import '../widgets/wallet_strip.dart';
import 'demo_model/demo_model.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCategory = 0;
  int _bottomIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      bottomNavigationBar: BottomNav(
        selectedIndex: _bottomIndex,
        onTap: (i) => setState(() => _bottomIndex = i),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          //  Header
          SliverToBoxAdapter(
            
            child: AppHeader()),

          //  Search
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SearchBar(),
            ),
          ),

          //  Offer Banners
          SliverToBoxAdapter(child: OfferBannerSection(offers: offers)),

          //  Wallet Strip
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: WalletStrip(),
            ),
          ),

          //  Category Pills
          SliverToBoxAdapter(
            child: CategorySection(
              categories: categories,
              selected: _selectedCategory,
              onSelect: (i) => setState(() => _selectedCategory = i),
            ),
          ),

          //  Popular Near You
          SliverToBoxAdapter(
            child: SectionHeader(
              title: "🔥 Popular Near You",
              onSeeAll: () {},
            ),
          ),
          SliverToBoxAdapter(child: HorizontalFoodCards(items: popular)),

          //  Quick Actions
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 4),
              child: SectionHeader(
                title: "Quick Actions",
                onSeeAll: null,
                compact: true,
              ),
            ),
          ),
          SliverToBoxAdapter(child: QuickActionsGrid()),

          //  Nearby Restaurants
          SliverToBoxAdapter(
            child: SectionHeader(
              title: "📍 Nearby Restaurants",
              onSeeAll: () {},
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 6,
                ),
                child: RestaurantCard(item: nearby[i]),
              ),
              childCount: nearby.length,
            ),
          ),

          //Recent Order
          SliverToBoxAdapter(
            child: SectionHeader(title: "🕑 Recent Orders", onSeeAll: () {}),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              child: RecentOrderCard(),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 30)),
        ],
      ),
    );
  }
}


