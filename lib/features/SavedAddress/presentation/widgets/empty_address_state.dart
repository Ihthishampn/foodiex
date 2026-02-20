import 'package:flutter/material.dart';

class EmptyAddressState extends StatelessWidget {
  final VoidCallback onAddTap;

  const EmptyAddressState({super.key, required this.onAddTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                color: const Color(0xFFF0F4FB),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.location_off_outlined,
                size: 50,
                color: Color(0xFFB0BFCE),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'No Saved Addresses',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1A3557),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Add your delivery addresses to make ordering faster and easier.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF9BAABF),
                height: 1.6,
              ),
            ),
            const SizedBox(height: 28),
            ElevatedButton.icon(
              onPressed: onAddTap,
              icon: const Icon(Icons.add_rounded, size: 20),
              label: const Text(
                'Add Address',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A3557),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}