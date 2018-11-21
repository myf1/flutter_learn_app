import 'package:flutter/material.dart';


class CounterDisplay extends StatelessWidget{
  CounterDisplay({this.count});
  
  final int count;

  @override
  Widget build(BuildContext context) {
    return Text(
      'count:$count',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 25.0,color: Colors.redAccent),);
  }
}


class CounterIncrement extends StatelessWidget{
  CounterIncrement({this.additionPress, this.subtractionPress}); 
  
  final VoidCallback additionPress,subtractionPress;
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
            RaisedButton(
                onPressed: additionPress,
                child: Text('点击增加'),
            ),
            new Padding(padding: EdgeInsets.symmetric(horizontal: 15.0)),
            RaisedButton(
              onPressed: subtractionPress,
              child: Text('点击减少'),
            ),
        ],
      ),
    );
  }
}

class MyCounter extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _CounterState();
}


class _CounterState extends State<MyCounter>{
  
  int count = 0;
  
  void _addition(){
    setState(() {
      count++;
    });
  }
  
  void _subtraction(){
    setState(() {
      count--;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body:  Container(
          height: 200.0,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          margin: const EdgeInsets.only(top: 20.0),
          decoration: BoxDecoration(color: Colors.white),
          child: Material(
              child: Column(
                children: <Widget>[
                  CounterIncrement(additionPress: _addition,subtractionPress: _subtraction,),
                  Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),
                  Expanded(child: CounterDisplay(count: count,))
                ],
              )
          )
      ),
    );
  }
}
