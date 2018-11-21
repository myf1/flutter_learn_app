import 'package:flutter/material.dart';

/**********显示文件中的图片***********/ //注意：需要在pubspec.yaml中声明
class MyImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image'),
      ),
      body: Material(
        child: Column(
          children: <Widget>[
            Text('image.asset===>fit=contain',
                style: TextStyle(fontSize: 18.0)),
            Image.asset(
              'images/a.jpg',
              width: 300.0,
              height: 100.0,
              fit: BoxFit.contain,
            ),
            Text(
              'image===>fit=cover',
              style: TextStyle(fontSize: 18.0),
            ),
            Image(
              image: AssetImage('images/a.jpg'),
              height: 100.0,
              width: 300.0,
              fit: BoxFit.cover,
            ),
            Text(
              'Image.network===>fit=fitWidth',
              style: TextStyle(fontSize: 18.0),
            ),
            Image.network(
              "https://www.baidu.com/img/bd_logo1.png?where=super",
              width: 300.0,
              height: 100.0,
              fit: BoxFit.fitWidth,
            ),
            Text(
              'Image.network===>fit=fitWidth',
              style: TextStyle(fontSize: 18.0),
            ),
//            Image.file(_file,height: 100.0,width: 300.0,)
            Icon(Icons.favorite_border),
            IconButton(
                icon: Icon(Icons.face),
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('alertdialog'),
                        content: Text('this is alertdialog'),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('cancel'),
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                          ),
                          FlatButton(
                            child: Text('ok'),
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );
                    },
                  );
                }),
            IconTheme(
                data: IconThemeData(color: Colors.red, size: 50.0),
                child: Text("icontheme"))
          ],
        ),
      ),
    );
  }
}
