import 'package:equatable/equatable.dart';
import 'package:flutter_base_app/models/models.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AllCountriesState extends Equatable {
  AllCountriesState([List props = const []]) : super(props);
}

class AllCountriesEmpty extends AllCountriesState {
  @override
  String toString() => 'AllCountriesEmpty{}';
}

class AllCountriesLoading extends AllCountriesState {
  @override
  String toString() => 'AllCountriesLoading{}';
}

class AllCountriesLoaded extends AllCountriesState {
  final List<Country> countries;

  AllCountriesLoaded({@required this.countries})
      : assert(countries != null),
        super([countries]);

  @override
  String toString() => 'AllCountriesLoaded{countries: $countries}';
}

class AllCountriesError extends AllCountriesState {
  final String error;

  AllCountriesError({@required this.error})
      : assert(error != null),
        super([error]);

  @override
  String toString() => 'AllCountriesError{error: $error}';
}
