import 'package:flutter/material.dart';
import 'ListView_Expansion.dart';
import 'package:flutter_learn_app/Constant.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<CustomItem> _data; 
  
  @override
  void initState() {
    super.initState();
    _data = List.generate(50, (i) =>
        CustomItem(
            'title ' + i.toString(),
            'this is which ->'+ i.toString(),
            Icons.star)
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constant.show),
        centerTitle: true,
        leading: Center(
          child: Text('left'),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Center(
              child: Text('right',),
          )),
        ],
      ),
      body: ListView.builder(itemBuilder: (context,index){
        CustomItem customItem = _data[index];
        return ListTile(
          title: Text(customItem.title,style: TextStyle(fontSize: 18.0,),),
          leading: Icon(customItem.icon,color: Colors.amber,),
          subtitle: Text(customItem.description,style: TextStyle(fontSize: 13.0),),
          trailing: Icon(Icons.arrow_forward,size: 15.0,),
          onTap: (){
            Navigator.push(context, new MaterialPageRoute(builder: (context)=> new ExpansionListText(customItem: customItem,)));
          }
        );
      },itemCount: _data.length,),
    );
  }
}

class CustomItem{

  final String title;
  final String description;
  final IconData icon;
  
  CustomItem(this.title, this.description, this.icon);
}

