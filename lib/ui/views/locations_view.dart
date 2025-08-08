import 'package:flutter/material.dart';
import 'package:rick_and_morty_wiki/ui/viewmodels/locations_viewmodel.dart';
import 'package:rick_and_morty_wiki/ui/widgets/filter_text_field.dart';
import 'package:rick_and_morty_wiki/ui/widgets/locations_grid.dart';

class LocationsView extends StatefulWidget {
  const LocationsView({super.key});

  @override
  State<LocationsView> createState() => _LocationsViewState();
}

class _LocationsViewState extends State<LocationsView> {
  final viewModel = LocationsViewmodel();

  @override
  void initState() {
    super.initState();
    viewModel.fetchAllEpisodes();
    viewModel.addListener(() {
      setState(() {});
    });
    viewModel.scrollController.addListener(() {
      viewModel.maybeLoadMoreEpisodes();
    });
  }

  @override
  void dispose() {
    viewModel.removeListener(() {});
    viewModel.scrollController.dispose();
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Locations'),
        bottom: FilterTextField(
          onChange: viewModel.onFilterChange,
          label: 'Type a name of location what you want to find',
        ),
      ),
      body: viewModel.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : viewModel.errorMessage != null
          ? Center(
              child: Text(
                viewModel.errorMessage!,
              ),
            )
          : RefreshIndicator(
              onRefresh: () => viewModel.fetchAllEpisodes(),
              child: LocationsGrid(
                locations: viewModel.locations,
                scrollController: viewModel.scrollController,
                onViewLoc: viewModel.onViewEpisode,
              ),
            ),
    );
  }
}
