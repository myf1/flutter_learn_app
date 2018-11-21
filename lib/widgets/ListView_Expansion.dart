import 'package:flutter/material.dart';
import 'SecondPage.dart';


class ExpansionListText extends StatelessWidget {

  ExpansionListText({Key key, this.customItem}) : super(key: key);
  
  final CustomItem customItem;
  
  List<Item> _data = List.generate(20,
        (i)=>Item("Title A " + i.toString(),
                  <Item>[
                    Item( "Title AA " + i.toString(),
                       <Item>[
                        Item("Title AAAa " + i.toString()),
                        Item("Title AAAb " + i.toString()),
                        Item("Title AAAc " + i.toString()),
                      ])
                  ])
  );


  
  
  
  Widget _buildTile(Item root){
    if(root.list.isEmpty)
      return new ListTile(title: Text(root.title),);
    return new ExpansionTile(
      title: Text(root.title),
      key: new PageStorageKey<Item>(root),
      children: root.list.map(_buildTile).toList(),);
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(customItem.title),
      ),
      body: ListView.builder(
        itemBuilder: (context,index)=> _buildTile(_data[index]),
        itemCount: _data.length,
      ),
    );
  }
}

class Item{
  Item(this.title,[this.list=const <Item>[]]);
  final String title;
  final List<Item> list;
}
