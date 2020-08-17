import 'package:flutter/material.dart';
import 'package:flutter_demo/layout.dart';
import 'package:flutter_demo/basic_widget.dart';
import 'package:flutter_demo/pages/isolate1.dart';
import 'package:flutter_demo/pages/list_builder.dart';
import 'package:flutter_demo/pages/list_view.dart';
import 'package:flutter_demo/pages/threadasync.dart';
import 'package:flutter_demo/pages/view.dart';
import 'package:flutter_demo/pages/layout1.dart';
import 'package:flutter_demo/pages/view_show_hide.dart';
import 'package:flutter_demo/pages/animation.dart';
import 'package:flutter_demo/pages/draw.dart';
import 'package:flutter_demo/pages/custom.dart';
import 'package:flutter_demo/pages/isolate1.dart';
import 'package:flutter_demo/pages/task_progress.dart';

class Router {
  static const detailPage = 'app://DetailPage';
  static const basicWidget = 'app://basicWidget';
  static const viewApp = 'app://viewApp';
  static const layoutApp = 'app://layoutApp';
  static const showHideApp = 'app://showHideApp';
  static const myFadeTest = 'app://MyFadeTest';
  static const painter = 'app://SignaturePainter';
  static const custom = 'app://custom';
  static const threadAsync = 'app://ThreadAsyncPage';
  static const isolate = 'app://IsolatePage';
  static const taskProgress = 'app://taskProgress';
  static const listView = 'app://ListViewPage';
  static const builderList = 'app://ListBuilderPage';
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
      case painter:
        return Signature();
      case custom:
        return CustomWidget();
      case threadAsync:
        return ThreadAsyncPage();
      case isolate:
        return IsolatePage();
      case taskProgress:
        return TaskProgressPage();
      case listView:
        return ListViewPage();
      case builderList:
        return ListBuilderPage();
    }
    return null;
  }

  Router.push(BuildContext context, String url, dynamic params) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, params);
    }));
  }
}
