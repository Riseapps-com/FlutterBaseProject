import 'package:flutter/material.dart' hide Divider;
import 'package:flutter_base_app/app_localizations.dart';
import 'package:flutter_base_app/colors/colors.dart';
import 'package:flutter_base_app/models/models.dart';
import 'package:flutter_base_app/screens/countries/countries_screen.dart';
import 'package:flutter_base_app/screens/menu/widgets/menu_item.dart';
import 'package:flutter_base_app/screens/screens.dart';
import 'package:flutter_base_app/widgets/widgets.dart';

class MenuScreen extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            MenuItem(
              menuItemOption: MenuItemOption.allCountries,
              menuItemPressCallback: (MenuItemOption menuItemOption) =>
                  Navigator.pushNamed(context, CountriesScreen.routeName,
                      arguments: CountriesScreenArguments(
                          title:
                              AppLocalizations.of(context).t('All Countries'),
                          countriesType: CountriesType.allCountries)),
            ),
            Divider(
              height: 2.0,
            ),
            MenuItem(
              menuItemOption: MenuItemOption.countriesByRegion,
              menuItemPressCallback: (MenuItemOption menuItemOption) =>
                  Navigator.pushNamed(context, SelectRegionScreen.routeName),
            ),
          ],
        ),
      ),
    );
  }
}
