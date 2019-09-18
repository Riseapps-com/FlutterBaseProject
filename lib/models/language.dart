import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'language.g.dart';

@JsonSerializable()
class Language extends Equatable {
  final String iso639_1;
  final String iso639_2;
  final String name;
  final String nativeName;

  Language(
      {@required this.iso639_1,
      @required this.iso639_2,
      @required this.name,
      @required this.nativeName});

  Language copyWith({iso639_1, iso639_2, name, nativeName}) => Language(
      iso639_1: iso639_1 ?? this.iso639_1,
      iso639_2: iso639_2 ?? this.iso639_2,
      name: name ?? this.name,
      nativeName: nativeName ?? this.nativeName);

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageToJson(this);

  @override
  String toString() =>
      'Language{iso639_1: $iso639_1, iso639_2: $iso639_2, name: $name, nativeName: $nativeName}';
}
