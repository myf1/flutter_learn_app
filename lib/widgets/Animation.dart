import 'package:flutter/material.dart';

class MyAnimation extends StatefulWidget{
  
  @override
  State<StatefulWidget> createState() => _animationState();
}

class _animationState extends State<MyAnimation> with TickerProviderStateMixin{
  AnimationController animationController;
  CurvedAnimation curvedAnimation;
  
  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(duration:new Duration(milliseconds: 2000),vsync: this);
    curvedAnimation = new CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn);
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: Center(
        child: new FadeTransition(
            opacity: curvedAnimation,
            child: new FlutterLogo(size: 200.0,)
        ),
      ),
      floatingActionButton: new FloatingActionButton(
          tooltip: 'Fade',
          child: new Padding(padding: EdgeInsets.all(8.0),
              child: Text('click me') ,),
          onPressed: (){
            animationController.forward();
          },
      )
    );
  }
  
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

class MyPage1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('page1'),
        centerTitle: true,
        actions: <Widget>[
          Center(
            child:Text('right button',),
          ),
        
        ],
      ),
      body: new Center(
        child: Text('MyPayge1',
          style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w600),),
      ),
    );
  }
}

class MyPage2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('page2'),
        actions: <Widget>[
          Center(
            child:Text('right button',),
          ),
        ],
      ),
      body: new Center(
        child: Text('MyPayge2',
          style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w600),),
      ),
    );
  }
}

class MyPage3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('page3'),
        actions: <Widget>[
          Center(
            child:Text('right button',),
          ),
        ],
      ),
      body: new Center(
        child: Text('MyPayge3',
          style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w600),),
      ),
    );
  }
}