// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Set _$SetFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'name', 'url'],
  );
  return Set(
    id: json['id'] as String,
    name: json['name'] as String,
    url: json['url'] as String,
    nbElements: (json['nbElements'] as num).toDouble(),
    origin: json['origin'] as String,
    pictures: (json['pictures'] as List<dynamic>)
        .map((e) => Picture.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$SetToJson(Set instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'nbElements': instance.nbElements,
      'origin': instance.origin,
      'pictures': instance.pictures,
    };
