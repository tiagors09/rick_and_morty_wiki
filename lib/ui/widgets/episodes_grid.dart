import 'package:flutter/material.dart';
import 'package:rick_and_morty_wiki/domain/models/episode.dart';
import 'package:rick_and_morty_wiki/ui/widgets/episode_grid_item.dart';

class EpisodesGrid extends StatelessWidget {
  final List<Episode> episodes;
  final ScrollController scrollController;
  final void Function(BuildContext, Episode) onViewEp;

  const EpisodesGrid({
    super.key,
    required this.episodes,
    required this.scrollController,
    required this.onViewEp,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      controller: scrollController,
      itemCount: episodes.length,
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => EpisodeGridItem(
        e: episodes[i],
        onTap: onViewEp,
      ),
    );
  }
}
