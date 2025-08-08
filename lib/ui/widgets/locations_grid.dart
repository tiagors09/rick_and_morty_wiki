import 'package:flutter/material.dart';
import 'package:rick_and_morty_wiki/domain/models/location.dart';
import 'package:rick_and_morty_wiki/ui/widgets/location_grid_item.dart';

class LocationsGrid extends StatelessWidget {
  final List<Location> locations;
  final ScrollController scrollController;
  final void Function(BuildContext, Location) onViewLoc;

  const LocationsGrid({
    super.key,
    required this.locations,
    required this.scrollController,
    required this.onViewLoc,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      controller: scrollController,
      itemCount: locations.length,
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => LocationGridItem(
        l: locations[i],
        onTap: onViewLoc,
      ),
    );
  }
}
