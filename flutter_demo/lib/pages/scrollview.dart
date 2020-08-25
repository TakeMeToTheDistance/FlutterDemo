import 'package:flutter/material.dart';
/*
 * 在 iOS 中，你给 view 包裹上 ScrollView 来允许用户在需要时滚动你的内容。

在 Flutter 中，最简单的方法是使用 ListView widget。它表现得既和 iOS 中的 ScrollView 一致，也能和 TableView 一致，因为你可以给它的 widget 做垂直排布：
 */

class ScrollviewPage extends StatefulWidget {
  ScrollviewPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<ScrollviewPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Text('Row One'),
        Text('Row Two'),
        Text('Row Three'),
        Text('Row Four'),
      ],
    );
  }
}
