import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/blocs/blocs.dart';
import 'package:flutter_base_app/network/countries_api_client.dart';
import 'package:flutter_base_app/repositories/repositories.dart';
import 'package:flutter_base_app/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:http/http.dart' as http;

import 'app_localizations.dart';

void main() {
  BlocSupervisor.delegate = AppBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final CountriesRepository _countriesRepository = CountriesRepository(
    client: CountriesApiClient(
      httpClient: http.Client(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Base Project',
      supportedLocales: [Locale('en'), Locale('de')],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) =>
          supportedLocales.contains(locale) ? locale : supportedLocales.first,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        MenuScreen.routeName: (context) => MenuScreen(),
        CountriesScreen.routeName: (context) => MultiBlocProvider(
              providers: <BlocProvider>[
                BlocProvider<AllCountriesBloc>(
                  builder: (context) =>
                      AllCountriesBloc(repository: _countriesRepository),
                ),
                BlocProvider<CountriesByRegionBloc>(
                  builder: (context) =>
                      CountriesByRegionBloc(repository: _countriesRepository),
                )
              ],
              child: CountriesScreen(),
            ),
        SelectRegionScreen.routeName: (context) => SelectRegionScreen(),
        CountryDetailsScreen.routeName: (context) => BlocProvider(
              builder: (context) =>
                  CountryByCodeBloc(repository: _countriesRepository),
              child: CountryDetailsScreen(),
            ),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
