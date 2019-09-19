import 'package:flutter/material.dart';
import 'package:flutter_base_app/app_constants.dart';
import 'package:flutter_base_app/app_localizations.dart';
import 'package:flutter_base_app/callbacks/callbacks.dart';
import 'package:flutter_base_app/colors/colors.dart';
import 'package:flutter_base_app/models/menu_item_option.dart';

class MenuItem extends StatefulWidget {
  final MenuItemTapCallback menuItemTapCallback;
  final MenuItemOption menuItemOption;

  MenuItem({
    Key key,
    this.menuItemTapCallback,
    this.menuItemOption = MenuItemOption.allCountries,
  });

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool _isTapped = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _isTapped = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _isTapped = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _isTapped = false;
    });
  }

  void _handleMenuItemTap() {
    if (widget.menuItemTapCallback != null) {
      widget.menuItemTapCallback(widget.menuItemOption);
    }
  }

  String _getTitle(BuildContext context) {
    String title = '';
    switch (widget.menuItemOption) {
      case MenuItemOption.allCountries:
        title = AppLocalizations.of(context).t('All Countries');
        break;
      case MenuItemOption.countriesByRegion:
        title = AppLocalizations.of(context).t('Countries by Region');
        break;
    }
    return title;
  }

  String _getImageAsset(BuildContext context) {
    String imageAsset = '';
    switch (widget.menuItemOption) {
      case MenuItemOption.allCountries:
        imageAsset = 'assets/images/flag/flag.png';
        break;
      case MenuItemOption.countriesByRegion:
        imageAsset = 'assets/images/region/region.png';
        break;
    }
    return imageAsset;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleMenuItemTap,
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: Opacity(
        opacity: _isTapped ? AppConstants.activeOpacity : 1,
        child: Container(
          color: AppColors.primaryColor,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Image.asset(
                  _getImageAsset(context),
                  width: 80.0,
                  height: 80.0,
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  _getTitle(context),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
