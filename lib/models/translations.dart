import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'translations.g.dart';

@JsonSerializable()
class Translations extends Equatable {
  final String de;
  final String es;
  final String fr;
  final String ja;
  final String it;
  final String br;
  final String pt;
  final String nl;
  final String hr;
  final String fa;

  Translations(
      {@required this.de,
      @required this.es,
      @required this.fr,
      @required this.ja,
      @required this.it,
      @required this.br,
      @required this.pt,
      @required this.nl,
      @required this.hr,
      @required this.fa});

  Translations copyWith({de, es, fr, ja, it, br, pt, nl, hr, fa}) =>
      Translations(
          de: de ?? this.de,
          es: es ?? this.es,
          fr: fr ?? this.fr,
          ja: ja ?? this.ja,
          it: it ?? this.it,
          br: br ?? this.br,
          pt: pt ?? this.pt,
          nl: nl ?? this.nl,
          hr: hr ?? this.hr,
          fa: fa ?? this.fa);

  factory Translations.fromJson(Map<String, dynamic> json) => _$TranslationsFromJson(json);

  Map<String, dynamic> toJson() => _$TranslationsToJson(this);

  @override
  String toString() {
    return 'Translations{de: $de, es: $es, fr: $fr, ja: $ja, it: $it, br: $br, pt: $pt, nl: $nl, hr: $hr, fa: $fa}';
  }
}
