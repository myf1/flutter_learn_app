import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DownloadPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _DownloadState();
}

class _DownloadState extends State<DownloadPage>{
  List list = [];
  
  Widget show(){
    if(list.length == 0){
      return new CircularProgressIndicator();
    }else{
      return  new ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int position)  {
        return new Padding(padding: new EdgeInsets.all(3.0), 
            child: new Text("Row ${list[position]["title"]}"));});
    }
  }
  
  @override
  void initState() {
    super.initState();
    _loadData();
  }
  
  _loadData() async{
    String url = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(url);
    setState(() {
      list = json.decode(response.body);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Download'),
      ),
      body: Center(child:show())
    );
  }
  
}