import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/app_localizations.dart';
import 'package:flutter_base_app/models/models.dart';
import 'package:flutter_base_app/widgets/widgets.dart';

class CountryDetails extends StatelessWidget {
  final Country country;

  CountryDetails({@required this.country}) : assert(country != null);

  Widget _getInfo(String title, String subtitle) => Container(
        margin: EdgeInsets.only(top: 4.0, bottom: 4.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Text('$title: ',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Expanded(
              flex: 3,
              child: Text(subtitle,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl:
                      'https://www.countryflags.io/${country.alpha2Code.toLowerCase()}/shiny/64.png',
                  placeholder: (context, url) => Container(
                    width: 64.0,
                    height: 64.0,
                  ),
                  errorWidget: (context, url, error) => ImageError(
                    width: 64.0,
                    height: 64.0,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 8.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 2.0, bottom: 2.0),
                        child: Text(country.name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 2.0, bottom: 2.0),
                        child: Text(
                          country.capital,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            _getInfo(AppLocalizations.of(context).t('Region'), country.region),
            _getInfo(
                AppLocalizations.of(context).t('Subregion'), country.subregion),
            _getInfo(AppLocalizations.of(context).t('Languages'),
                country.languages.map((e) => e.name).join(', ')),
            _getInfo(AppLocalizations.of(context).t('Currencies'),
                country.currencies.map((e) => e.code).join(', ')),
            _getInfo(AppLocalizations.of(context).t('Timezones'),
                country.timezones.join(', ')),
          ],
        ),
      ),
    );
  }
}
