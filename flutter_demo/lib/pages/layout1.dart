import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LayoutAppPage extends StatefulWidget {
  LayoutAppPage({Key key}) : super(key: key);

  @override
  createState() => new _LayoutAppPageState();
}

/*
在 iOS 中，你可能会用 Storyboard 文件来组织 views，并对它们设置约束，或者，你可能在 view controller 中使用代码来设置约束。在 Flutter 中，你通过编写一个 widget 树来声明你的布局。

下面这个例子展示了如何展示一个带有 padding 的简单 widget： */
class _LayoutAppPageState extends State<LayoutAppPage> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    int _pressedCount = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text("Sample App"),
      ),
      body: Center(child: new Counter()),
    );
  }
}

//自定义计时器
class Counter extends StatefulWidget {
  // This class is the configuration for the state. It holds the
  // values (in this nothing) provided by the parent and used by the build
  // method of the State. Fields in a Widget subclass are always marked "final".

  @override
  _CounterState createState() => new _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      // This call to setState tells the Flutter framework that
      // something has changed in this State, which causes it to rerun
      // the build method below so that the display can reflect the
      // updated values. If we changed _counter without calling
      // setState(), then the build method would not be called again,
      // and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance
    // as done by the _increment method above.
    // The Flutter framework has been optimized to make rerunning
    // build methods fast, so that you can just rebuild anything that
    // needs updating rather than having to individually change
    // instances of widgets.
    return new Row(
      children: <Widget>[
        new RaisedButton(
          onPressed: _increment,
          child: new Text('Increment'),
        ),
        new Text('Count: $_counter'),
      ],
    );
  }
}
