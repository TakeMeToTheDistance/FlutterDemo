import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/*在 iOS 中，在后台运行耗时任务时你会使用 UIProgressView。

在 Flutter 中，使用一个 ProgressIndicator widget。通过一个布尔 flag 来控制是否展示进度。在任务开始时，告诉 Flutter 更新状态，并在结束后隐去。

在下面的例子中，build 函数被拆分成三个函数。如果 showLoadingDialog() 是 true （当 widgets.length == 0 时），则渲染 ProgressIndicator。否则，当数据从网络请求中返回时，渲染 ListView 。 */
class TaskProgressPage extends StatefulWidget {
  TaskProgressPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<TaskProgressPage> {
  List widgets = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  showLoadingDialog() {
    return widgets.length == 0;
  }

  getBody() {
    if (showLoadingDialog()) {
      return getProgressDialog();
    } else {
      return getListView();
    }
  }

  getProgressDialog() {
    return Center(child: CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sample App"),
        ),
        body: getBody());
  }

  ListView getListView() => ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context, int position) {
        return getRow(position);
      });

  Widget getRow(int i) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: Text("Row ${widgets[i]["title"]}"));
  }

  loadData() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataURL);
    setState(() {
      widgets = json.decode(response.body);
    });
  }
}
