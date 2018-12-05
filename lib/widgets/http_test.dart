import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class MyHttp extends StatefulWidget {
  @override
  _MyHttpState createState() => _MyHttpState();
}

class _MyHttpState extends State<MyHttp> {
  
  var responseStr;
  
  void _getData() async{
    var url = "http://yule.360.cn/content/441401";
    var response = await http.get(url);
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');

      setState(() {
        responseStr = response.body;
    });
  }
  
  
  @override
  void initState() {
    super.initState();
    _getData();
    
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: responseStr == null ?
        CircularProgressIndicator():Text(responseStr),)
    );
  }
  
  
}
