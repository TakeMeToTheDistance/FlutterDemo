import 'package:flutter/material.dart';

/*与创建一个 “ListView” 不同，创建一个 ListView.builder 接受两个主要参数：列表的初始长度，和一个 ItemBuilder 方法。

ItemBuilder 方法和 cellForItemAt 代理方法非常类似，它接受一个位置，并且返回在这个位置上你希望渲染的 cell。

最后，也是最重要的，注意 onTap() 函数里并没有重新创建一个 list，而是 .add 了一个 widget。 */
class ListBuilderPage extends StatefulWidget {
  ListBuilderPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<ListBuilderPage> {
  List widgets = [];

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
      body: ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (BuildContext context, int position) {
          return getRow(position);
        },
      ),
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
          widgets.add(getRow(widgets.length + 1));
          print('row $i');
        });
      },
    );
  }
}
