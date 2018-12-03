import 'package:flutter/material.dart';
import 'widgets/Snackbar.dart';
import 'package:flutter_learn_app/Constant.dart';
import 'widgets/HomePage.dart';
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
import 'widgets/StackTest.dart';

/// @auther:  yf_ma
/// @version:  1.0
/// @description: learn flutter demo

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.deepOrange,
      primaryColor: Colors.deepOrange,
      primaryColorDark: Colors.orange,
    ), 
    home: HomePage(),
    routes: <String,WidgetBuilder>{
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
        Constant.STACK      : (BuildContext context) => new MyStack(),
      },
  ));
}