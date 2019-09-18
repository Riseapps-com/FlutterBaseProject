import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import 'models.dart';

part 'country.g.dart';

@JsonSerializable(explicitToJson: true)
class Country extends Equatable {
  final String name;
  final List<String> topLevelDomain;
  final String alpha2Code;
  final String alpha3Code;
  final List<String> callingCodes;
  final String capital;
  final List<String> altSpelling;
  final String region;
  final String subregion;
  final int population;
  final List<double> latlng;
  final String demonym;
  final double area;
  final double gini;
  final List<String> timezones;
  final List<String> borders;
  final String nativeName;
  final String numericCode;
  final List<Currency> currencies;
  final List<Language> languages;
  final String flag;
  final List<RegionalBloc> regionalBlocs;
  final String cioc;

  Country(
      {@required this.name,
      @required this.topLevelDomain,
      @required this.alpha2Code,
      @required this.alpha3Code,
      @required this.callingCodes,
      @required this.capital,
      @required this.altSpelling,
      @required this.region,
      @required this.subregion,
      @required this.population,
      @required this.latlng,
      @required this.demonym,
      @required this.area,
      @required this.gini,
      @required this.timezones,
      @required this.borders,
      @required this.nativeName,
      @required this.numericCode,
      @required this.currencies,
      @required this.languages,
      @required this.flag,
      @required this.regionalBlocs,
      @required this.cioc})
      : super([
          name,
          topLevelDomain,
          alpha2Code,
          alpha3Code,
          callingCodes,
          capital,
          altSpelling,
          region,
          subregion,
          population,
          latlng,
          demonym,
          area,
          gini,
          timezones,
          borders,
          nativeName,
          numericCode,
          currencies,
          languages,
          flag,
          regionalBlocs,
          cioc
        ]);

  Country copyWith(
          {name,
          topLevelDomain,
          alpha2Code,
          alpha3Code,
          callingCodes,
          capital,
          altSpelling,
          region,
          subregion,
          population,
          latlng,
          demonym,
          area,
          gini,
          timezones,
          borders,
          nativeName,
          numericCode,
          currencies,
          languages,
          flag,
          regionalBlocs,
          cioc}) =>
      Country(
          name: name ?? this.name,
          topLevelDomain: topLevelDomain ?? this.topLevelDomain,
          alpha2Code: alpha2Code ?? this.alpha2Code,
          alpha3Code: alpha3Code ?? this.alpha3Code,
          callingCodes: callingCodes ?? this.callingCodes,
          capital: capital ?? this.capital,
          altSpelling: altSpelling ?? this.altSpelling,
          region: region ?? this.region,
          subregion: subregion ?? this.subregion,
          population: population ?? this.population,
          latlng: latlng ?? this.latlng,
          demonym: demonym ?? this.demonym,
          area: area ?? this.area,
          gini: gini ?? this.gini,
          timezones: timezones ?? this.timezones,
          borders: borders ?? this.borders,
          nativeName: nativeName ?? this.nativeName,
          numericCode: numericCode ?? this.numericCode,
          currencies: currencies ?? this.currencies,
          languages: languages ?? this.languages,
          flag: flag ?? this.flag,
          regionalBlocs: regionalBlocs ?? this.regionalBlocs,
          cioc: cioc ?? this.cioc);

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);

  @override
  String toString() =>
      'Country{name: $name, topLevelDomain: $topLevelDomain, alpha2Code: $alpha2Code, alpha3Code: $alpha3Code, callingCodes: $callingCodes, capital: $capital, altSpelling: $altSpelling, region: $region, subregion: $subregion, population: $population, latlng: $latlng, demonym: $demonym, area: $area, gini: $gini, timezones: $timezones, borders: $borders, nativeName: $nativeName, numericCode: $numericCode, currencies: $currencies, languages: $languages, flag: $flag, regionalBlocs: $regionalBlocs, cioc: $cioc}';
}
