import 'package:flutter/material.dart';
import 'package:foodiex/constants/colors/my_colors.dart';

class ProfileHeaderSection extends StatelessWidget {
  final double height;

  const ProfileHeaderSection({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        // Blue curved background
        Container(
          width: double.infinity,
          height: height / 30,
          decoration: BoxDecoration(
            color: MyColors.mainBgBlueColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
          ),
        ),

       
      ],
    );
  }
}
