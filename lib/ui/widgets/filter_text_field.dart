import 'package:flutter/material.dart';

class FilterTextField extends StatelessWidget implements PreferredSizeWidget {
  final void Function(String)? onChange;

  const FilterTextField({super.key, this.onChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: TextField(
        decoration: InputDecoration(
          label: Text('Type a name of character what you want to find'),
        ),
        onChanged: onChange,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
