import 'package:flutter/material.dart';

class Utils {
  
  static void customDialog(BuildContext context, String title, String messge, List<Widget> actions) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(messge),
            actions: actions,
          );
        });
  }
  
  static void dialogTip(BuildContext context,String message){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Tips'),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
