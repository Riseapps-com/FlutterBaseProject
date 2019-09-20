import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/callbacks/callbacks.dart';
import 'package:flutter_base_app/models/models.dart';
import 'package:flutter_base_app/widgets/widgets.dart';

class CountriesList extends StatelessWidget {
  final List<Country> countries;
  final CountryTapCallback callback;

  CountriesList({this.countries = const [], this.callback});

  void _handleCountryTap(int index) {
    if (callback != null) {
      callback(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: countries.length,
      itemBuilder: (BuildContext context, int index) {
        final country = countries[index];
        return ListTile(
          title: Text(
            country.name,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: 'Quciksand',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            country.capital,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: 'Quciksand',
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: Container(
            width: 40.0,
            height: 40.0,
            child: Center(
              child: CachedNetworkImage(
                width: 40.0,
                height: 40.0,
                imageUrl:
                    'https://www.countryflags.io/${country.alpha2Code.toLowerCase()}/flat/64.png',
                placeholder: (context, url) => Container(
                  width: 40.0,
                  height: 40.0,
                ),
                errorWidget: (context, url, error) => ImageError(
                  width: 40.0,
                  height: 40.0,
                ),
              ),
            ),
          ),
          onTap: () => _handleCountryTap(index),
        );
      },
    );
  }
}
