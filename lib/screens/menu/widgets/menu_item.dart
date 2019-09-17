import 'package:flutter/material.dart';
import 'package:flutter_base_app/callbacks/callbacks.dart';
import 'package:flutter_base_app/models/menu_item_option.dart';

class MenuItem extends StatelessWidget {
  final MenuItemPressCallback menuItemPressCallback;
  final MenuItemOption menuItemOption;
  final bool showDivider;

  MenuItem(
      {Key key,
      this.menuItemPressCallback,
      this.menuItemOption = MenuItemOption.allCountries,
      this.showDivider});

  void _handleMenuItemTap() {
    if (menuItemPressCallback != null) {
      menuItemPressCallback(menuItemOption);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: _handleMenuItemTap,
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/images/flag/flag.png',
                width: 80.0,
                height: 80.0,
              ),
              Text(''),
            ],
          ),
        ),
        Offstage(
          offstage: showDivider,
          child: Divider(
            height: 2.0,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
