// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'regional_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegionalBloc _$RegionalBlocFromJson(Map<String, dynamic> json) {
  return RegionalBloc(
    acronym: json['acronym'] as String,
    name: json['name'] as String,
    otherAcronyms:
        (json['otherAcronyms'] as List)?.map((e) => e as String)?.toList(),
    otherNames: (json['otherNames'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$RegionalBlocToJson(RegionalBloc instance) =>
    <String, dynamic>{
      'acronym': instance.acronym,
      'name': instance.name,
      'otherAcronyms': instance.otherAcronyms,
      'otherNames': instance.otherNames,
    };
