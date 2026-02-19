import 'package:flutter/material.dart';

class GreetingBackground extends StatelessWidget {
  const GreetingBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF243052),
      // top padding pushes greeting below the pinned top-bar row (~64px)
      padding: const EdgeInsets.fromLTRB(20, 80, 20, 24),
      alignment: Alignment.centerLeft,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hey there! 👋",
            style: TextStyle(color: Colors.white54, fontSize: 14),
          ),
          SizedBox(height: 6),
          Text(
            "What would you like\nto eat today?\n",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
