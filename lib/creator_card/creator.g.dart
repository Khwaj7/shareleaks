// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Creator _$CreatorFromJson(Map<String, dynamic> json) => Creator(
      id: json['id'] as String,
      creatorName: json['name'] as String,
      nbSets: json['nbSets'] as int,
      links: (json['links'] as List<dynamic>)
          .map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..sets = (json['sets'] as List<dynamic>).map((e) => e as String).toList()
      ..lastUpdated = DateTime.parse(json['lastUpdated'] as String)
      ..avatar = json['avatar'] as String;

Map<String, dynamic> _$CreatorToJson(Creator instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.creatorName,
      'nbSets': instance.nbSets,
      'links': instance.links.map((e) => e.toJson()).toList(),
      'sets': instance.sets,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
      'avatar': instance.avatar,
    };
