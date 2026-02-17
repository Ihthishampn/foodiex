import 'package:flutter/material.dart';
import 'package:foodiex/constants/colors/my_colors.dart';
import 'package:foodiex/constants/texts/custom_text.dart';

class TapFullWidthButton extends StatelessWidget {
  final double width;
  final double height;

  const TapFullWidthButton({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        backgroundColor: WidgetStatePropertyAll(MyColors.mainBgBlueColor),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: width * 0.3, vertical: width * 0.04),
        ),
      ),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          builder: (context) {
            return const _AuthBottomSheet();
          },
        );
      },
      child: const Text(
        "Login or Signup",
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }
}

class _AuthBottomSheet extends StatefulWidget {
  const _AuthBottomSheet({Key? key}) : super(key: key);

  @override
  State<_AuthBottomSheet> createState() => _AuthBottomSheetState();
}

class _AuthBottomSheetState extends State<_AuthBottomSheet> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SizedBox(
          height: height * 0.65,
          child: Column(
            children: [
              const SizedBox(height: 12),

              /// Drag Indicator
              Container(
                width: 45,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              const SizedBox(height: 20),

              /// Pages
              Expanded(
                child: PageView(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  children: const [
                    _AuthUI(title: "Login", isSignup: false),
                    _AuthUI(title: "Sign Up", isSignup: true),
                  ],
                ),
              ),

              /// Dots
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(2, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: currentIndex == index ? 20 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: currentIndex == index
                          ? MyColors.mainBgBlueColor
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _AuthUI extends StatelessWidget {
  final String title;
  final bool isSignup;

  const _AuthUI({required this.title, required this.isSignup});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: title,
            colors: Colors.black87,
            size: 22,
            fontWeight: FontWeight.bold,
          ),

          const SizedBox(height: 8),

          Text(
            isSignup ? "Create your account" : "Enter your email and password",
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),

          const SizedBox(height: 24),

          /// USERNAME (ONLY FOR SIGNUP)
          if (isSignup) ...[
            TextField(
              decoration: InputDecoration(
                hintText: "Username",
                filled: true,
                suffixIcon: const Icon(Icons.person_outline),
                fillColor: Colors.grey.shade100,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],

          /// EMAIL
          TextField(
            decoration: InputDecoration(
              hintText: "Email",
              filled: true,
              suffixIcon: const Icon(Icons.alternate_email_rounded),
              fillColor: Colors.grey.shade100,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),

          const SizedBox(height: 16),

          /// PASSWORD
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Password",
              filled: true,
              suffixIcon: const Icon(Icons.password_rounded),
              fillColor: Colors.grey.shade100,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),

          const SizedBox(height: 24),

          /// BUTTON
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: MyColors.mainBgBlueColor,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              child: Text(title, style: const TextStyle(color: Colors.white)),
            ),
          ),

          const SizedBox(height: 16),

          const Text(
            "By continuing, you agree to our Terms & Conditions and Privacy Policy.",
            style: TextStyle(fontSize: 12, color: Colors.grey),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
