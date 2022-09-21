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

  static dynamic getSetsFromCreator(Creator? creator) async {
    dynamic sets;
    String creatorid;
    if (creator == null || creator.id == null) {
      creatorid = 'caprice';
    } else {
      creatorid = creator.id;
    }
    print("ref : " 'creators/${creatorid}/sets/');
    DatabaseReference ref =
        await FirebaseDatabase.instance.ref('creators/${creatorid}/sets/');
    ref.onValue.listen((DatabaseEvent event) {
      sets = event.snapshot.value;
      print('sets set : $sets');
      return sets;
    });
  }

  // DATA PERSISTANCE
  factory Set.fromJson(Map<String, dynamic> json) => _$SetFromJson(json);

  Map<String, dynamic> toJson() => _$SetToJson(this);
}
