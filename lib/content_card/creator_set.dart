import 'package:json_annotation/json_annotation.dart';

part 'creator_set.g.dart';

@JsonSerializable()
class CreatorSet {
  @JsonKey()
  late String id;

  CreatorSet({required id});

  // DATA PERSISTANCE
  factory CreatorSet.fromJson(Map<String, dynamic> json) =>
      _$CreatorSetFromJson(json);

  Map<String, dynamic> toJson() => _$CreatorSetToJson(this);
}
