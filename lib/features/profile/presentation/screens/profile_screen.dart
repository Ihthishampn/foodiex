import 'package:flutter/material.dart';
import 'package:foodiex/constants/colors/my_colors.dart';
import 'package:foodiex/features/SavedAddress/presentation/screens/saved_address_screen.dart';

import '../widgets/main_row_seetings_cards.dart';
import '../widgets/profile_header_seccion.dart';
import '../widgets/profile_info_card.dart';
import '../widgets/profile_menu_seccion.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FC),
      appBar: AppBar(
        backgroundColor: MyColors.mainBgBlueColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.white),
        ),
        title: Image.asset("assets/images/logogold.png", width: 250),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 17),
            child: Image.asset("assets/images/delivery-man.png", width: 38),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          // Blue header background that bleeds into avatar
          ProfileHeaderSection(height: height),

          const SizedBox(height: 20),

          // Horizontal scrollable quick-action cards
          SizedBox(
            height: 90,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                MainRowSettingsCards(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            SavedAddressScreen(),
                      ),
                    );
                  },
                  text: 'Saved\nAddress',
                  icon: Icons.location_on_outlined,
                ),
                MainRowSettingsCards(
                  text: 'Your\nBalance',
                  icon: Icons.account_balance_wallet_outlined,
                ),
                MainRowSettingsCards(
                  text: 'My\nOrders',
                  icon: Icons.receipt_long_outlined,
                ),
                MainRowSettingsCards(
                  text: 'My\nRefunds',
                  icon: Icons.assignment_return_outlined,
                ),
                MainRowSettingsCards(
                  text: 'Help &\nSupport',
                  icon: Icons.support_agent_outlined,
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Account info card
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ProfileInfoCard(
              title: 'Account Details',
              items: [
                ProfileInfoItem(
                  icon: Icons.person_outline,
                  label: 'Full Name',
                  value: 'Ihthisham',
                ),
                ProfileInfoItem(
                  icon: Icons.email_outlined,
                  label: 'Email',
                  value: 'Ihthisham@gmail.com',
                ),
                ProfileInfoItem(
                  icon: Icons.phone_outlined,
                  label: 'Phone',
                  value: '+91 9072027963',
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Settings / menu section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ProfileMenuSection(),
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
