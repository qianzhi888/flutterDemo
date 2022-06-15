import 'package:flutter/material.dart';
import 'package:flutter_app_demo/home/pages/appbar_demo.dart';
import 'package:flutter_app_demo/home/pages/ask_for_leave_page.dart';
import 'package:flutter_app_demo/home/pages/banner_page.dart';
import 'package:flutter_app_demo/home/pages/button_demo_page.dart';
import 'package:flutter_app_demo/home/pages/cart/cart_page.dart';
import 'package:flutter_app_demo/home/pages/date_widget_page.dart';
import 'package:flutter_app_demo/home/pages/dialog_page.dart';
import 'package:flutter_app_demo/home/pages/tabbar_controller_page.dart';
import 'package:flutter_app_demo/home/pages/text_field_page.dart';
import 'package:flutter_app_demo/home/pages/user_page.dart';
import 'package:flutter_app_demo/home/product_info_page.dart';
import 'package:flutter_app_demo/home/form_page.dart';
import 'package:flutter_app_demo/home/pages/tabs.dart';
import 'package:flutter_app_demo/home/product_page.dart';
import 'package:flutter_app_demo/home/search_page.dart';
import 'package:flutter_app_demo/home/state/provider/provider_page_demo.dart';
import 'package:flutter_app_demo/home/state/provider/state_privider_test.dart';
import 'package:flutter_app_demo/home/state/state_manager_demo.dart';
import 'package:flutter_app_demo/home/user/login_page.dart';
import 'package:flutter_app_demo/home/user/register_page.dart';
import 'package:flutter_app_demo/home/common/router_path.dart';
import '../state/state_manager_demo2.dart';

final routes = {
  RouterPath.tabsPage:(context)=>TabsPage(),
  RouterPath.formPage: (context, {arguments}) => FormPage(arguments: arguments),
  RouterPath.searchPage: (context) => SearchPage(),
  RouterPath.productPage: (context) => ProductPage(),
  RouterPath.productInfoPage: (context,{arguments}) => ProductInfopage(arguments: arguments),
  RouterPath.loginPage: (context,{arguments}) => LoginPage(arguments: arguments),
  RouterPath.registerPage: (context,{arguments}) => RegisterPage(arguments: arguments),
  RouterPath.registerSecondPage: (context,{arguments}) => RegisterPageSecond(arguments: arguments),
  RouterPath.registerThirdPage: (context) => RegisterThirdPage(),
  RouterPath.appbarDemoPage: (context) => AppBarDemoPage(),
  RouterPath.tabBarControllerPage: (context) => TabBarControllerPage(),
  RouterPath.userPage: (context) => UserPage(),
  RouterPath.buttonDemoPage: (context) => ButtonDemoPage(),
  RouterPath.askForLeavePage: (context) => AskForLeavePage(),
  RouterPath.textFieldPage: (context) => TextFieldPage(),
  RouterPath.dateWidgetPage: (context) => DateWidgetPage(),
  RouterPath.bannerPage: (context) => BannerPage(),
  RouterPath.dialogPage: (context) => DialogPage(),
  RouterPath.stateManagerDemo: (context) => StateManageDemo(),
  RouterPath.stateProviderDemo: (context) => StateProviderDemo(),
  RouterPath.providerPageDemo1: (context) => ProviderPageDemo1(),
  RouterPath.cartPage: (context) => CartPage(),
  // RouterPath.stateManagerDemo: (context) => StateManageDemo2(),
};

var baseGernerateRoute = (RouteSettings settings) {
  //统一处理
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      return MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
    } else {
      return MaterialPageRoute(
          builder: (context) => pageContentBuilder(context));
    }
  }
};