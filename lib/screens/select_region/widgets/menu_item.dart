import 'package:flutter/material.dart';
import 'package:flutter_base_app/app_constants.dart';
import 'package:flutter_base_app/callbacks/callbacks.dart';
import 'package:flutter_base_app/colors/colors.dart';
import 'package:flutter_base_app/models/models.dart';
import 'package:flutter_base_app/utils/countries_utils.dart';

class MenuItem extends StatefulWidget {
  final RegionItemTapCallback callback;
  final RegionType regionType;

  MenuItem({
    this.callback,
    this.regionType = RegionType.africa,
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
    if (widget.callback != null) {
      widget.callback(widget.regionType);
    }
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
                  CountriesUtils.regionTypeToImageAsset(context, widget.regionType),
                  width: 80.0,
                  height: 80.0,
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  CountriesUtils.regionTypeToString(
                      context, widget.regionType),
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
