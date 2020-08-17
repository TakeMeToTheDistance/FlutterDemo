import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  ListViewPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}
/*
在 iOS 中，你可能用 UITableView 或 UICollectionView 来展示一个列表。在 Flutter 中，你可以用 ListView 来达到相似的实现。在 iOS 中，你通过代理方法来确定行数，每一个 index path 的单元格，以及单元格的尺寸。

由于 Flutter 中 widget 的不可变特性，你需要向 ListView 传递一个 widget 列表，Flutter 会确保滚动是快速且流畅的。 */
// class _SampleAppPageState extends State<ListViewPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("ListViewPage"),
//       ),
//       body: ListView(children: _getListData()),
//     );
//   }

//   _getListData() {
//     List<Widget> widgets = [];
//     for (int i = 0; i < 100; i++) {
//       widgets.add(GestureDetector(
//         child: Padding(
//           padding: EdgeInsets.all(10.0),
//           child: Text("Row $i"),
//         ),
//         onTap: () {
//           print('row tapped' + '$i');
//         },
//       ));
//     }
//     return widgets;
//   }
// }
/*在 Flutter 中，如果你想通过 setState() 方法来更新 widget 列表，你会很快发现你的数据展示并没有变化。这是因为当 setState() 被调用时，Flutter 渲染引擎会去检查 widget 树来查看是否有什么地方被改变了。当它得到你的 ListView 时，它会使用一个 == 判断，并且发现两个 ListView 是相同的。没有什么东西是变了的，因此更新不是必须的。

一个更新 ListView 的简单方法是，在 setState() 中创建一个新的 list，并把旧 list 的数据拷贝给新的 list。虽然这样很简单，但当数据集很大时，并不推荐这样做： */
class _SampleAppPageState extends State<ListViewPage> {
  List<Widget> widgets = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 100; i++) {
      widgets.add(getRow(i));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample App"),
      ),
      body: ListView(children: widgets),
    );
  }

  Widget getRow(int i) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text("Row $i"),
      ),
      onTap: () {
        setState(() {
          widgets = List.from(widgets);
          widgets.add(getRow(widgets.length + 1));
          print('row $i');
        });
      },
    );
  }
}
