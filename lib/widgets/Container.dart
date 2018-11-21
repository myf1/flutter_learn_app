import 'package:flutter/material.dart';

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
                  .copyWith(color: Colors.yellow),
            ),
            foregroundDecoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://p0.ssl.qhimg.com/t016d14b6ef8371a68a.png"),
                    centerSlice: Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0))),
//               transform: Matrix4.zero()
          )
        ],
      )),
    );
  }
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
