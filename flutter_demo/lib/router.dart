import 'package:flutter/material.dart';
import 'package:flutter_demo/layout.dart';
import 'package:flutter_demo/basic_widget.dart';
import 'package:flutter_demo/pages/view.dart';
import 'package:flutter_demo/pages/layout1.dart';
import 'package:flutter_demo/pages/view_show_hide.dart';
import 'package:flutter_demo/pages/animation.dart';

class Router {
  static const detailPage = 'app://DetailPage';
  static const basicWidget = 'app://basicWidget';
  static const viewApp = 'app://viewApp';
  static const layoutApp = 'app://layoutApp';
  static const showHideApp = 'app://showHideApp';
  static const myFadeTest = 'app://MyFadeTest';

  Widget _getPage(String url, dynamic params) {
    switch (url) {
      case detailPage:
        return Layout();
      case basicWidget:
        return BasicWidget();
      case viewApp:
        return ViewAppPage();
      case layoutApp:
        return LayoutAppPage();
      case showHideApp:
        return ShowHideAppPage();
      case myFadeTest:
        return MyFadeTest();
    }
    return null;
  }

  Router.push(BuildContext context, String url, dynamic params) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, params);
    }));
  }
}
