import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/*Dart 是单线程执行模型，但是它支持 Isolate（一种让 Dart 代码运行在其他线程的方式）、事件循环和异步编程。除非你自己创建一个 Isolate ，否则你的 Dart 代码永远运行在 UI 线程，并由 event loop 驱动。Flutter 的 event loop 和 iOS 中的 main loop 相似——Looper 是附加在主线程上的。

Dart 的单线程模型并不意味着你写的代码一定是阻塞操作，从而卡住 UI。相反，使用 Dart 语言提供的异步工具，例如 async / await ，来实现异步操作。

举个例子，你可以使用 async / await 来让 Dart 帮你做一些繁重的工作，编写网络请求代码而不会挂起 UI：

一旦 await 到网络请求完成，通过调用 setState() 来更新 UI，这会触发 widget 子树的重建，并更新相关数据。

下面的例子展示了异步加载数据，并用 ListView 展示出来： */
class ThreadAsyncPage extends StatefulWidget {
  ThreadAsyncPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<ThreadAsyncPage> {
  List widgets = [];

  @override
  void initState() {
    super.initState();

    loadData();
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
            }));
  }

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
