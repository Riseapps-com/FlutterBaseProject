import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'currency.g.dart';

@JsonSerializable()
class Currency extends Equatable {
  final String code;
  final String name;
  final String symbol;

  Currency({@required this.code, @required this.name, @required this.symbol})
      : super([code, name, symbol]);

  Currency copyWith({code, name, symbol}) => Currency(
      code: code ?? this.code,
      name: name ?? this.name,
      symbol: symbol ?? this.symbol);

  factory Currency.fromJson(Map<String, dynamic> json) => _$CurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyToJson(this);

  @override
  String toString() {
    return 'Currency{code: $code, name: $name, symbol: $symbol}';
  }
}
