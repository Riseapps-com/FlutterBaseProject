import 'dart:convert';

import 'package:flutter_base_app/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class CountriesApiClient {
  static const baseUrl = 'https://restcountries.eu/rest/v2';
  final http.Client httpClient;

  CountriesApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<List<Country>> fetchAllCountries() async {
    final response = await httpClient.get('$baseUrl/all');
    if (response.statusCode != 200) {
      throw Exception(
          'Error when fetching all countries, response = ${response.body}');
    }
    return (jsonDecode(response.body) as List)
        .map((e) => Country.fromJson(e))
        .toList();
  }

  Future<List<Country>> fetchCountriesByRegion(RegionType regionType) async {
    final response = await httpClient
        .get('$baseUrl/region/${regionType.toString().split('.').last}');
    if (response.statusCode != 200) {
      throw Exception(
          'Error when fetching countries by region, response = ${response.body}');
    }
    return (jsonDecode(response.body) as List)
        .map((e) => Country.fromJson(e))
        .toList();
  }

  Future<Country> fetchCountryByCode(String code) async {
    final response = await httpClient.get('$baseUrl/alpha/$code');
    if (response.statusCode != 200) {
      throw Exception(
          'Error when fetching country by code, response = ${response.body}');
    }
    return Country.fromJson(jsonDecode(response.body));
  }
}
