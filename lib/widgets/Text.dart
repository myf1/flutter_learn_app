import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(onPressed: (){
            Fluttertoast.showToast(
                msg: "toast",
                bgcolor: "#aabbee",
                gravity: ToastGravity.CENTER,
                textcolor: "#00000",
                toastLength: Toast.LENGTH_LONG);
          },child: Text('test toast'),),
          SizedBox(
            height: 10.0,
          ),
          new InkWell(
            child:Center(child:new Text('Test InkWell',
                    style: new TextStyle(
                      color: Colors.black45, 
                      fontWeight: FontWeight.bold, 
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                    textScaleFactor: 2.0,
                    overflow: TextOverflow.ellipsis,
                    locale: Localizations.localeOf(context),
                    maxLines: 1,
                  ),),
            onTap: (){
              Fluttertoast.showToast(msg: "InkWell onTap()");
            },
            onDoubleTap: (){
              Fluttertoast.showToast(msg: "InkWell onDoubleTap()");
            },
            onLongPress: (){
              Fluttertoast.showToast(msg: "InkWell onLongPress()");
            },
            highlightColor: Colors.amber,
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            customBorder: Border.all(color: Colors.red,width: 5.0,style: BorderStyle.solid),
            splashColor: Colors.blue,
          ),
          SizedBox(
            height: 10.0,
          ),
          new Ink(
            child: Center(child:Text('Test Ink',style: TextStyle(fontSize: 25.0,color: Colors.white),textAlign: TextAlign.center,),),
            width: MediaQuery.of(context).size.width,
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              gradient: LinearGradient(colors:colors)),
          ),
        ],
      )),
    );
  }


  var colors =<Color>[
    Colors.red,
    Colors.blue,
    Colors.yellow,
  ];
}
