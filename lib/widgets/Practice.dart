import 'package:flutter/material.dart';
import 'package:flutter_learn_app/Constant.dart';
import 'package:flutter_learn_app/utils/Utils.dart';


class Practice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _MyScaffold();
  }
}

class _MyScaffold extends StatelessWidget{

  final _list = [
    Constant.SNACKBAR,
    Constant.CONTAINER,
    Constant.ANIMATION,
    Constant.DOWNLOAD,
    Constant.COUNT,
    Constant.IMAGE,
    Constant.INPUT,
    Constant.SHOP,
    Constant.TEXT,
    Constant.LISTVIEW,
    Constant.GRIDVIEW,
    Constant.STACK,
    Constant.HTTP,
    Constant.VIDEO,
  ];


  Widget _gridView(){
    return GridView.builder(
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,childAspectRatio: 1),
      itemBuilder: (context,index){
        return FlatButton(
          onPressed: (){Navigator.of(context).pushNamed(_list[index]);},
          child: Text(_list[index].substring(1),style: TextStyle(fontSize: 15.0
          ),),);
      },itemCount: _list.length,);
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Prctice Flutter',
        style: TextStyle(color: Colors.white,fontSize: 20.0),),
        centerTitle: true,
      ), 
      body: Center(child: _gridView(),),
     
     /* Column(
        children: <Widget>[
          CustomAppBar(
            title: Text(
              'Prctice Flutter',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white,fontSize: 20.0),),
          ),
        ],
      ),*/
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
      height: 50.0, //单位是逻辑上的像素
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.deepOrange),
      child: Row(
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.menu,color: Colors.white,),
              tooltip: 'Navigations menu',
              onPressed: (){
                Utils.dialogTip(context, "this is a menu!");
              }
          ),
          Expanded(child: title),
          IconButton(
              icon: Icon(Icons.search,color: Colors.white,),
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