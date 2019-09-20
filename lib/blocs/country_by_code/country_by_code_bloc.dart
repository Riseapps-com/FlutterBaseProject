import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_base_app/blocs/blocs.dart';
import 'package:flutter_base_app/models/models.dart';
import 'package:flutter_base_app/repositories/repositories.dart';
import 'package:meta/meta.dart';

class CountryByCodeBloc extends Bloc<CountryByCodeEvent, CountryByCodeState> {
  final CountriesRepository repository;

  CountryByCodeBloc({@required this.repository}) : assert(repository != null);

  @override
  CountryByCodeState get initialState => CountryByCodeEmpty();

  @override
  Stream<CountryByCodeState> mapEventToState(CountryByCodeEvent event) async* {
    if (event is FetchCountryByCode) {
      yield* _mapFetchCountryByCode(event);
    } else if (event is ClearCountryByCode) {
      yield* _mapClearCountryByCode();
    }
  }

  Stream<CountryByCodeState> _mapFetchCountryByCode(
      CountryByCodeEvent event) async* {
    yield CountryByCodeLoading();
    try {
      final Country country = await repository
          .fetchCountryByCode((event as FetchCountryByCode).code);
      yield CountryByCodeLoaded(country: country);
    } on DioError catch(e) {
      print(e);
      yield CountryByCodeError(error: e.message);
    }
  }

  Stream<CountryByCodeState> _mapClearCountryByCode() async* {
    yield CountryByCodeEmpty();
  }
}
