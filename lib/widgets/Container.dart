import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Container(  
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            height: 100.0,
            width: 100.0,
            color: Colors.green,
          ),
          SizedBox(height: 20.0,),
          Container(
            padding: new EdgeInsets.all(10.0),
            margin: const EdgeInsets.symmetric(horizontal: 15.0),
            constraints: BoxConstraints.expand(
                height: Theme.of(context).textTheme.display1.fontSize * 1.1 +
                    100.0),
            color: Colors.transparent,
            alignment: Alignment.center,
            child: Text(
              'hello world',
              style: Theme.of(context)
                  .textTheme
                  .display1
                  .copyWith(color: Colors.black),
            ),
            foregroundDecoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://p0.ssl.qhimg.com/t016d14b6ef8371a68a.png"),
                    centerSlice: Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0))),
//               transform: Matrix4.zero()
          ),
          SizedBox(height: 20.0,),
          new Container(
            //宽度
            width: MediaQuery.of(context).size.width,
            //高度
            height: 200.0,
            // 盒子样式
            decoration: new BoxDecoration(
              color: Colors.blueGrey,
              //设置Border属性给容器添加边框
              border: new Border.all(
                //为边框添加颜色
                color: Colors.blue,
                width: 2.0, //边框宽度
                style: BorderStyle.solid
              ),
            ),
            child: new ListView(
                children: widgets
              ,),
          ),
          SizedBox(height: 10.0,),
          new Container(
            //宽度
            width: MediaQuery.of(context).size.width,
            //高度
            height: 150.0,
            // 盒子样式
            child: new CustomScrollView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                slivers: <Widget>[
                  new SliverGrid(
                    // 设置grid的宽高、间距属性
                    gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
                      // 可以理解为：每一个item的宽（或高）的最大值
                      maxCrossAxisExtent: 150.0,
                      // 行之间的间距
                      mainAxisSpacing: 10.0,
                      // 列之间的间距
                      crossAxisSpacing: 10.0,
                      // 子孩子的宽高比例，即：宽度/高度的值
                      childAspectRatio: 1.0,
                    ),
                    // 设置每一个item的布局
                    delegate: new SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return GestureDetector(
                          child: Center(child:Ink(
                            height: 150.0,
                            width: 150.0,
                            color: Colors.grey,
                            child: Text('This is $index'),
                          ),),
                          onTap: (){
                            Fluttertoast.showToast(msg: index.toString());
                          },
                        );
                      },
                      childCount: 10,
                    ),
                  )
                ],
              ),
          ),
        ],
      )),
    );
  }
    
  
  final widgets = List<Widget>.generate(10, 
    (index)=> Center(
        child: ListTile(
          title: Text('title $index',style: TextStyle(color: Colors.white,fontSize: 18.0),),
          subtitle: Text("subtitle $index",style: TextStyle(color: Colors.black45),),
          leading: Icon(Icons.report,color: Colors.white,),
          onTap: (){
            Fluttertoast.showToast(msg: index.toString());
          },
          trailing: Text(index.toString()),
        )
  ));
}


class MyRow extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
//    return new Row(
//      verticalDirection: VerticalDirection.down,
//      children: <Widget>[
//        FlutterLogo(),
//        Expanded(  //为了防止一行放不下，用expanded包起来显示
//          child:Text('qwertretrtyuyioadfasgjghjkhzxcvxzcvnbmbnm'),
//          flex: 1,
//        ),
//        Icon(Icons.favorite,color: Colors.red,)
//      ],
//    );
  
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: (){
          print('dian ji le ');
        },
        child: Image(image: NetworkImage("https://p0.ssl.qhimg.com/t016d14b6ef8371a68a.png")),
        
      )
    );
  }
  
}
