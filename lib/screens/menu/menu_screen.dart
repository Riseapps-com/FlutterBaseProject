import 'package:flutter/material.dart' hide Divider;
import 'package:flutter_base_app/colors/colors.dart';
import 'package:flutter_base_app/models/models.dart';
import 'package:flutter_base_app/screens/menu/widgets/menu_item.dart';
import 'package:flutter_base_app/widgets/widgets.dart';

class MenuScreen extends StatelessWidget {
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
                  Navigator.pushNamed(context, '/Countries'),
            ),
            Divider(
              height: 2.0,
            ),
            MenuItem(
              menuItemOption: MenuItemOption.countriesByRegion,
              menuItemPressCallback: (MenuItemOption menuItemOption) =>
                  Navigator.pushNamed(context, '/SelectRegion'),
            ),
          ],
        ),
      ),
    );
  }
}
