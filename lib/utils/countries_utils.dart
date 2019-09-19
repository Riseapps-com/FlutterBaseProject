import 'package:flutter/cupertino.dart';
import 'package:flutter_base_app/app_localizations.dart';
import 'package:flutter_base_app/models/models.dart';

class CountriesUtils {
  static String regionTypeToString(BuildContext context, RegionType regionType) {
    String string = '';
    switch (regionType) {
      case RegionType.africa:
        string = AppLocalizations.of(context).t('Africa');
        break;
      case RegionType.americas:
        string = AppLocalizations.of(context).t('Americas');
        break;
      case RegionType.asia:
        string = AppLocalizations.of(context).t('Asia');
        break;
      case RegionType.europe:
        string = AppLocalizations.of(context).t('Europe');
        break;
      case RegionType.oceania:
        string = AppLocalizations.of(context).t('Oceania');
        break;
    }
    return string;
  }

  static String regionTypeToImageAsset(BuildContext context, RegionType regionType) {
    String imageAsset = '';
    switch (regionType) {
      case RegionType.africa:
        imageAsset = 'assets/images/africa/africa.png';
        break;
      case RegionType.americas:
        imageAsset = 'assets/images/america/america.png';
        break;
      case RegionType.asia:
        imageAsset = 'assets/images/asia/asia.png';
        break;
      case RegionType.europe:
        imageAsset = 'assets/images/europe/europe.png';
        break;
      case RegionType.oceania:
        imageAsset = 'assets/images/oceania/oceania.png';
        break;
    }
    return imageAsset;
  }

  static String menuItemToString(BuildContext context, MenuItemOption menuItemOption) {
    String string = '';
    switch (menuItemOption) {
      case MenuItemOption.allCountries:
        string = AppLocalizations.of(context).t('All Countries');
        break;
      case MenuItemOption.countriesByRegion:
        string = AppLocalizations.of(context).t('Countries by Region');
        break;
    }
    return string;
  }

  static String menuItemToImageAsset(BuildContext context, MenuItemOption menuItemOption) {
    String imageAsset = '';
    switch (menuItemOption) {
      case MenuItemOption.allCountries:
        imageAsset = 'assets/images/flag/flag.png';
        break;
      case MenuItemOption.countriesByRegion:
        imageAsset = 'assets/images/region/region.png';
        break;
    }
    return imageAsset;
  }
}
