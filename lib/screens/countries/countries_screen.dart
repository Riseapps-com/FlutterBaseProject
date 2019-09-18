import 'package:flutter/material.dart';
import 'package:flutter_base_app/blocs/all_countries/all_countries.dart';
import 'package:flutter_base_app/blocs/blocs.dart';
import 'package:flutter_base_app/colors/colors.dart';
import 'package:flutter_base_app/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountriesScreen extends StatefulWidget {
  static const routeName = '/Countries';

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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

  @override
  Widget build(BuildContext context) {
    final CountriesScreenArguments arguments =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          arguments.title,
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<AllCountriesBloc, AllCountriesState>(
        builder: (context, AllCountriesState state) => (state
                is AllCountriesLoaded)
            ? ListView.builder(
                itemCount: state.countries.length,
                itemBuilder: (BuildContext context, int index) {
                  final country = state.countries[index];
                  return ListTile(
                    title: Text(country.name),
                    subtitle: Text(country.capital),
                    leading: Container(
                      width: 40.0,
                      height: 40.0,
                      child: SvgPicture.network(
                        country.flag,
                        placeholderBuilder: (BuildContext context) => Container(
                          width: 40.0,
                          height: 40.0,
                        ),
                      ),
                    ),
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
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
