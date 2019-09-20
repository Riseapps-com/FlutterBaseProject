import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_base_app/models/models.dart';
import 'package:meta/meta.dart';

class CountriesApiClient {
  static const baseUrl = 'https://restcountries.eu/rest/v2';
  static const connectTimeout = 8000;
  static const receiveTimeout = 8000;
  static const sendTimeout = 8000;

  final Dio dio;

  CountriesApiClient({@required this.dio}) : assert(dio != null);

  Future<List<Country>> fetchAllCountries() async {
    final response = await dio.get('$baseUrl/all');
    return (jsonDecode(response.data) as List)
        .map((e) => Country.fromJson(e))
        .toList();
  }

  Future<List<Country>> fetchCountriesByRegion(RegionType regionType) async {
    final response = await dio
        .get('$baseUrl/region/${regionType.toString().split('.').last}');
    return (jsonDecode(response.data) as List)
        .map((e) => Country.fromJson(e))
        .toList();
  }

  Future<Country> fetchCountryByCode(String code) async {
    final response = await dio.get('$baseUrl/alpha/$code');
    return Country.fromJson(jsonDecode(response.data));
  }
}
