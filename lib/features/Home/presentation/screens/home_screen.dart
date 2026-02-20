import 'package:flutter/material.dart';
import '../../../../constants/colors/my_colors.dart';
import '../widgets/category_secction.dart';
import '../widgets/greeting_card.dart';
import '../widgets/header_delegate.dart';
import '../widgets/horizontal_food_cards.dart';
import '../widgets/offer_banner_secction.dart';
import '../widgets/quick_action_card.dart';
import '../widgets/recent_order.dart';
import '../widgets/restuarant_card.dart';
import '../widgets/search_bar.dart';
import '../widgets/section_header.dart';
import '../widgets/top_bar_row.dart';
import '../widgets/wallet_strip.dart';
import 'demo_model/demo_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,

      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: false,
            snap: false,
            backgroundColor: const Color(0xFF243052),
            expandedHeight: 240,
            collapsedHeight: 64,
            automaticallyImplyLeading: false,
            titleSpacing: 0,
            // top bar for profile visit too
            title: const TopBarRow(),
            flexibleSpace: const FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: GreetingBackground(),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(62),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF243052),

                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(28),
                    bottomRight: Radius.circular(28),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: const FoodSearchBar(), // ← here
              ),
            ),
          ),

          //  Offer Banners ─────────────────────────────────────────────
          SliverToBoxAdapter(child: OfferBannerSection(offers: offers)),

          // Wallet Strip ──────────────────────────────────────────────
          SliverPersistentHeader(
            pinned: true,
            delegate: HeaderDelegate(
              height: 90, // match WalletStrip height
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: WalletStrip(),
              ),
            ),
          ),

          //  Category Pills ────────────────────────────────────────────
          SliverToBoxAdapter(
            child: CategorySection(
              categories: categories,
              selected: _selectedCategory,
              onSelect: (i) => setState(() => _selectedCategory = i),
            ),
          ),

          //  Popular Near You ──────────────────────────────────────────
          SliverToBoxAdapter(
            child: SectionHeader(title: "🔥 Popular Near You", onSeeAll: () {}),
          ),
          SliverToBoxAdapter(child: HorizontalFoodCards(items: popular)),

          //  Quick Actions ─────────────────────────────────────────────
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

          //  Nearby Restaurants ────────────────────────────────────────
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

          //  Recent Orders ─────────────────────────────────────────────
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
