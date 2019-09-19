import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_base_app/app_localizations.dart';
import 'package:flutter_base_app/colors/colors.dart';
import 'package:flutter_base_app/screens/menu/menu_screen.dart';
import 'package:package_info/package_info.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String _buildVersion;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    PackageInfo.fromPlatform().then((packageInfo) {
      setState(() {
        _buildVersion = packageInfo.version;
      });
    });
    _timer = Timer(
        Duration(seconds: 2),
        () => Navigator.pushNamedAndRemoveUntil(
            context, MenuScreen.routeName, (r) => false));
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Center(
              child: Image.asset(
                'assets/images/logo_white/logo_white.png',
                width: 200.0,
                height: 200.0,
              ),
            ),
            Visibility(
              visible: _buildVersion != null,
              child: Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    '${AppLocalizations.of(context).t('Version')} $_buildVersion',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Quicksand',
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
