import 'package:equatable/equatable.dart';
import 'package:flutter_base_app/models/models.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CountriesByRegionState extends Equatable {
  CountriesByRegionState([List props = const []]) : super(props);
}

class CountriesByRegionEmpty extends CountriesByRegionState {
  @override
  String toString() => 'CountriesByRegionEmpty{}';
}

class CountriesByRegionLoading extends CountriesByRegionState {
  @override
  String toString() => 'CountriesByRegionLoading{}';
}

class CountriesByRegionLoaded extends CountriesByRegionState {
  final List<Country> countries;

  CountriesByRegionLoaded({@required this.countries})
      : assert(countries != null),
        super([countries]);

  @override
  String toString() => 'CountriesByRegionLoaded{countries: $countries}';
}

class CountriesByRegionError extends CountriesByRegionState {
  final String error;

  CountriesByRegionError({@required this.error})
      : assert(error != null),
        super([error]);

  @override
  String toString() => 'CountriesByRegionError{error: $error}';
}
