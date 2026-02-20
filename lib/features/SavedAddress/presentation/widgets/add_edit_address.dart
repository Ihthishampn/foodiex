import 'package:flutter/material.dart';
import 'package:foodiex/features/SavedAddress/presentation/screens/saved_address_screen.dart';

class AddEditAddressSheet extends StatefulWidget {
  final AddressModel? existingAddress; // null = add mode

  const AddEditAddressSheet({super.key, this.existingAddress});

  static Future<AddressModel?> show(
    BuildContext context, {
    AddressModel? existingAddress,
  }) {
    return showModalBottomSheet<AddressModel>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => AddEditAddressSheet(existingAddress: existingAddress),
    );
  }

  @override
  State<AddEditAddressSheet> createState() => _AddEditAddressSheetState();
}

class _AddEditAddressSheetState extends State<AddEditAddressSheet> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameCtrl;
  late final TextEditingController _phoneCtrl;
  late final TextEditingController _streetCtrl;
  late final TextEditingController _stateCtrl;
  late final TextEditingController _zipCtrl;

  String _selectedLabel = 'Home';
  bool _isDefault = false;

  final List<String> _labels = ['Home', 'Work', 'Other'];

  bool get _isEdit => widget.existingAddress != null;

  @override
  void initState() {
    super.initState();
    final a = widget.existingAddress;
    _nameCtrl = TextEditingController(text: a?.recipientName ?? '');
    _phoneCtrl = TextEditingController(text: a?.phone ?? '');
    _streetCtrl = TextEditingController(text: a?.street ?? '');
    _stateCtrl = TextEditingController(text: a?.state ?? '');
    _zipCtrl = TextEditingController(text: a?.zipCode ?? '');
    _selectedLabel = a?.label ?? 'Home';
    _isDefault = a?.isDefault ?? false;
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _phoneCtrl.dispose();
    _streetCtrl.dispose();
    _stateCtrl.dispose();
    _zipCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final result = AddressModel(
      id: widget.existingAddress?.id ??
          DateTime.now().millisecondsSinceEpoch.toString(),
      label: _selectedLabel,
      recipientName: _nameCtrl.text.trim(),
      phone: _phoneCtrl.text.trim(),
      street: _streetCtrl.text.trim(),
      state: _stateCtrl.text.trim(),
      zipCode: _zipCtrl.text.trim(),
      isDefault: _isDefault,
    );

    Navigator.of(context).pop(result);
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      padding: EdgeInsets.fromLTRB(24, 0, 24, 24 + bottomInset),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle bar
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 12, bottom: 20),
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDDE3EF),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),

              // Title
              Text(
                _isEdit ? 'Edit Address' : 'Add New Address',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1A3557),
                  letterSpacing: 0.2,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                _isEdit
                    ? 'Update your delivery address details'
                    : 'Fill in the details for your new address',
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF9BAABF),
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 24),

              // Label selector
              const _SectionLabel(text: 'Address Type'),
              const SizedBox(height: 10),
              Row(
                children: _labels.map((label) {
                  final isSelected = _selectedLabel == label;
                  IconData icon = label == 'Home'
                      ? Icons.home_rounded
                      : label == 'Work'
                          ? Icons.business_center_rounded
                          : Icons.location_on_rounded;
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedLabel = label),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFF2F6FBF)
                                : const Color(0xFFF4F7FD),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected
                                  ? const Color(0xFF2F6FBF)
                                  : const Color(0xFFDDE3EF),
                            ),
                          ),
                          child: Column(
                            children: [
                              Icon(icon,
                                  size: 20,
                                  color: isSelected
                                      ? Colors.white
                                      : const Color(0xFF7A8EA8)),
                              const SizedBox(height: 4),
                              Text(
                                label,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: isSelected
                                      ? Colors.white
                                      : const Color(0xFF4A5E78),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),

              // Recipient info
              const _SectionLabel(text: 'Recipient Details'),
              const SizedBox(height: 10),
              _InputField(
                controller: _nameCtrl,
                label: 'Full Name',
                hint: 'e.g. John Doe',
                icon: Icons.person_outline,
                validator: (v) =>
                    v == null || v.isEmpty ? 'Name is required' : null,
              ),
              const SizedBox(height: 12),
              _InputField(
                controller: _phoneCtrl,
                label: 'Phone Number',
                hint: 'e.g. +1 555 000 0000',
                icon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
                validator: (v) =>
                    v == null || v.isEmpty ? 'Phone is required' : null,
              ),

              const SizedBox(height: 20),

              // Address details
              const _SectionLabel(text: 'Address Details'),
              const SizedBox(height: 10),
              _InputField(
                controller: _streetCtrl,
                label: 'Street Address',
                hint: 'e.g. 123 Main Street, Apt 4B',
                icon: Icons.map_outlined,
                validator: (v) =>
                    v == null || v.isEmpty ? 'Street is required' : null,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  
                  Expanded(
                    flex: 2,
                    child: _InputField(
                      controller: _stateCtrl,
                      label: 'State',
                      hint: 'State',
                      icon: Icons.flag_outlined,
                      validator: (v) =>
                          v == null || v.isEmpty ? 'Required' : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _InputField(
                controller: _zipCtrl,
                label: 'ZIP Code',
                hint: 'e.g. 10001',
                icon: Icons.markunread_mailbox_outlined,
                keyboardType: TextInputType.number,
                validator: (v) =>
                    v == null || v.isEmpty ? 'ZIP is required' : null,
              ),

              const SizedBox(height: 20),

              // Default toggle
              GestureDetector(
                onTap: () => setState(() => _isDefault = !_isDefault),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: _isDefault
                        ? const Color(0xFF2F6FBF).withOpacity(0.06)
                        : const Color(0xFFF4F7FD),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: _isDefault
                          ? const Color(0xFF2F6FBF).withOpacity(0.3)
                          : const Color(0xFFDDE3EF),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        _isDefault
                            ? Icons.check_circle_rounded
                            : Icons.radio_button_unchecked,
                        color: _isDefault
                            ? const Color(0xFF2F6FBF)
                            : const Color(0xFF9BAABF),
                        size: 22,
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Set as Default Address',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF1A3557),
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Use this address for all deliveries',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF9BAABF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // Save button
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1A3557),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    _isEdit ? 'Update Address' : 'Save Address',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: Color(0xFF7A8EA8),
        letterSpacing: 0.5,
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const _InputField({
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      style: const TextStyle(
        fontSize: 14,
        color: Color(0xFF1A3557),
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, size: 18, color: const Color(0xFF9BAABF)),
        labelStyle: const TextStyle(
          fontSize: 13,
          color: Color(0xFF9BAABF),
          fontWeight: FontWeight.w500,
        ),
        hintStyle: const TextStyle(
          fontSize: 13,
          color: Color(0xFFBCC8D8),
        ),
        filled: true,
        fillColor: const Color(0xFFF4F7FD),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFDDE3EF)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFDDE3EF)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              const BorderSide(color: Color(0xFF2F6FBF), width: 1.8),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1.8),
        ),
      ),
    );
  }
}