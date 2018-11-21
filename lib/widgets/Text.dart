import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  MyText({this.name});
  
  final String name;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test Text")),
      body: Material(
          child: Column(
        children: <Widget>[
          Text(
            'hello $name:'
                '\n普通的text 普通的text 普通的text',
            textAlign: TextAlign.left,
            //对齐
            overflow: TextOverflow.ellipsis,
            //当显示不下时，显示的样式  ellipsis为...
            textDirection: TextDirection.ltr,
            //文字的方向 ltr:左到右
            maxLines: 2,
            //最大行数，
            softWrap: true,
            style: TextStyle(
              inherit: false,
              //继承
              letterSpacing: 8.0,
              //字间距
              fontWeight: FontWeight.bold,
              //字体粗细
              fontSize: 20.0,
              //字体大小
              color: Colors.red, //字体颜色
            ),
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 10.0),),
          Text(
            'hello richtext:',
            textAlign:TextAlign.left,
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 10.0),),
          const Text.rich(TextSpan(
            text: 'rich Text ',
            style: TextStyle(fontSize: 20.0),
            children: <TextSpan>[
              TextSpan(
                  text: ' first rich text ',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.italic)),
              TextSpan(
                  text: ' second rich text',
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.normal))
            ],
          )),
        ],
      )),
    );
  }
}
