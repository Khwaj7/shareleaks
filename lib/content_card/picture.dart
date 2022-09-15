import 'package:json_annotation/json_annotation.dart';

part 'picture.g.dart';

@JsonSerializable()
class Picture {
  @JsonKey()
  String id;
  @JsonKey()
  String url;

  Picture({required this.id, required this.url});

  // DATA PERSISTANCE
  factory Picture.fromJson(Map<String, dynamic> json) =>
      _$PictureFromJson(json);

  Map<String, dynamic> toJson() => _$PictureToJson(this);
}
