import 'package:flutter/material.dart';
import 'package:foodiex/features/auth/loginAndSignUp/presentation/widgets/custom_list_tile.dart';

class OfferAndFeedback extends StatelessWidget {
  final double width;
  final double height;
  const OfferAndFeedback({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFDDDDDD).withOpacity(0.6),

        borderRadius: BorderRadius.circular(12),
      ),
      width: width * 0.9,

      child: Column(
        mainAxisSize: .min,
        mainAxisAlignment: .spaceBetween,
        children: [
          CustomListTile(
            text: "Offers",
            leading: Icons.discount_outlined,
            trailing: Icons.arrow_forward_ios_outlined,
          ),
          Divider(indent: 20, endIndent: 20, height: 12),
          CustomListTile(
            text: "FeedBack",
            leading: Icons.feedback_outlined,
            trailing: Icons.arrow_forward_ios_outlined,
          ),
        ],
      ),
    );
  }
}
