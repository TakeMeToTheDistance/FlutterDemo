import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_demo/router.dart';

void main() {
  runApp(MyApp());
}

// void main() {
//   // Center继承自Align，只不过是将alignment设置为Alignment.center
//   runApp(new Center(
//     child: new Text(
//       'Helloword',
//       textDirection: TextDirection.ltr,
//     ),
//   ));
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      theme: new ThemeData(
        primaryColor: Colors.red,
      ),
      home: new RandomWords(),
    );
  }
}

// 一个有状态的部件(StatefulWidget)的Widget必须实现 createState()方法,并且有一个State的子类
class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = new Set<WordPair>();

  final _biggerFont = const TextStyle(
      fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black);
  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
        // 在偶数行，该函数会为单词对添加一个ListTile row.
        // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
        // 注意，在小屏幕上，分割线看起来可能比较吃力。
        itemBuilder: (context, i) {
          // 在每一列之前，添加一个1像素高的分隔线widget
          if (i.isOdd) return new Divider();

          // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
          // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
          final index = i ~/ 2;
          // 如果是建议列表中最后一个单词对
          if (index >= _suggestions.length) {
            // ...接着再生成10个单词对，然后添加到建议列表
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);

    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  //这里才是真正返回state组件的地方,有override;上面的都是定义的一些自定义组件
  @override
  Widget build(BuildContext context) {
    // final wordPair = new WordPair.random(); // 删除这两行
    // return new Text(wordPair.asPascalCase);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushLayout),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }

  void _pushLayout() {
    // 布局教程
    // Router.push(context, Router.detailPage, {});
    // Router.push(context, Router.basicWidget, {});
    // Router.push(context, Router.viewApp, {});
    // Router.push(context, Router.layoutApp, {});
    // Router.push(context, Router.showHideApp, {});
    // Router.push(context, Router.myFadeTest, {});
    // Router.push(context, Router.painter, {});
    // Router.push(context, Router.custom, {});
    // Router.push(context, Router.threadAsync, {});
    // Router.push(context, Router.isolate, {});
    // Router.push(context, Router.taskProgress, {});
    // Router.push(context, Router.listView, {});
    Router.push(context, Router.builderList, {});
  }
}

/*
1. MyApp继承了StatelessWidget，这将会使应用本身也成为一个widget。 在Flutter中，大多数东西都是widget，包括对齐(alignment)、填充(padding)和布局(layout)
2.Scaffold 是 Material library 中提供的一个widget, 它提供了默认的导航栏、标题和包含主屏幕widget树的body属性。widget树可以很复杂。
3.widget的主要工作是提供一个build()方法来描述如何根据其他较低级别的widget来显示自己。
4.本示例中的body的widget树中包含了一个Center widget, Center widget又包含一个 Text 子widget。 Center widget可以将其子widget树对其到屏幕中心。
5.english_words的开源软件包 ，其中包含数千个最常用的英文单词以及一些实用功能.
6.pubspec文件管理Flutter应用程序的assets(资源，如图片、package等)。 在pubspec.yaml中，将english_words（3.1.0或更高版本）添加到依赖项列表
7.Stateless widgets 是不可变的, 这意味着它们的属性不能改变 - 所有的值都是最终的.
8.Stateful widgets 持有的状态可能在widget生命周期中发生变化. 实现一个 stateful widget 至少需要两个类:
一个 StatefulWidget类。
一个 State类。 StatefulWidget类本身是不变的，但是 State类在widget生命周期中始终存在.
9._saved Set(集合) 到RandomWordsState。这个集合存储用户喜欢（收藏）的单词对。 在这里，Set比List更合适，因为Set中不允许重复的值。
10.final属于单赋值，使用final修饰的变量必须进行初始化，一旦被赋值以后，不能被再次赋值。
11.MaterialPageRoute继承自PageRoute类，PageRoute类是一个抽象类，表示占有整个屏幕空间的一个模态路由页面，它还定义了路由构建及切换时过渡动画的相关接口及属性。MaterialPageRoute 是Material组件库提供的组件，它可以针对不同平台，实现与平台页面切换动画风格一致的路由切换动画：
下面我们介绍一下MaterialPageRoute 构造函数的各个参数的意义：

  MaterialPageRoute({
    WidgetBuilder builder,
    RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  })
builder 是一个WidgetBuilder类型的回调函数，它的作用是构建路由页面的具体内容，返回值是一个widget。我们通常要实现此回调，返回新路由的实例。
settings 包含路由的配置信息，如路由名称、是否初始路由（首页）。
maintainState：默认情况下，当入栈一个新路由时，原来的路由仍然会被保存在内存中，如果想在路由没用的时候释放其所占用的所有资源，可以设置maintainState为false。
fullscreenDialog表示新的路由页面是否是一个全屏的模态对话框，在iOS中，如果fullscreenDialog为true，新页面将会从屏幕底部滑入（而不是水平方向）。
Navigator
Navigator是一个路由管理的组件，它提供了打开和退出路由页方法。Navigator通过一个栈来管理活动路由集合。通常当前屏幕显示的页面就是栈顶的路由。Navigator提供了一系列方法来管理路由栈，在此我们只介绍其最常用的两个方法：

Future push(BuildContext context, Route route)
将给定的路由入栈（即打开新的页面），返回值是一个Future对象，用以接收新路由出栈（即关闭）时的返回数据。

bool pop(BuildContext context, [ result ])
将栈顶路由出栈，result为页面关闭时返回给上一个页面的数据。

Navigator 还有很多其它方法，如Navigator.replace、Navigator.popUntil等，详情请参考API文档或SDK源码注释，在此不再赘述。下面我们还需要介绍一下路由相关的另一个概念“命名路由”。


flutter常用命令
1.获取依赖包:flutter packages get
*/
