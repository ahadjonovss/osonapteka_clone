import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:osonapteka_app/pages/create_account.dart';
import 'package:osonapteka_app/pages/home_page_1.1.dart';
import 'package:osonapteka_app/pages/loginPage.dart';
import 'package:osonapteka_app/pages/onboarding.dart';
import 'package:osonapteka_app/pages/success_purchase_page.dart';
import 'package:osonapteka_app/pages/welcome_page.dart';

class RouteName{
  static const welcomepage="welcome";
  static const loginPage="loginPage";
  static const purchase="purchase";
  static const create_account="crt_account";
  static const home="home";
  static const onboard="onboard";

}

class AppRoutes{

  static Route generateRoute(RouteSettings settings){

    switch(settings.name){
      case RouteName.welcomepage:
        return MaterialPageRoute(builder: (_)=>WelcomePage());
      case RouteName.onboard:
        return MaterialPageRoute(builder: (_)=>Onboarding());

      case RouteName.loginPage:
        return MaterialPageRoute(builder: (_)=>LoginPage());

      case RouteName.create_account:
        return MaterialPageRoute(builder: (_)=>CreateAccount());

      case RouteName.purchase:
        return MaterialPageRoute(builder: (_)=>PurchasePage());
      case RouteName.purchase:
        return MaterialPageRoute(builder: (_)=>HomePage());


      default: return MaterialPageRoute(builder: (_)=>Scaffold());
    }
  }
}