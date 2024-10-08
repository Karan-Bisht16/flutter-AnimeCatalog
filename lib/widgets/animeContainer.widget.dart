import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:animecatalog/views/detail.view.dart';
import 'package:animecatalog/models/card.model.dart';

const arrayOfDimensions = [308.0, 250.0, 100.0, 125.0, 341.0, 125.0, 125.0];

class AnimeContainer extends StatelessWidget {
  const AnimeContainer({
    super.key,
    required this.animes,
  });

  final List<Anime>? animes;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height - 125,
      child: MasonryGridView.builder(
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 0,
        itemCount: animes!.length,
        itemBuilder: (context, index) {
          final anime = animes![index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Detail(anime: anime),
                ),
              );
            },
            child: AnimeCard(anime: anime, index: index),
          );
        },
      ),
    );
  }
}

class AnimeCard extends StatelessWidget {
  const AnimeCard({
    super.key,
    required this.anime,
    required this.index,
  });

  final Anime anime;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: arrayOfDimensions[index % arrayOfDimensions.length],
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: anime.coverImage,
              fit: BoxFit.cover,
              color: const Color(0xFF27A2F7).withOpacity(0.2),
              colorBlendMode: BlendMode.darken,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 2.0,
                  right: 8.0,
                  bottom: 2.0,
                  left: 8.0,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFF27A2F7),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16.0),
                  ),
                ),
                child: Text(
                  anime.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
