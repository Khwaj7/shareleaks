import 'package:json_annotation/json_annotation.dart';

part 'link.g.dart';

@JsonSerializable()
class Link {
  // a representation of DB link (creator's links to content)
  @JsonKey(required: true)
  final String name;
  @JsonKey(required: true)
  final String url;

  Link({required this.name, required this.url});

  // DATA PERSISTENCE
  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);

  Map<String, dynamic> toJson() => _$LinkToJson(this);
  // END OF DATA PERSISTANCE
}
