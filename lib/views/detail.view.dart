import 'package:flutter/material.dart';
import 'package:animecatalog/models/card.model.dart';

class Detail extends StatelessWidget {
  const Detail({
    super.key,
    required this.anime,
  });

  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        title: Text(
          anime.name,
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white54, //change your color here
        ),
        backgroundColor: const Color(0xFF020412),
      ),
      body: DetailBody(anime: anime),
    );
  }
}

class DetailBody extends StatelessWidget {
  const DetailBody({
    super.key,
    required this.anime,
  });

  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: SizedBox(
                    width: MediaQuery.sizeOf(context).width / 2,
                    child: Image.network(
                      anime.coverImage,
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            const DetailBodyTitle(title: "A brief synopsis:"),
            DetailBodyContent(content: anime.description),
            const DetailBodyTitle(title: "My thoughts & review: "),
            //   DetailBodyContent(content: anime.review),
            const SizedBox(height: 8.0),
            RichText(
              text: TextSpan(
                text: "My rating: ",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "${anime.myRating}/10",
                    style: const TextStyle(
                      color: Color(0xFF27A2F7),
                      fontSize: 18.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            const DetailBodyTitle(title: "My favourite characters:"),
            ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.all(8),
              itemCount: anime.characters!.length,
              itemBuilder: (BuildContext context, int index) {
                final characters = anime.characters;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            characters![index].characterImage,
                            height: 50,
                            width: 50,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width - 110,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              characters[index].name,
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              characters[index].quality,
                              style: const TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DetailBodyTitle extends StatelessWidget {
  const DetailBodyTitle({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          title,
          textAlign: TextAlign.start,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class DetailBodyContent extends StatelessWidget {
  const DetailBodyContent({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: const TextStyle(
        color: Colors.white70,
      ),
    );
  }
}
