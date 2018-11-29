import 'package:flutter/material.dart';
import 'package:flutter_learn_app/utils/Utils.dart';

class MyGridView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gridview'),
      ),
      body: GridView.builder(
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 15.0,
            childAspectRatio: 0.9,
            mainAxisSpacing: 15.0,
            ),
          itemBuilder: (context,i){
            return GestureDetector(
              child: new GridTile(
                child: Image.asset(
                  'images/a.jpg',
                ),
                header: Text('header '+i.toString()),
                footer: Text('footer '+i.toString()),
              ),
              onTap: (){
                Utils.dialogTip(context, i.toString());
              },
            );
          },itemCount: 30,
            padding: const EdgeInsets.all(10.0),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,),
    );
  }
}
