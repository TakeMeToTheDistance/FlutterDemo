import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/*在 iOS 中，你在父 view 中调用 addSubview() 或在子 view 中调用 removeFromSuperview() 来动态地添加或移除子 views。在 Flutter 中，由于 widget 不可变，所以没有和 addSubview() 直接等价的东西。作为替代，你可以向 parent 传入一个返回 widget 的函数，并用一个布尔值来控制子 widget 的创建。

下面这个例子展示了在点击 FloatingActionButton 时如何动态地切换两个 widgets： */
class ShowHideAppPage extends StatefulWidget {
  ShowHideAppPage({Key key}) : super(key: key);

  @override
  _ShowHideAppPageAppPageState createState() => _ShowHideAppPageAppPageState();
}

class _ShowHideAppPageAppPageState extends State<ShowHideAppPage> {
  // Default value for toggle
  bool toggle = true;
  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  _getToggleChild() {
    if (toggle) {
      return Text('Toggle One');
    } else {
      return CupertinoButton(
        onPressed: () {},
        child: Text('Toggle Two'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample App"),
      ),
      body: Center(
        child: _getToggleChild(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggle,
        tooltip: 'Update Text',
        child: Icon(Icons.update),
      ),
    );
  }
}
