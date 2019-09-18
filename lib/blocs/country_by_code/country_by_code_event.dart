import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CountryByCodeEvent extends Equatable {
  CountryByCodeEvent([List props = const []]) : super(props);
}

class FetchCountryByCode extends CountryByCodeEvent {
  final String code;

  FetchCountryByCode({@required this.code})
      : assert(code != null),
        super([code]);

  @override
  String toString() => 'FetchCountryByCode{code: $code}';
}

class ClearCountryByCode extends CountryByCodeEvent {
  @override
  String toString() => 'ClearCountryByCode{}';
}
