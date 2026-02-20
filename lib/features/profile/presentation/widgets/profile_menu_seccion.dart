import 'package:flutter/material.dart';

class _MenuItem {
  final IconData icon;
  final String label;
  final Color? iconColor;
  final Widget? trailing;

  const _MenuItem({
    required this.icon,
    required this.label,
    this.iconColor,
    this.trailing,
  });
}

class ProfileMenuSection extends StatelessWidget {
  const ProfileMenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_MenuItem> items = [
      const _MenuItem(
        icon: Icons.notifications_outlined,
        label: 'Notifications',
      ),
      const _MenuItem(
        icon: Icons.lock_outline,
        label: 'Privacy & Security',
      ),
      const _MenuItem(
        icon: Icons.language_outlined,
        label: 'Language',
        trailing: _TrailingText('English'),
      ),
      const _MenuItem(
        icon: Icons.dark_mode_outlined,
        label: 'Appearance',
        trailing: _TrailingText('Light'),
      ),
      const _MenuItem(
        icon: Icons.star_outline,
        label: 'Rate the App',
      ),
      const _MenuItem(
        icon: Icons.share_outlined,
        label: 'Share with Friends',
      ),
      _MenuItem(
        icon: Icons.logout,
        label: 'Log Out',
        iconColor: Colors.redAccent,
      ),
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(18, 16, 18, 8),
            child: Text(
              'Settings',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1A3557),
                letterSpacing: 0.2,
              ),
            ),
          ),
          const Divider(height: 1, color: Color(0xFFF0F2F7)),
          ...items.asMap().entries.map((entry) {
            final item = entry.value;
            final isLast = entry.key == items.length - 1;
            final iconColor = item.iconColor ?? const Color(0xFF2F6FBF);

            return Column(
              children: [
                InkWell(
                  onTap: () {},
                  borderRadius: isLast
                      ? const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        )
                      : BorderRadius.zero,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 14,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: iconColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(item.icon, size: 18, color: iconColor),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Text(
                            item.label,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: item.iconColor != null
                                  ? item.iconColor
                                  : const Color(0xFF1A3557),
                            ),
                          ),
                        ),
                        item.trailing ??
                            const Icon(
                              Icons.chevron_right,
                              size: 18,
                              color: Color(0xFFBCC8D8),
                            ),
                      ],
                    ),
                  ),
                ),
                if (!isLast)
                  const Divider(
                    height: 1,
                    indent: 68,
                    color: Color(0xFFF0F2F7),
                  ),
              ],
            );
          }),
        ],
      ),
    );
  }
}

class _TrailingText extends StatelessWidget {
  final String text;
  const _TrailingText(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF9BAABF),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 4),
        const Icon(Icons.chevron_right, size: 18, color: Color(0xFFBCC8D8)),
      ],
    );
  }
}