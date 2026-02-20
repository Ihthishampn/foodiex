import 'package:flutter/material.dart';
import 'package:foodiex/features/SavedAddress/presentation/widgets/add_edit_address.dart';
import '../widgets/address_card.dart';
import '../widgets/empty_address_state.dart';

class SavedAddressScreen extends StatefulWidget {
  const SavedAddressScreen({super.key});

  @override
  State<SavedAddressScreen> createState() => _SavedAddressScreenState();
}

class _SavedAddressScreenState extends State<SavedAddressScreen> {
  // Sample data — replace with your provider/bloc/state management
  final List<AddressModel> _addresses = [
    const AddressModel(
      id: '1',
      label: 'Home',
      recipientName: 'ihthisham',
      phone: '99 99999999',
      street: 'kondotty,pullikal',
      state: 'KL',
      zipCode: '10001',
      isDefault: true,
    ),
    const AddressModel(
      id: '2',
      label: 'shop',
      recipientName: 'kottakal',
      phone: '88 888888888',
      street: 'near kottakal ayurvedha',
      state: 'KL',
      zipCode: '10018',
    ),
  ];

  Future<void> _openAddSheet() async {
    final result = await AddEditAddressSheet.show(context);
    if (result != null) {
      setState(() {
        if (result.isDefault) _clearOtherDefaults(result.id);
        _addresses.add(result);
      });
    }
  }

  Future<void> _openEditSheet(AddressModel address) async {
    final result =
        await AddEditAddressSheet.show(context, existingAddress: address);
    if (result != null) {
      setState(() {
        if (result.isDefault) _clearOtherDefaults(result.id);
        final index = _addresses.indexWhere((a) => a.id == result.id);
        if (index != -1) _addresses[index] = result;
      });
    }
  }

  void _deleteAddress(String id) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text(
          'Delete Address',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Color(0xFF1A3557),
          ),
        ),
        content: const Text(
          'Are you sure you want to remove this address?',
          style: TextStyle(color: Color(0xFF4A5E78)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel',
                style: TextStyle(color: Color(0xFF7A8EA8))),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() => _addresses.removeWhere((a) => a.id == id));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 0,
            ),
            child: const Text('Delete',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }

  void _setDefault(String id) {
    setState(() {
      _clearOtherDefaults(id);
      final index = _addresses.indexWhere((a) => a.id == id);
      if (index != -1) {
        _addresses[index] = _addresses[index].copyWith(isDefault: true);
      }
    });
  }

  void _clearOtherDefaults(String exceptId) {
    for (int i = 0; i < _addresses.length; i++) {
      if (_addresses[i].id != exceptId && _addresses[i].isDefault) {
        _addresses[i] = _addresses[i].copyWith(isDefault: false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A3557),
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              size: 20, color: Colors.white),
        ),
        title: const Text(
          'Saved Addresses',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            height: 1,
            color: Colors.white.withOpacity(0.08),
          ),
        ),
      ),
      body: _addresses.isEmpty
          ? EmptyAddressState(onAddTap: _openAddSheet)
          : ListView(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 100),
              physics: const BouncingScrollPhysics(),
              children: [
                // Count header
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: [
                      Text(
                        '${_addresses.length} ${_addresses.length == 1 ? 'Address' : 'Addresses'} Saved',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF7A8EA8),
                        ),
                      ),
                    ],
                  ),
                ),

                // Address cards — default first
                ...([..._addresses]
                  ..sort((a, b) => b.isDefault ? 1 : -1))
                    .map(
                  (address) => AddressCard(
                    key: ValueKey(address.id),
                    address: address,
                    onEdit: () => _openEditSheet(address),
                    onDelete: () => _deleteAddress(address.id),
                    onSetDefault: () => _setDefault(address.id),
                  ),
                ),
              ],
            ),

      // FAB to add new address
      floatingActionButton: _addresses.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: _openAddSheet,
              backgroundColor: const Color(0xFF1A3557),
              foregroundColor: Colors.white,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              icon: const Icon(Icons.add_rounded, size: 22),
              label: const Text(
                'Add Address',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.2,
                ),
              ),
            )
          : null,
    );
  }
}


class AddressModel {
  final String id;
  final String label;
  final String recipientName;
  final String phone;
  final String street;
  final String state;
  final String zipCode;
  final bool isDefault;

  const AddressModel({
    required this.id,
    required this.label,
    required this.recipientName,
    required this.phone,
    required this.street,
    required this.state,
    required this.zipCode,
    this.isDefault = false,
  });

  AddressModel copyWith({
    String? id,
    String? label,
    String? recipientName,
    String? phone,
    String? street,
    String? city,
    String? state,
    String? zipCode,
    bool? isDefault,
  }) {
    return AddressModel(
      id: id ?? this.id,
      label: label ?? this.label,
      recipientName: recipientName ?? this.recipientName,
      phone: phone ?? this.phone,
      street: street ?? this.street,
      state: state ?? this.state,
      zipCode: zipCode ?? this.zipCode,
      isDefault: isDefault ?? this.isDefault,
    );
  }

  String get fullAddress => '$street, $state $zipCode';
}
