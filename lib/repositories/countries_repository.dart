import 'package:flutter_base_app/models/models.dart';
import 'package:flutter_base_app/network/countries_api_client.dart';
import 'package:meta/meta.dart';

class CountriesRepository {
  final CountriesApiClient client;

  CountriesRepository({@required this.client}) : assert(client != null);

  Future<List<Country>> fetchAllCountries() async => client.fetchAllCountries();

  Future<List<Country>> fetchCountriesByRegion(RegionType regionType) async =>
      client.fetchCountriesByRegion(regionType);

  Future<Country> fetchCountryByCode(String code) async =>
      client.fetchCountryByCode(code);
}
