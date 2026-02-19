import 'package:flutter/material.dart';
import 'package:foodiex/constants/colors/my_colors.dart';

class WalletStrip extends StatelessWidget {
  const WalletStrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: MyColors.mainBgBlueColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(
                    255,
                    255,
                    255,
                    255,
                  ).withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.account_balance_wallet_rounded,
                  color: Color.fromARGB(255, 207, 204, 203),
                ),
              ),
              const SizedBox(width: 14),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Wallet Balance",
                      style: TextStyle(
                        color: Color.fromARGB(255, 179, 179, 185),
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "₹ 2,450",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "Add Money",
                  style: TextStyle(
                    color: MyColors.mainBgBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
