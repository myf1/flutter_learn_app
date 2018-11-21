import 'package:flutter/material.dart';
import 'package:flutter_learn_app/Constant.dart';
import 'package:flutter_learn_app/utils/Utils.dart';

class FourthPage extends StatefulWidget {
  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  final _items = <_Items>[
    _Items('toys', Icons.toys),
    _Items('messge', Icons.message),
    _Items('audiotrack', Icons.audiotrack),
    _Items('ac_unit', Icons.ac_unit),
    _Items('people', Icons.people),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(Constant.me),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.mail), onPressed: (){
          Utils.dialogTip(context, 'mail');
        },tooltip: 'mail',),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.build), onPressed: (){
            Utils.dialogTip(context, 'tools');
          },tooltip: 'tools',)
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            _header(),
            Expanded(child:ListView(
              children: _items.map((item){
                return ListTile(
                  title: Text(item.title),
                  leading: Icon(item.icon),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: (){
                    Utils.dialogTip(context, item.title);
                  },
                );
              }).toList(),
            ) 
            ),
          ],
        ),
      )
    );
  }
  
  Widget _header(){
    return Container(
      color: Colors.deepOrange,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Center(
          child: Column(
            children: <Widget>[
              new ClipOval(
                child: Image(
                  image: AssetImage('images/head.jpg'),
                  width: 75.0,
                  height: 75.0,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(padding: const EdgeInsets.all(10.0)),
              GestureDetector(
                child: Text('编辑个人资料',style: TextStyle(fontSize: 13.0,color: Colors.white),),
                onTap: (){
                  Utils.dialogTip(context, "wait...");
                },
              ),
            ],
          ),
        ),
    );
  }
  
}

class _Items{
  final String title;
  final IconData icon;

  _Items(this.title, this.icon);
  
}