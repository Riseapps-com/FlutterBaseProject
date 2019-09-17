import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'regional_bloc.g.dart';

@JsonSerializable()
class RegionalBloc extends Equatable {
  final String acronym;
  final String name;
  final List<String> otherAcronyms;
  final List<String> otherNames;

  RegionalBloc(
      {@required this.acronym,
      @required this.name,
      @required this.otherAcronyms,
      @required this.otherNames});

  RegionalBloc copyWith({acronym, name, otherAcronyms, otherNames}) =>
      RegionalBloc(
          acronym: acronym ?? this.acronym,
          name: name ?? this.name,
          otherAcronyms: otherAcronyms ?? this.otherAcronyms,
          otherNames: otherNames ?? this.otherNames);

  factory RegionalBloc.fromJson(Map<String, dynamic> json) => _$RegionalBlocFromJson(json);

  Map<String, dynamic> toJson() => _$RegionalBlocToJson(this);

  @override
  String toString() {
    return 'RegionalBloc{acronym: $acronym, name: $name, otherAcronyms: $otherAcronyms, otherNames: $otherNames}';
  }
}
