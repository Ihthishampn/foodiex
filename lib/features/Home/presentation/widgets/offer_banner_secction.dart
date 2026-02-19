import 'package:flutter/material.dart';
import 'package:foodiex/constants/colors/my_colors.dart';
import 'package:foodiex/features/Home/data/ui_model/food_model.dart';
import 'package:foodiex/features/Home/presentation/widgets/offer_card.dart';

class OfferBannerSection extends StatefulWidget {
  final List<OfferItem> offers;
  const OfferBannerSection({super.key, required this.offers});

  @override
  State<OfferBannerSection> createState() => _OfferBannerSectionState();
}

class _OfferBannerSectionState extends State<OfferBannerSection> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12),
        SizedBox(
          height: 160,
          child: PageView.builder(
            controller: PageController(viewportFraction: 0.88),
            onPageChanged: (i) => setState(() => _current = i),
            itemCount: widget.offers.length,
            itemBuilder: (context, i) {
              final offer = widget.offers[i];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: OfferCard(offer: offer),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.offers.length,
            (i) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: _current == i ? 20 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: _current == i
                    ? AppColors.accent
                    : AppColors.textSecondary.withOpacity(0.3),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
