// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) {
  return Country(
    name: json['name'] as String,
    topLevelDomain:
        (json['topLevelDomain'] as List)?.map((e) => e as String)?.toList(),
    alpha2Code: json['alpha2Code'] as String,
    alpha3Code: json['alpha3Code'] as String,
    callingCodes:
        (json['callingCodes'] as List)?.map((e) => e as String)?.toList(),
    capital: json['capital'] as String,
    altSpelling:
        (json['altSpelling'] as List)?.map((e) => e as String)?.toList(),
    region: json['region'] as String,
    subregion: json['subregion'] as String,
    population: json['population'] as int,
    latlng:
        (json['latlng'] as List)?.map((e) => (e as num)?.toDouble())?.toList(),
    demonym: json['demonym'] as String,
    area: (json['area'] as num)?.toDouble(),
    gini: (json['gini'] as num)?.toDouble(),
    timezones: (json['timezones'] as List)?.map((e) => e as String)?.toList(),
    borders: (json['borders'] as List)?.map((e) => e as String)?.toList(),
    nativeName: json['nativeName'] as String,
    numericCode: json['numericCode'] as String,
    currencies: (json['currencies'] as List)
        ?.map((e) =>
            e == null ? null : Currency.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    languages: (json['languages'] as List)
        ?.map((e) =>
            e == null ? null : Language.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    flag: json['flag'] as String,
    regionalBlocs: (json['regionalBlocs'] as List)
        ?.map((e) =>
            e == null ? null : RegionalBloc.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    cioc: json['cioc'] as String,
  );
}

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'name': instance.name,
      'topLevelDomain': instance.topLevelDomain,
      'alpha2Code': instance.alpha2Code,
      'alpha3Code': instance.alpha3Code,
      'callingCodes': instance.callingCodes,
      'capital': instance.capital,
      'altSpelling': instance.altSpelling,
      'region': instance.region,
      'subregion': instance.subregion,
      'population': instance.population,
      'latlng': instance.latlng,
      'demonym': instance.demonym,
      'area': instance.area,
      'gini': instance.gini,
      'timezones': instance.timezones,
      'borders': instance.borders,
      'nativeName': instance.nativeName,
      'numericCode': instance.numericCode,
      'currencies': instance.currencies?.map((e) => e?.toJson())?.toList(),
      'languages': instance.languages?.map((e) => e?.toJson())?.toList(),
      'flag': instance.flag,
      'regionalBlocs':
          instance.regionalBlocs?.map((e) => e?.toJson())?.toList(),
      'cioc': instance.cioc,
    };
