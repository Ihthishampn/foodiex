import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          const _FilterButton(),
          const SizedBox(width: 10),
          const Expanded(child: _OfferBanner()),
        ],
      ),
    );
  }
}

// ── Filter Button ─────────────────────────────────────────────────────────────
class _FilterButton extends StatefulWidget {
  const _FilterButton();

  @override
  State<_FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<_FilterButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
      lowerBound: 0.92,
      upperBound: 1.0,
      value: 1.0,
    );
    _scale = _ctrl;
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  Future<void> _onTap() async {
    HapticFeedback.lightImpact();
    await _ctrl.reverse();
    await _ctrl.forward();
    // TODO: Open filter sheet
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _ctrl.reverse(),
      onTapUp: (_) async {
        await _ctrl.forward();
        _onTap();
      },
      onTapCancel: () => _ctrl.forward(),
      child: ScaleTransition(
        scale: _scale,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Main button
            Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFF6B6B), Color(0xFFFFA759)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFF6B6B).withOpacity(0.35),
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  ),
                  BoxShadow(
                    color: const Color(0xFFFF6B6B).withOpacity(0.15),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.tune_rounded, color: Colors.white, size: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Offer Banner ──────────────────────────────────────────────────────────────
class _OfferBanner extends StatefulWidget {
  const _OfferBanner();

  @override
  State<_OfferBanner> createState() => _OfferBannerState();
}

class _OfferBannerState extends State<_OfferBanner>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _scale;
  bool _pressed = false;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
      lowerBound: 0.97,
      upperBound: 1.0,
      value: 1.0,
    );
    _scale = _ctrl;
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() => _pressed = true);
        _ctrl.reverse();
        HapticFeedback.selectionClick();
      },
      onTapUp: (_) {
        setState(() => _pressed = false);
        _ctrl.forward();
        // TODO: Navigate to offers
      },
      onTapCancel: () {
        setState(() => _pressed = false);
        _ctrl.forward();
      },
      child: ScaleTransition(
        scale: _scale,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: _pressed
                  ? [Colors.orange.shade400, Colors.yellow.shade600]
                  : [Colors.yellow.shade200, Colors.orange.shade300],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.orange.withOpacity(_pressed ? 0.10 : 0.28),
                blurRadius: _pressed ? 4 : 10,
                offset: Offset(0, _pressed ? 2 : 5),
              ),
            ],
          ),
          child: Row(
            children: [
              // Flame icon in a pill
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.deepOrange.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text("🔥", style: TextStyle(fontSize: 13)),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  "Today's hot offers!",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Colors.deepOrange,
                    letterSpacing: 0.1,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 6),
              // Tap cue arrow
              Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: Colors.deepOrange.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 12,
                  color: Colors.deepOrange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
