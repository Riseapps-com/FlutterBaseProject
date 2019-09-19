import 'package:flutter/cupertino.dart';
import 'package:flutter_base_app/app_localizations.dart';
import 'package:flutter_base_app/models/models.dart';

class CountriesUtils {
  String regionTypeToRegion(BuildContext context, RegionType regionType) {
    String region = '';
    switch (regionType) {
      case RegionType.africa:
        region = AppLocalizations.of(context).t('Africa');
        break;
      case RegionType.americas:
        region = AppLocalizations.of(context).t('Americas');
        break;
      case RegionType.asia:
        region = AppLocalizations.of(context).t('Asia');
        break;
      case RegionType.europe:
        region = AppLocalizations.of(context).t('Europe');
        break;
      case RegionType.oceania:
        region = AppLocalizations.of(context).t('Oceania');
        break;
    }
    return region;
  }
}
