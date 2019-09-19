import 'package:flutter/material.dart';
import 'package:flutter_base_app/blocs/blocs.dart';
import 'package:flutter_base_app/colors/colors.dart';
import 'package:flutter_base_app/models/models.dart';
import 'package:flutter_base_app/screens/countries/widgets/countries_list.dart';
import 'package:flutter_base_app/screens/screens.dart';
import 'package:flutter_base_app/widgets/error.dart';
import 'package:flutter_base_app/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountriesScreen extends StatefulWidget {
  static const routeName = '/Countries';

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _fetchData());
  }

  void _fetchData() {
    final CountriesScreenArguments arguments =
        ModalRoute.of(context).settings.arguments;

    switch (arguments.countriesType) {
      case CountriesType.allCountries:
        BlocProvider.of<AllCountriesBloc>(context)
            .dispatch(FetchAllCountries());
        break;
      case CountriesType.countriesByRegion:
        BlocProvider.of<CountriesByRegionBloc>(context)
            .dispatch(FetchCountriesByRegion(regionType: arguments.regionType));
        break;
    }
  }

  Widget _getBlocBuilder() {
    final CountriesScreenArguments arguments =
        ModalRoute.of(context).settings.arguments;
    return arguments.countriesType == CountriesType.allCountries
        ? BlocBuilder<AllCountriesBloc, AllCountriesState>(
            builder: (context, AllCountriesState state) =>
                _getContentForAllCountries(state))
        : BlocBuilder<CountriesByRegionBloc, CountriesByRegionState>(
            builder: (context, CountriesByRegionState state) =>
                _getContentForCountriesByRegion(state));
  }

  Widget _getContentForAllCountries(AllCountriesState state) {
    Widget widget = Container();
    if (state is AllCountriesLoading) {
      widget = AppProgressIndicator();
    } else if (state is AllCountriesLoaded) {
      widget = _getCountriesList(state.countries);
    } else if (state is AllCountriesError) {
      widget = Error(
        error: state.error,
      );
    }
    return widget;
  }

  Widget _getContentForCountriesByRegion(CountriesByRegionState state) {
    Widget widget = Container();
    if (state is CountriesByRegionLoading) {
      widget = AppProgressIndicator();
    } else if (state is CountriesByRegionLoaded) {
      widget = _getCountriesList(state.countries);
    } else if (state is CountriesByRegionError) {
      widget = Error(
        error: state.error,
      );
    }
    return widget;
  }

  Widget _getCountriesList(List<Country> countries) => CountriesList(
        countries: countries,
        callback: _handleCountryTap,
      );

  void _handleCountryTap(int index) {
    final CountriesScreenArguments arguments =
        ModalRoute.of(context).settings.arguments;
    List<Country> countries = const [];
    if (arguments.countriesType == CountriesType.allCountries) {
      final allCountriesState = (BlocProvider.of<AllCountriesBloc>(context)
          .currentState as AllCountriesLoaded);
      countries = allCountriesState.countries;
    } else {
      final countriesByRegionState =
          (BlocProvider.of<CountriesByRegionBloc>(context).currentState
              as CountriesByRegionLoaded);
      countries = countriesByRegionState.countries;
    }
    Navigator.pushNamed(
      context,
      CountryDetailsScreen.routeName,
      arguments: CountryDetailsScreenArguments(
        title: countries[index].name,
        country: countries[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final CountriesScreenArguments arguments =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          arguments.title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: _getBlocBuilder(),
      ),
    );
  }
}

class CountriesScreenArguments {
  final String title;
  final CountriesType countriesType;
  final RegionType regionType;

  CountriesScreenArguments(
      {this.title,
      this.countriesType = CountriesType.allCountries,
      this.regionType = RegionType.africa});

  @override
  String toString() =>
      'CountriesScreenArguments{title: $title, countriesType: $countriesType, regionType: $regionType}';
}
