import 'package:flutter/material.dart' hide Divider;
import 'package:flutter_base_app/app_localizations.dart';
import 'package:flutter_base_app/colors/colors.dart';
import 'package:flutter_base_app/models/models.dart';
import 'package:flutter_base_app/screens/countries/countries_screen.dart';
import 'package:flutter_base_app/screens/screens.dart';
import 'package:flutter_base_app/screens/select_region/widgets/menu_item.dart';
import 'package:flutter_base_app/utils/countries_utils.dart';
import 'package:flutter_base_app/widgets/widgets.dart';

class SelectRegionScreen extends StatelessWidget {
  static const routeName = '/SelectRegion';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: MenuItem(
                regionType: RegionType.africa,
                callback: (RegionType regionType) => Navigator.pushNamed(
                  context,
                  CountriesScreen.routeName,
                  arguments: CountriesScreenArguments(
                    title: AppLocalizations.of(context).t(
                        CountriesUtils.regionTypeToString(context, regionType)),
                    countriesType: CountriesType.countriesByRegion,
                    regionType: regionType,
                  ),
                ),
              ),
            ),
            Divider(
              height: 2.0,
            ),
            Expanded(
              child: MenuItem(
                regionType: RegionType.americas,
                callback: (RegionType regionType) => Navigator.pushNamed(
                  context,
                  CountriesScreen.routeName,
                  arguments: CountriesScreenArguments(
                    title: AppLocalizations.of(context).t(
                        CountriesUtils.regionTypeToString(context, regionType)),
                    countriesType: CountriesType.countriesByRegion,
                    regionType: regionType,
                  ),
                ),
              ),
            ),
            Divider(
              height: 2.0,
            ),
            Expanded(
              child: MenuItem(
                regionType: RegionType.asia,
                callback: (RegionType regionType) => Navigator.pushNamed(
                  context,
                  CountriesScreen.routeName,
                  arguments: CountriesScreenArguments(
                    title: AppLocalizations.of(context).t(
                        CountriesUtils.regionTypeToString(context, regionType)),
                    countriesType: CountriesType.countriesByRegion,
                    regionType: regionType,
                  ),
                ),
              ),
            ),
            Divider(
              height: 2.0,
            ),
            Expanded(
              child: MenuItem(
                regionType: RegionType.europe,
                callback: (RegionType regionType) => Navigator.pushNamed(
                  context,
                  CountriesScreen.routeName,
                  arguments: CountriesScreenArguments(
                    title: AppLocalizations.of(context).t(
                        CountriesUtils.regionTypeToString(context, regionType)),
                    countriesType: CountriesType.countriesByRegion,
                    regionType: regionType,
                  ),
                ),
              ),
            ),
            Divider(
              height: 2.0,
            ),
            Expanded(
              child: MenuItem(
                regionType: RegionType.oceania,
                callback: (RegionType regionType) => Navigator.pushNamed(
                  context,
                  CountriesScreen.routeName,
                  arguments: CountriesScreenArguments(
                    title: AppLocalizations.of(context).t(
                        CountriesUtils.regionTypeToString(context, regionType)),
                    countriesType: CountriesType.countriesByRegion,
                    regionType: regionType,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
