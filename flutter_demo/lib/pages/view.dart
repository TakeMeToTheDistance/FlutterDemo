import 'package:flutter/material.dart';

/*
在 iOS 上更新 views，只需要直接改变它们就可以了。在 Flutter 中，widgets 是不可变的，而且不能被直接更新。你需要去操纵 widget 的 state。

这也正是有状态的和无状态的 widget 这一概念的来源。一个 StatelessWidget 正如它听起来一样，是一个没有附加状态的 widget。

StatelessWidget 在你构建初始化后不再进行改变的界面时非常有用。

举个例子，你可能会用一个 UIImageView 来展示你的 logo image 。如果这个 logo 在运行时不会改变，那么你就可以在 Flutter 中使用 StatelessWidget 。

如果你希望在发起 HTTP 请求时，依托接收到的数据动态的改变 UI，请使用 StatefulWidget。当 HTTP 请求结束后，通知 Flutter 框架 widget 的 State 更新了，好让系统来更新 UI。

有状态和无状态的 widget 之间一个非常重要的区别是，StatefulWidget 拥有一个 State 对象来存储它的状态数据，并在 widget 树重建时携带着它，因此状态不会丢失。

如果你有疑惑，请记住以下规则：如果一个 widget 在它的 build 方法之外改变（例如，在运行时由于用户的操作而改变），它就是有状态的。如果一个 widget 在一次 build 之后永远不变，那它就是无状态的。但是，即便一个 widget 是有状态的，包含它的父亲 widget 也可以是无状态的，只要父 widget 本身不响应这些变化。

下面的例子展示了如何使用一个 StatelessWidget 。一个常见的 StatelessWidget 是 Text widget。如果你查看 Text 的实现，你会发现它是 StatelessWidget 的子类。
*/
class ViewAppPage extends StatefulWidget {
  ViewAppPage({Key key}) : super(key: key);

  @override
  createState() => new _ViewAppPageState();
}

/*
   Text widget 并不显示地携带任何状态。它通过传入给它的构造器的数据来渲染，除此之外再无其他。

但是，如果你希望 I like Flutter 在点击 FloatingActionButton 时动态的改变呢？

为了实现这个，用 StatefulWidget 包裹 Text widget，并在用户点击按钮时更新它。 
 */
class _ViewAppPageState extends State<ViewAppPage> {
  // Default placeholder text
  String textToShow = "I Like Flutter";
  void _updateText() {
    setState(() {
      // update the text
      textToShow = "Flutter is Awesome!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample App"),
      ),
      body: Center(child: Text(textToShow)),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateText,
        tooltip: 'Update Text',
        child: Icon(Icons.update),
      ),
    );
  }
}
