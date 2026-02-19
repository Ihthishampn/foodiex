import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodiex/features/cart/presentation/widgets/cart_item.dart';
import 'package:foodiex/features/cart/presentation/widgets/cart_summury.dart';
import 'package:foodiex/features/cart/presentation/widgets/check_out.dart';
import 'package:foodiex/features/cart/presentation/widgets/empty_cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static const List<Map<String, dynamic>> _cartItems = [
    {
      'name': 'Dum Biriyani',
      'price': 110,
      'qty': 2,
      'image': 'assets/images/biryani2.png',
    },
    {
      'name': 'Zinger Burger',
      'price': 116,
      'qty': 1,
      'image': 'assets/images/zingerburger.png',
    },
    {
      'name': 'Masala Dosa',
      'price': 118,
      'qty': 3,
      'image': 'assets/images/msaladosa.png',
    },
  ];

  void _showCheckout(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => CheckoutSheet(cartItems: _cartItems),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isEmpty = _cartItems.isEmpty;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F7FB),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color(0xFF1A1A2E),
              size: 20,
            ),
          ),
          title: const Text(
            "My Cart",
            style: TextStyle(
              color: Color(0xFF1A1A2E),
              fontWeight: FontWeight.w800,
              fontSize: 18,
              letterSpacing: -0.4,
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: GestureDetector(
                onTap: () {
                  // Navigate to favourites
                },
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF0F0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.favorite_rounded,
                    color: Color(0xFFFF5252),
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: isEmpty
            ? const EmptyCartView()
            : Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                      itemCount: _cartItems.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (_, i) => CartItemTile(item: _cartItems[i]),
                    ),
                  ),

                  // ✅ fixed: onCheckoutTap now has its value
                  CartSummaryBar(
                    cartItems: _cartItems,
                    onCheckoutTap: () => _showCheckout(context),
                  ),
                ],
              ),
      ),
    );
  }
}


