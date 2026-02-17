import 'package:flutter/material.dart';
import 'package:foodiex/constants/colors/my_colors.dart';
import 'package:foodiex/constants/images/images.dart';
import 'package:foodiex/constants/texts/custom_text.dart';
import 'package:foodiex/features/auth/login/presentation/widgets/login_button_and_register_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: height,
          // stack starting
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(color: MyColors.mainBgBlueColor),
              ),
              // app logo
              Positioned(
                top: height * 0.02,
                left: 0,
                right: 0,
                child: Image.asset(rawLogoNoBorder, height: height * 0.25),
              ),
              Positioned(
                right: 0,
                top: 100,
                child: Image(height: 230, image: AssetImage(sideMainImageLogo)),
              ),
              // Text slightly below logo
              Positioned(
                top: height * 0.22,
                right: 110,
                left: 2,
                child: favText('"Now your favorite'),
              ),
              Positioned(
                top: height * 0.25,
                right: 110,
                left: 2,
                child: favText("food at your"),
              ),
              Positioned(
                top: height * 0.28,
                right: 110,
                left: 2,
                child: favText('doorstep"'),
              ),
              // login,register,privacy
              LoginButtonAndRegisterButton(height: height, width: width),
            ],
          ),
        ),
      ),
    );
  }

  CustomText favText(String text) {
    return CustomText(
      text: text,
      colors: MyColors.textWhite,
      size: 21,
      maxline: 2,
      textOverflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      textAlign: TextAlign.center,
    );
  }
}
