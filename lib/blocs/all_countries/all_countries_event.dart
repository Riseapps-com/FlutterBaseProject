import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AllCountriesEvent extends Equatable {
  AllCountriesEvent([List props = const []]) : super(props);
}

class FetchAllCountries extends AllCountriesEvent {
  @override
  String toString() {
    return 'FetchAllCountries{}';
  }
}

class ClearAllCountries extends AllCountriesEvent {
  @override
  String toString() {
    return 'ClearAllCountries{}';
  }
}
