import 'package:flutter/material.dart';

class MySnackBar extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('test snackbar'),
        ),
        body: new Builder(builder: (BuildContext context){
          return Center(
            child: new GestureDetector(
              child: Text('show snackbar'),
              onTap: (){
                var snackbar = new SnackBar(content: Text("this is a snackbar"));
                Scaffold.of(context).showSnackBar(snackbar);
              }
            ),
          );
        }),
    );
  }
}
