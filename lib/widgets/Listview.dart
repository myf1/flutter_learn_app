import 'package:flutter/material.dart';
import 'package:flutter_learn_app/utils/Utils.dart';

class MyListView extends StatelessWidget {

  final List<String> _list = <String>[
    "Q", "W", "E", "R","T","Y","U","I","P"
  ];
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text('ListView'),),
      body: ListView.builder(
          itemBuilder: (BuildContext context,int index){
            return ListTile(
              title: Text(_list[index]),
              onTap: (){
                Utils.dialogTip(context, _list[index]);
                print(_list[index]);
              },
            );
          },
          itemCount: _list.length,
          ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Utils.dialogTip(context, "list.length=" + _list.length.toString());
      },
      child: Text('length'),),
    
    );
  }
}
