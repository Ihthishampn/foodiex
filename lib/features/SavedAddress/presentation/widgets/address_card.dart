import 'package:flutter/material.dart';
import 'package:foodiex/features/SavedAddress/presentation/screens/saved_address_screen.dart';

class AddressCard extends StatelessWidget {
  final AddressModel address;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onSetDefault;

  const AddressCard({
    super.key,
    required this.address,
    required this.onEdit,
    required this.onDelete,
    required this.onSetDefault,
  });

  IconData get _labelIcon {
    switch (address.label.toLowerCase()) {
      case 'home':
        return Icons.home_rounded;
      case 'work':
        return Icons.business_center_rounded;
      default:
        return Icons.location_on_rounded;
    }
  }

  Color get _labelColor {
    switch (address.label.toLowerCase()) {
      case 'home':
        return const Color(0xFF2F6FBF);
      case 'work':
        return const Color(0xFF0F9173);
      default:
        return const Color(0xFFB05E2B);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: address.isDefault
              ? const Color(0xFF2F6FBF).withOpacity(0.5)
              : const Color(0xFFEAEEF5),
          width: address.isDefault ? 1.8 : 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: address.isDefault
                ? const Color(0xFF2F6FBF).withOpacity(0.08)
                : Colors.black.withOpacity(0.05),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row: label badge + default badge + menu
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: _labelColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(_labelIcon, size: 14, color: _labelColor),
                      const SizedBox(width: 5),
                      Text(
                        address.label,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: _labelColor,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                if (address.isDefault)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2F6FBF).withOpacity(0.08),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.check_circle_rounded,
                            size: 12, color: Color(0xFF2F6FBF)),
                        SizedBox(width: 4),
                        Text(
                          'Default',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2F6FBF),
                          ),
                        ),
                      ],
                    ),
                  ),
                const Spacer(),
                _AddressPopupMenu(
                  isDefault: address.isDefault,
                  onEdit: onEdit,
                  onDelete: onDelete,
                  onSetDefault: onSetDefault,
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Recipient
            Text(
              address.recipientName,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1A3557),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              address.phone,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF7A8EA8),
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 10),
            const Divider(height: 1, color: Color(0xFFF0F3FA)),
            const SizedBox(height: 10),

            // Address
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.location_on_outlined,
                    size: 16, color: Color(0xFF9BAABF)),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    address.fullAddress,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF4A5E78),
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),

            if (!address.isDefault) ...[
              const SizedBox(height: 14),
              GestureDetector(
                onTap: onSetDefault,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F7FD),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFFDAE3F0)),
                  ),
                  child: const Center(
                    child: Text(
                      'Set as Default',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2F6FBF),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _AddressPopupMenu extends StatelessWidget {
  final bool isDefault;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onSetDefault;

  const _AddressPopupMenu({
    required this.isDefault,
    required this.onEdit,
    required this.onDelete,
    required this.onSetDefault,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert_rounded,
          color: Color(0xFF9BAABF), size: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 8,
      color: Colors.white,
      onSelected: (value) {
        if (value == 'edit') onEdit();
        if (value == 'delete') onDelete();
        if (value == 'default') onSetDefault();
      },
      itemBuilder: (_) => [
        const PopupMenuItem(
          value: 'edit',
          child: _MenuRow(icon: Icons.edit_outlined, label: 'Edit Address'),
        ),
        if (!isDefault)
          const PopupMenuItem(
            value: 'default',
            child: _MenuRow(
                icon: Icons.check_circle_outline, label: 'Set as Default'),
          ),
        const PopupMenuDivider(),
        const PopupMenuItem(
          value: 'delete',
          child: _MenuRow(
            icon: Icons.delete_outline,
            label: 'Delete',
            color: Colors.redAccent,
          ),
        ),
      ],
    );
  }
}

class _MenuRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _MenuRow({
    required this.icon,
    required this.label,
    this.color = const Color(0xFF1A3557),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: 10),
        Text(label,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w600, color: color)),
      ],
    );
  }
}