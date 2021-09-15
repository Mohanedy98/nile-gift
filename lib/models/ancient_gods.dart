import 'package:gift_of_the_nile/constants.dart';
import 'package:gift_of_the_nile/models/charcter.dart';

class AncientGods implements AppCharacters {
  List<AncientGodCharacter> characters;
  String type;

  AncientGods({this.characters, this.type});

  factory AncientGods.fromJson(Map<String, dynamic> json) {
    return AncientGods(
      characters: json['characters'] != null
          ? (json['characters'] as List)
              .map((i) => AncientGodCharacter.fromJson(i))
              .toList()
          : null,
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.characters != null) {
      data['characters'] = this.characters.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AncientGodCharacter implements Character {
  String since;
  String about;
  String animationName;
  String animationPath;
  List<AppearedIn> appearedIn;
  List<String> believedIn;
  List<String> consort;
  List<String> gallery;
  List<GodOf> godOf;
  int id;
  String knowMore;
  String name;
  String nickname;
  List<String> parents;
  List<String> siblings;
  String story;
  String symbol;
  String icon;
  List<String> videos;

  AncientGodCharacter(
      {this.since,
      this.about,
      this.animationName,
      this.animationPath,
      this.appearedIn,
      this.believedIn,
      this.consort,
      this.gallery,
      this.godOf,
      this.id,
      this.knowMore,
      this.name,
      this.nickname,
      this.parents,
      this.siblings,
      this.story,
      this.icon,
      this.videos,
      this.symbol});

  factory AncientGodCharacter.fromJson(Map<String, dynamic> json) {
    return AncientGodCharacter(
      since: json['when'],
      about: json['about'],
      animationName: json['animation_name'],
      animationPath: json['animation_path'],
      appearedIn: json['appeared_in'] != null
          ? (json['appeared_in'] as List)
              .map((i) => AppearedIn.fromJson(i))
              .toList()
          : null,
      believedIn: json['believed_in'] != null
          ? new List<String>.from(json['believed_in'])
          : null,
      consort: json['consort'] != null
          ? new List<String>.from(json['consort'])
          : null,
      gallery: json['gallery'] != null
          ? new List<String>.from(json['gallery'])
          : null,
      videos:
          json['videos'] != null ? new List<String>.from(json['videos']) : [],
      godOf: json['god_of'] != null
          ? (json['god_of'] as List).map((i) => GodOf.fromJson(i)).toList()
          : null,
      id: json['id'],
      knowMore: json['know_more'],
      name: json['name'],
      nickname: json['nickname'],
      parents: json['parents'] != null
          ? new List<String>.from(json['parents'])
          : null,
      siblings: json['siblings'] != null
          ? new List<String>.from(json['siblings'])
          : null,
      story: json['story'],
      symbol: json['symbol'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['`when`'] = this.since;
    data['about'] = this.about;
    data['animation_name'] = this.animationName;
    data['animation_path'] = this.animationPath;
    data['id'] = this.id;
    data['know_more'] = this.knowMore;
    data['name'] = this.name;
    data['nickname'] = this.nickname;
    data['story'] = this.story;
    data['symbol'] = this.symbol;
    if (this.appearedIn != null) {
      data['appeared_in'] = this.appearedIn.map((v) => v.toJson()).toList();
    }
    if (this.believedIn != null) {
      data['believed_in'] = this.believedIn;
    }
    if (this.consort != null) {
      data['consort'] = this.consort;
    }
    if (this.gallery != null) {
      data['gallery'] = this.gallery;
    }
    if (this.godOf != null) {
      data['god_of'] = this.godOf.map((v) => v.toJson()).toList();
    }
    if (this.parents != null) {
      data['parents'] = this.parents;
    }
    if (this.siblings != null) {
      data['siblings'] = this.siblings;
    }
    return data;
  }

  @override
  CharacterType get characterType => CharacterType.EgyptianGod;

  @override
  String get knownFor => nickname;

  @override
  int get date => int.parse(since.replaceAll('BC', ''));
}

class AppearedIn {
  double lat;
  double lon;

  AppearedIn({this.lat, this.lon});

  factory AppearedIn.fromJson(Map<String, dynamic> json) {
    return AppearedIn(
      lat: json['lat'],
      lon: json['lon'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    return data;
  }
}

class GodOf {
  String asset;
  String value;

  GodOf({this.asset, this.value});

  factory GodOf.fromJson(Map<String, dynamic> json) {
    return GodOf(
      asset: json['asset'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['asset'] = this.asset;
    data['value'] = this.value;
    return data;
  }
}
