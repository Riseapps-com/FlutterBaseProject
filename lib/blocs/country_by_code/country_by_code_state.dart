import 'package:equatable/equatable.dart';
import 'package:flutter_base_app/models/models.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CountryByCodeState extends Equatable {
  CountryByCodeState([List props = const []]) : super(props);
}

class CountryByCodeEmpty extends CountryByCodeState {
  @override
  String toString() => 'CountryByCodeEmpty{}';
}

class CountryByCodeLoading extends CountryByCodeState {
  @override
  String toString() => 'CountryByCodeLoading{}';
}

class CountryByCodeLoaded extends CountryByCodeState {
  final Country country;

  CountryByCodeLoaded({@required this.country})
      : assert(country != null),
        super([country]);

  @override
  String toString() => 'CountryByCodeLoaded{country: $country}';
}

class CountryByCodeError extends CountryByCodeState {
  final String error;

  CountryByCodeError({@required this.error})
      : assert(error != null),
        super([error]);

  @override
  String toString() => 'CountryByCodeError{error: $error}';
}
