import 'package:flutter/material.dart';
import 'package:immersion/src/utils/ui_library/list/article_tile.dart';

class ArticleCarousel extends StatelessWidget {
  const ArticleCarousel({
    required this.tiles,
    super.key,
  });

  final List<ArticleTile> tiles;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: tiles.length,
        itemBuilder: (context, index) {
          final currentTile = tiles[index];
          return currentTile;
        },
      ),
    );
  }
}
