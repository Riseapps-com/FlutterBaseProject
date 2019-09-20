import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_base_app/blocs/blocs.dart';
import 'package:flutter_base_app/models/models.dart';
import 'package:flutter_base_app/repositories/repositories.dart';
import 'package:meta/meta.dart';

class AllCountriesBloc extends Bloc<AllCountriesEvent, AllCountriesState> {
  final CountriesRepository repository;

  AllCountriesBloc({@required this.repository}) : assert(repository != null);

  @override
  AllCountriesState get initialState => AllCountriesEmpty();

  @override
  Stream<AllCountriesState> mapEventToState(AllCountriesEvent event) async* {
    if (event is FetchAllCountries) {
      yield* _mapFetchAllCountriesToState();
    } else if (event is ClearAllCountries) {
      yield* _mapClearAllCountriesToState();
    }
  }

  Stream<AllCountriesState> _mapFetchAllCountriesToState() async* {
    yield AllCountriesLoading();
    try {
      final List<Country> countries = await repository.fetchAllCountries();
      yield AllCountriesLoaded(countries: countries);
    } on DioError catch(e) {
      yield AllCountriesError(error: e.message);
    }
  }

  Stream<AllCountriesState> _mapClearAllCountriesToState() async* {
    yield AllCountriesEmpty();
  }
}
