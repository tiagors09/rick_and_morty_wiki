import 'package:flutter/material.dart';

class CharactersFilterTextField extends StatelessWidget
    implements PreferredSizeWidget {
  final void Function(String)? onChange;

  const CharactersFilterTextField({super.key, this.onChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: TextField(
        onChanged: onChange,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
