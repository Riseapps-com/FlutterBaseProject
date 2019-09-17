import 'package:equatable/equatable.dart';
import 'package:flutter_base_app/models/models.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CountriesByRegionEvent extends Equatable {
  CountriesByRegionEvent([List props = const []]) : super(props);
}

class FetchCountriesByRegion extends CountriesByRegionEvent {
  final RegionType regionType;

  FetchCountriesByRegion({@required this.regionType})
      : assert(regionType != null),
        super([regionType]);

  @override
  String toString() {
    return 'FetchCountriesByRegion{regionType: $regionType}';
  }
}

class ClearCountriesByRegion extends CountriesByRegionEvent {
  @override
  String toString() {
    return 'ClearCountriesByRegion{}';
  }
}
