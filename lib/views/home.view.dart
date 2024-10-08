import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animecatalog/models/card.model.dart';
import 'package:animecatalog/widgets/animeContainer.widget.dart';

// Using Future Builder for dynamic data in a stateless widget
class Home extends StatelessWidget {
  const Home({super.key});

  Future<List<Anime>?> loadData() async {
    final rawData = await rootBundle.loadString("assets/data.json");
    try {
      final decodedData = dataFromJson(rawData);
      return decodedData.animes;
    } catch (error) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: loadData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  final animes = snapshot.data;
                  return AnimeContainer(animes: animes);
                } else {
                  return const CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation(Color(0xFF27A2F7)),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
