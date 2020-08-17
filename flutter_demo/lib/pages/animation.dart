import 'package:flutter/material.dart';

class MyFadeTest extends StatefulWidget {
  MyFadeTest({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyFadeTest createState() => _MyFadeTest();
}

/*在 iOS 中，你通过调用 animate(withDuration:animations:) 方法来给一个 view 创建动画。在 Flutter 中，使用动画库来包裹 widgets，而不是创建一个动画 widget。

在 Flutter 中，使用 AnimationController 。这是一个可以暂停、寻找、停止、反转动画的 Animation<double> 类型。它需要一个 Ticker 当 vsync 发生时来发送信号，并且在每帧运行时创建一个介于 0 和 1 之间的线性插值（interpolation）。你可以创建一个或多个的 Animation 并附加给一个 controller。

例如，你可能会用 CurvedAnimation 来实现一个 interpolated 曲线。在这个场景中，controller 是动画过程的“主人”，而 CurvedAnimation 计算曲线，并替代 controller 默认的线性模式。

当构建 widget 树时，你会把 Animation 指定给一个 widget 的动画属性，比如 FadeTransition 的 opacity，并告诉控制器开始动画。

下面这个例子展示了在点击 FloatingActionButton 之后，如何使用 FadeTransition 来让 widget 淡出到 logo 图标：

class SampleApp extends S */
class _MyFadeTest extends State<MyFadeTest> with TickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation curve;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Fade'),
      ),
      body: Center(
          child: Container(
              child: FadeTransition(
                  opacity: curve,
                  child: FlutterLogo(
                    size: 100.0,
                  )))),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Fade',
        child: Icon(Icons.brush),
        onPressed: () {
          controller.forward();
        },
      ),
    );
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }
}
