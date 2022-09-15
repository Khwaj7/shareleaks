import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shareleaks/content_card/picture.dart';
import 'package:shareleaks/creator_card/creator.dart';
part 'set.g.dart';

@JsonSerializable()
class Set {
  @JsonKey(required: true)
  String id;
  @JsonKey(required: true)
  final String name;
  @JsonKey(required: true)
  final String url;
  @JsonKey()
  double nbElements;
  @JsonKey()
  final String origin;
  @JsonKey()
  final List<Picture> pictures;

  Set(
      {required this.id,
      required this.name,
      required this.url,
      required this.nbElements,
      required this.origin,
      required this.pictures});

  static List<Set> getSetsFromCreator(Creator creator) {
    List<Set> sets = [];
    var setIds;
    DatabaseReference ref =
        FirebaseDatabase.instance.ref('creators/${creator.id}/sets/');
    ref.onValue.listen((DatabaseEvent event) {
      var idsList = event.snapshot.value;
      setIds = idsList.keys.toList();
    });

    return sets;
  }

  // DATA PERSISTANCE
  factory Set.fromJson(Map<String, dynamic> json) => _$SetFromJson(json);

  Map<String, dynamic> toJson() => _$SetToJson(this);
}
