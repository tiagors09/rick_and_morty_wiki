import 'package:flutter/material.dart';
import 'package:rick_and_morty_wiki/ui/viewmodels/episodes_viewmodel.dart';
import 'package:rick_and_morty_wiki/ui/widgets/episodes_grid.dart';
import 'package:rick_and_morty_wiki/ui/widgets/filter_text_field.dart';

class EpisodesView extends StatefulWidget {
  const EpisodesView({super.key});

  @override
  State<EpisodesView> createState() => _EpisodesViewState();
}

class _EpisodesViewState extends State<EpisodesView> {
  final viewModel = EpisodesViewmodel();

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
        title: Text('Episodes'),
        bottom: FilterTextField(
          onChange: viewModel.onFilterChange,
          label: 'Type a name of episode what you want to find',
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
              child: EpisodesGrid(
                episodes: viewModel.episodes,
                scrollController: viewModel.scrollController,
                onViewEp: viewModel.onViewEpisode,
              ),
            ),
    );
  }
}
