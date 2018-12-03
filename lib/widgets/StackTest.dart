import 'package:flutter/material.dart';

class MyStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    var stack = new Stack(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage("https://p.ssl.qhimg.com/dmfd/400_300_/t012ee27388e40aae9d.jpg"),
          radius: 120,
        ),
        Positioned(child: Text("Left-Top"),left: 10.0,top: 10.0,),
        Positioned(child: Text("Right-Top"),right: 10.0,top: 10.0,),
        Positioned(child: Text("Left-Bottom"),left: 10.0,bottom: 10.0,),
        Positioned(child: Text("Right-Bottom"),right: 10.0,bottom: 10.0,),
      ],
    );
    
    return Scaffold(
      appBar: AppBar(title: Text('Stack Test'),),
      body: stack,
    );
  }
}
