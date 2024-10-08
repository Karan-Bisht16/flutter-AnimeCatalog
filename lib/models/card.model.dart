import 'dart:convert';

AnimeCollection dataFromJson(String str) {
  final jsonDATA = json.decode(str);
  return AnimeCollection.fromJson(jsonDATA);
}

String dataToJson(AnimeCollection data) {
  final str = data.toJson();
  return json.encode(str);
}

class AnimeCollection {
  List<Anime>? animes;

  AnimeCollection({
    this.animes,
  });

  factory AnimeCollection.fromJson(Map<String, dynamic> json) {
    return AnimeCollection(
      animes: List<Anime>.from(
        json["animes"]!.map((x) => Anime.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        "animes": List<dynamic>.from(
          animes!.map((x) => x.toJson()),
        ),
      };
}

class Anime {
  String name;
  String description;
  String coverImage;
  List<String>? bestMoments;
  List<Character>? characters;
  double myRating;

  Anime({
    required this.name,
    required this.description,
    required this.coverImage,
    this.bestMoments,
    this.characters,
    required this.myRating,
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      name: json["name"],
      description: json["description"],
      coverImage: json["coverImage"],
      bestMoments: json["bestMoments"] != null
          ? List<String>.from(json["bestMoments"].map((x) => x))
          : null,
      characters: json["characters"] != null
          ? List<Character>.from(
              json["characters"].map((x) => Character.fromJson(x)))
          : null,
      myRating: json["myRating"].toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "coverImage": coverImage,
        "bestMoments": bestMoments != null
            ? List<dynamic>.from(bestMoments!.map((x) => x))
            : null,
        "characters": characters != null
            ? List<dynamic>.from(characters!.map((x) => x.toJson()))
            : null,
        "myRating": myRating,
      };
}

class Character {
  String name;
  String characterImage;
  String quality;

  Character({
    required this.name,
    required this.characterImage,
    required this.quality,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json["name"],
      characterImage: json["characterImage"],
      quality: json["quality"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "characterImage": characterImage,
        "quality": quality,
      };
}
