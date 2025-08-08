import 'package:flutter/material.dart';
import 'package:rick_and_morty_wiki/ui/viewmodels/selection_menu_viewmodel.dart';
import 'package:rick_and_morty_wiki/ui/widgets/menu_option.dart';

class SelectionMenuView extends StatefulWidget {
  const SelectionMenuView({super.key});

  @override
  State<SelectionMenuView> createState() => _SelectionMenuViewState();
}

class _SelectionMenuViewState extends State<SelectionMenuView> {
  final viewModel = SelectionMenuViewmodel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              MenuOption(
                cover: 'assets/images/characters.jpg',
                title: 'Characters',
                onTap: () => viewModel.openView(context, '/characters'),
              ),
              MenuOption(
                cover: 'assets/images/locations.jpg',
                title: 'Locations',
                onTap: () => viewModel.openView(context, '/locations'),
              ),
              MenuOption(
                cover: 'assets/images/episodes.jpg',
                title: 'Episodes',
                onTap: () => viewModel.openView(context, '/episodes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
