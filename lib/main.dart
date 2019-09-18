import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/blocs/blocs.dart';
import 'package:flutter_base_app/screens/screens.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_localizations.dart';

void main() {
  BlocSupervisor.delegate = AppBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        '/Splash': (context) => SplashScreen(),
        '/': (context) => MenuScreen(),
        '/Countries': (context) => CountriesScreen(),
        '/SelectRegion': (context) => SelectRegionScreen(),
        '/CountryDetails': (context) => CountryDetailsScreen(),
      },
      initialRoute: '/',
    );
  }
}
