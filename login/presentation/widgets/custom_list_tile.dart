import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String text;
  final IconData leading;
  final IconData trailing;
  const CustomListTile({
    super.key,
    required this.text,
    required this.leading,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(
          color: const Color.fromARGB(255, 100, 99, 99),
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
      leading: Icon(
        leading,
        color: const Color.fromARGB(255, 111, 111, 111),
        size: 20,
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(
          trailing,
          size: 18,
          color: const Color.fromARGB(255, 112, 111, 111),
        ),
      ),
    );
  }
}
