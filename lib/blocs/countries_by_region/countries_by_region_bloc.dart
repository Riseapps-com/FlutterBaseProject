import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_base_app/blocs/blocs.dart';
import 'package:flutter_base_app/models/models.dart';
import 'package:flutter_base_app/repositories/repositories.dart';
import 'package:meta/meta.dart';

class CountriesByRegionBloc
    extends Bloc<CountriesByRegionEvent, CountriesByRegionState> {
  final CountriesRepository repository;

  CountriesByRegionBloc({@required this.repository})
      : assert(repository != null);

  @override
  CountriesByRegionState get initialState => CountriesByRegionEmpty();

  @override
  Stream<CountriesByRegionState> mapEventToState(
      CountriesByRegionEvent event) async* {
    if (event is FetchCountriesByRegion) {
      yield* _mapFetchCountriesByRegion(event);
    } else if (event is ClearCountriesByRegion) {
      yield* _mapClearCountriesByRegion();
    }
  }

  Stream<CountriesByRegionState> _mapFetchCountriesByRegion(
      CountriesByRegionEvent event) async* {
    yield CountriesByRegionLoading();
    try {
      final List<Country> countries = await repository
          .fetchCountriesByRegion((event as FetchCountriesByRegion).regionType);
      yield CountriesByRegionLoaded(countries: countries);
    } on DioError catch(e) {
      yield CountriesByRegionError(error: e.message);
    }
  }

  Stream<CountriesByRegionState> _mapClearCountriesByRegion() async* {
    yield CountriesByRegionEmpty();
  }
}
