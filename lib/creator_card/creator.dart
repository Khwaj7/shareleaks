import 'package:json_annotation/json_annotation.dart';

import 'package:shareleaks/link.dart';

part 'creator.g.dart';

@JsonSerializable(explicitToJson: true)
class Creator {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'name')
  final String creatorName;

  final int nbSets;
  // list of Link - creator's pages on social networks
  @JsonKey(name: 'links')
  final List<Link> links;

  // list of IDs of the creator's sets
  late List<String> sets;
  late DateTime lastUpdated;
  late String avatar;

  // DATA PERSISTENCE
  factory Creator.fromJson(Map<String, dynamic> json) =>
      _$CreatorFromJson(json);

  Map<String, dynamic> toJson() => _$CreatorToJson(this);
  // END OF DATA PERSISTANCE

  // never used
  Creator(
      {required this.id,
      required this.creatorName,
      required this.nbSets,
      required this.links}) {
    lastUpdated = DateTime.now();
    avatar = 'assets/card-sample-image-2.jpg';
  }
  // always used
  Creator.creatorWithAvatar(
      {required this.id,
      required this.creatorName,
      required this.nbSets,
      required this.links,
      required this.avatar}) {
    lastUpdated = DateTime.now();
    sets = [];
  }

  Creator.creatorComplete(
      {required this.id,
      required this.creatorName,
      required this.nbSets,
      required this.avatar,
      required this.lastUpdated,
      required this.links,
      required this.sets});
}
