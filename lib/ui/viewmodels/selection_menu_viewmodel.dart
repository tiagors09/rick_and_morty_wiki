import 'package:flutter/material.dart';

class SelectionMenuViewmodel {
  void openView(BuildContext ctx, String route) =>
      Navigator.of(ctx).pushNamed(route);
}
