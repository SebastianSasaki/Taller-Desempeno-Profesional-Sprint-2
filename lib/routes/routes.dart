import 'package:tdp2/ui/pages/home_page.dart';
import 'package:tdp2/ui/pages/login_page.dart';
import 'package:tdp2/ui/pages/register_page.dart';
import 'package:tdp2/ui/pages/recover_password_page.dart';
import 'package:tdp2/ui/pages/recover_password_page_2.dart';
import 'package:tdp2/ui/pages/choose_district_zone_page.dart';
import 'package:tdp2/ui/pages/warnings_page.dart';
import 'package:tdp2/ui/pages/change_district_zone_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const initialRouter = 'login';
  static Map<String, Widget Function(BuildContext)> routes = {
    'login': (BuildContext context) => const LoginPage(),
    'register': (BuildContext context) => const RegisterPage(),
    'home': (BuildContext context) => const HomePage(),
    'recoverPassword': (BuildContext context) => const RecoverPassword(),
    'recoverPassword2': (BuildContext context) => const RecoverPassword2(),
    'changeZone': (BuildContext context) => const ChangeDistrictZonePage(),
    'chooseZone': (BuildContext context) => const ChooseDistrictZonePage(),
    'warning' : (BuildContext context) => const WarningPage()
  };
  static onGeneratedRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const LoginPage());
  }
}