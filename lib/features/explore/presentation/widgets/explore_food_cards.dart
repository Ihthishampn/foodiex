import 'package:flutter/material.dart';

class ExploreFoodCards extends StatefulWidget {
  final int index;
  const ExploreFoodCards({super.key, required this.index});

  @override
  State<ExploreFoodCards> createState() => _ExploreFoodCardsState();
}

class _ExploreFoodCardsState extends State<ExploreFoodCards>
    with SingleTickerProviderStateMixin {
  bool _isFavorited = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
    );
    _scaleAnim = Tween<double>(
      begin: 1.0,
      end: 0.94,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final name = text[widget.index];
    final imgPath = imagess[widget.index];
    final itemPrice = price[widget.index];

    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) => _controller.reverse(),
      onTapCancel: () => _controller.reverse(),
      child: AnimatedBuilder(
        animation: _scaleAnim,
        builder: (context, child) =>
            Transform.scale(scale: _scaleAnim.value, child: child),
        child: Container(

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.07),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
              BoxShadow(
                color: Colors.orange.withOpacity(0.04),
                blurRadius: 30,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Image with badge & favourite ──────────────────────────
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    child: SizedBox(
                      height: 140,
                      width: double.infinity,
                      child: Image.asset(imgPath, fit: BoxFit.cover),
                    ),
                  ),

                  // Gradient overlay at bottom of image
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.35),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Rating badge
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.12),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.star_rounded,
                            size: 12,
                            color: Color(0xFFFFA726),
                          ),
                          SizedBox(width: 3),
                          Text(
                            "4.8",
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Favourite button
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: () => setState(() => _isFavorited = !_isFavorited),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: _isFavorited
                              ? const Color(0xFFFF5252)
                              : Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.12),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Icon(
                          _isFavorited
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          size: 16,
                          color: _isFavorited
                              ? Colors.white
                              : const Color(0xFFBDBDBD),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // ── Info section ─────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Food name
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A1A),
                        letterSpacing: -0.2,
                      ),
                    ),

                    const SizedBox(height: 3),

                    // Prep time tag
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time_rounded,
                          size: 11,
                          color: Color(0xFF9E9E9E),
                        ),
                        const SizedBox(width: 3),
                        Text(
                          "20–25 min",
                          style: const TextStyle(
                            fontSize: 11,
                            color: Color(0xFF9E9E9E),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Price + ADD button row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Price
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Price",
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xFFBDBDBD),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "₹$itemPrice",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF2E7D32),
                                letterSpacing: -0.3,
                              ),
                            ),
                          ],
                        ),

                        // ADD button
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 7,
                            ),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF43A047), Color(0xFF2E7D32)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(
                                    0xFF43A047,
                                  ).withOpacity(0.35),
                                  blurRadius: 8,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: const Text(
                              "+ Add",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                letterSpacing: 0.3,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final List<String> imagess = [
  "assets/images/biryani2.png",
  "assets/images/burger1.png",
  "assets/images/pizza2.png",
  "assets/images/zingerburger.png",
  "assets/images/msaladosa.png",
];
final List<String> text = [
  "Dum Biriyani",
  "Burger",
  "Pizza",
  "Zinger Burger",
  "Masala Dosa",
];
final List<String> price = ["110", "111", "113", "116", "118"];
