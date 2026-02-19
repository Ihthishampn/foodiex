import 'package:flutter/material.dart';
import 'package:foodiex/features/cart/presentation/screens/cart_screen.dart';
import 'package:foodiex/features/entry/bottom_nav.dart';
import 'package:foodiex/features/entry/provider/nav_provider.dart';
import 'package:foodiex/features/explore/presentation/screens/explore_screen.dart';
import 'package:provider/provider.dart';

import '../Home/presentation/screens/home_screen.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nav = context.watch<NavigationProvider>();

    return Scaffold(
      body: IndexedStack(
        index: nav.index,
        children: const [
          HomeScreen(),
          ExploreScreen(),
          CartScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}





class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
