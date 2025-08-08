import 'package:flutter/material.dart';

class FilterTextField extends StatelessWidget implements PreferredSizeWidget {
  final void Function(String)? onChange;
  final String? label;

  const FilterTextField({super.key, this.onChange, this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: TextField(
        decoration: InputDecoration(
          label: Text(label ?? ''),
        ),
        onChanged: onChange,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
