import 'package:flutter/material.dart';
import 'widgets/Snackbar.dart';
import 'package:flutter_learn_app/Constant.dart';
import 'widgets/HomePage.dart';
import 'utils/Utils.dart';
import 'widgets/Container.dart';
import 'widgets/Animation.dart';
import 'widgets/Download.dart';
import 'widgets/Count.dart';
import 'widgets/Image.dart';
import 'widgets/Input.dart';
import 'widgets/Shop.dart';
import 'widgets/Text.dart';
import 'widgets/Listview.dart';
import 'widgets/GridView.dart';


void main() {
  runApp(MaterialApp(
  title: 'Flutter',
  theme: ThemeData(
    primarySwatch: Colors.deepOrange,
    primaryColor: Colors.deepOrange,
    primaryColorDark: Colors.orange,
  ),
  routes: <String,WidgetBuilder>{
      Constant.HOME       : (BuildContext context) => new HomePage(),
      Constant.SNACKBAR   : (BuildContext context) => new MySnackBar(),
      Constant.CONTAINER  : (BuildContext context) => new MyContainer(),
      Constant.ANIMATION  : (BuildContext context) => new MyAnimation(),
      Constant.DOWNLOAD   : (BuildContext context) => new DownloadPage(),
      Constant.COUNT      : (BuildContext context) => new MyCounter(),
      Constant.IMAGE      : (BuildContext context) => new MyImage(),
      Constant.INPUT      : (BuildContext context) => new MyInput(),
      Constant.SHOP       : (BuildContext context) => new MyShop(),
      Constant.TEXT       : (BuildContext context) => new MyText(name: 'yf_ma',),
      Constant.LISTVIEW   : (BuildContext context) => new MyListView(),
      Constant.GRIDVIEW   : (BuildContext context) => new MyGridView(),
    },
    home: _MyScaffold(),
  ));
}


class _MyScaffold extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          CustomAppBar(
            title: Text(
                'Flutter',
                textAlign: TextAlign.center,),
          ),
          Expanded(
            child: Center(
              child:Column(
                children: <Widget>[
                  new FlatButton(
                      onPressed: (){Navigator.of(context).pushNamed(Constant.HOME);},
                      child: Text('点击进入主页')),
                  new FlatButton(
                      onPressed: (){Navigator.of(context).pushNamed(Constant.SNACKBAR);},
                      child: Text('Snackbar')),
                  new FlatButton(
                      onPressed: (){Navigator.of(context).pushNamed(Constant.CONTAINER);},
                      child: Text('container')),
                  new FlatButton(
                      onPressed: (){Navigator.of(context).pushNamed(Constant.ANIMATION);},
                      child: Text('animation')),
                  new FlatButton(
                      onPressed: (){Navigator.of(context).pushNamed(Constant.DOWNLOAD);},
                      child: Text('download')),
                  new FlatButton(
                      onPressed: (){Navigator.of(context).pushNamed(Constant.COUNT);},
                      child: Text('count')),
                  new FlatButton(
                      onPressed: (){Navigator.of(context).pushNamed(Constant.IMAGE);},
                      child: Text('image')),
                  new FlatButton(
                      onPressed: (){Navigator.of(context).pushNamed(Constant.INPUT);},
                      child: Text('input')),
                  new FlatButton(
                      onPressed: (){Navigator.of(context).pushNamed(Constant.SHOP);},
                      child: Text('test shop')),
                  new FlatButton(
                      onPressed: (){Navigator.of(context).pushNamed(Constant.TEXT);},
                      child: Text('text')),
                  new FlatButton(
                      onPressed: (){Navigator.of(context).pushNamed(Constant.LISTVIEW);},
                      child: Text('ListView')),
                  new FlatButton(
                      onPressed: (){Navigator.of(context).pushNamed(Constant.GRIDVIEW);},
                      child: Text('GridView')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/***** 自定义完成了标题栏 ****/
class CustomAppBar extends StatelessWidget{
  CustomAppBar({this.title});
  
  //Widget子类中的字段都会定义为final
  final Widget title;
  
  @override
  Widget build(BuildContext context) {
     return Container(
       height: 45.0, //单位是逻辑上的像素
       padding: EdgeInsets.symmetric(horizontal: 8.0),
       margin: EdgeInsets.only(top: 24.0),
       decoration: BoxDecoration(color: Colors.blue[500]),
       child: Row(
         children: <Widget>[
           IconButton(
               icon: Icon(Icons.menu),
               tooltip: 'Navigations menu',
               onPressed: (){
                  Utils.dialogTip(context, "this is a menu!");
               }
           ),
           Expanded(child: title),
           IconButton(
               icon: Icon(Icons.search),
               tooltip: 'Navigation search',
               onPressed: (){
                 Utils.dialogTip(context, "this is a search!");
               })
         ],
       ),
     );
  }
}




/**** 使用Scaffold来实现标题栏和页面 ***/
class MyHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu), tooltip:'Navigations meun',onPressed: null),
        title: Text('Test MyHome'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),tooltip: 'search', onPressed: null)
        ],
      ),
      body: Center(
        child: Text("Hello MyHome!"),
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: "Add",
          child: Icon(Icons.add),
          onPressed: (){
            print('click add');
          }
      ),
    );
  }
  
  void _toast(){
    SnackBar(content: Text('aaaaa'));
  }
}

/***  检测手势 ***/
class MyButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print('MyButton was taped');
      },
      child: Container(
        height: 36.0,
        width: 40.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius:  BorderRadius.circular(5.0),
          color: Colors.lightGreen[500]
        ),
        child: Center(
          child: Text('Engage'),
        ),
      ),
    );
  }
}


/***********根据用户输入来改变widget**********/
class Counter extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _CounterState();
}

class _CounterState extends State<Counter>{
  int _counter = 0;
  
  void _increment(){
    setState(() {
      _counter++;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RaisedButton(
            onPressed: _increment,
            child: Text('Increment'),
        ),
        Text('Count:$_counter')
      ],
    );
  }
}

/***************************初始工具自动生成的代码*********************************/
//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        // This is the theme of your application.
//        //
//        // Try running your application with "flutter run". You'll see the
//        // application has a blue toolbar. Then, without quitting the app, try
//        // changing the primarySwatch below to Colors.green and then invoke
//        // "hot reload" (press "r" in the console where you ran "flutter run",
//        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
//        // counter didn't reset back to zero; the application is not restarted.
//        primarySwatch: Colors.blue,
//      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  // This widget is the home page of your application. It is stateful, meaning
//  // that it has a State object (defined below) that contains fields that affect
//  // how it looks.
//
//  // This class is the configuration for the state. It holds the values (in this
//  // case the title) provided by the parent (in this case the App widget) and
//  // used by the build method of the State. Fields in a Widget subclass are
//  // always marked "final".
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;
//
//  void _incrementCounter() {
//    setState(() {
//      // This call to setState tells the Flutter framework that something has
//      // changed in this State, which causes it to rerun the build method below
//      // so that the display can reflect the updated values. If we changed
//      // _counter without calling setState(), then the build method would not be
//      // called again, and so nothing would appear to happen.
//      _counter++;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // This method is rerun every time setState is called, for instance as done
//    // by the _incrementCounter method above.
//    //
//    // The Flutter framework has been optimized to make rerunning build methods
//    // fast, so that you can just rebuild anything that needs updating rather
//    // than having to individually change instances of widgets.
//    return Scaffold(
//      appBar: AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: Text(widget.title),
//      ),
//      body: Center(
//        // Center is a layout widget. It takes a single child and positions it
//        // in the middle of the parent.
//        child: Column(
//          // Column is also layout widget. It takes a list of children and
//          // arranges them vertically. By default, it sizes itself to fit its
//          // children horizontally, and tries to be as tall as its parent.
//          //
//          // Invoke "debug paint" (press "p" in the console where you ran
//          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
//          // window in IntelliJ) to see the wireframe for each widget.
//          //
//          // Column has various properties to control how it sizes itself and
//          // how it positions its children. Here we use mainAxisAlignment to
//          // center the children vertically; the main axis here is the vertical
//          // axis because Columns are vertical (the cross axis would be
//          // horizontal).
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(
//              'You have pushed the button this many times:',
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.display1,
//            ),
//          ],
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
//    );
//  }
//}
