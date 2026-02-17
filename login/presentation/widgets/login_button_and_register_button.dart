import 'package:flutter/material.dart';
import 'package:foodiex/constants/colors/my_colors.dart';
import 'package:foodiex/constants/texts/custom_text.dart';
import 'package:foodiex/features/auth/components/tap_full_width_button.dart';
import 'package:foodiex/features/auth/login/presentation/widgets/offer_and_feedback.dart';
import 'package:foodiex/features/auth/login/presentation/widgets/rich_text_formain_heading_login_page.dart';

class LoginButtonAndRegisterButton extends StatelessWidget {
  final double height;
  final double width;

  const LoginButtonAndRegisterButton({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 24),

              TapFullWidthButton(
                width: width,
                height: height,
              ),

              const SizedBox(height: 24),

              const PrivacyAndtermsText(),

              const SizedBox(height: 24),

              OfferAndFeedback(
                width: width,
                height: height,
              ),

              const SizedBox(height: 32),

              const CustomText(
                text: "App version 2.102.1",
                colors: MyColors.softGrey,
                size: 11,
                fontWeight: FontWeight.w400,
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
