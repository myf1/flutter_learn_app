import 'package:flutter/material.dart';
import 'package:flutter_learn_app/utils/Utils.dart';

enum RadioSex { man, women,other }

class MyInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  bool likeA = false;
  bool likeB = false;
  bool likeC = false;
  bool isOn = false;
  double timeDilation = 0.0;
  
  TextEditingController _textEditingController;

  RadioSex _sex = RadioSex.man;
  
  @override
  void initState() {
    super.initState();
    _textEditingController = new TextEditingController();
  }


  @override
  void dispose() {
    if(_textEditingController!=null){
      _textEditingController.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Input'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            tooltip: 'menu',
            onPressed: (){
              Utils.dialogTip(context, 'menu');
            },
          )
        ],
      ),
      body: new Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: <Widget>[
            TextField(
              cursorWidth: 0.5,
              controller: _textEditingController,
              decoration: InputDecoration(
                helperText: '注意用户名输入规则不能带有特殊符号！',
                helperStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 8.0,
                    fontWeight: FontWeight.w600),
                icon: Icon(
                  Icons.person,
                  color: Colors.black38,
                  size: 25.0,
                ),
                hintText: '请输入用户名！',
                hintStyle: TextStyle(fontSize: 15.0),
              ),
              textAlign: TextAlign.left,
              cursorColor: Colors.redAccent,
              autofocus: true,
              style: TextStyle(fontSize: 18.0, color: Colors.black),
              autocorrect: true,
            ),
            Text(
              '1. 请选择你喜欢吃的水果？',
              textAlign: TextAlign.left,
            ),
            Card(
              margin: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  CheckboxListTile(
                    value: likeA,
                    onChanged: (bool isLike) {
                      setState(() {
                        likeA = isLike ? true : false;
                      });
                    },
                    title: Text('苹果'),
                  ),
                  CheckboxListTile(
                    title: const Text('梨'),
                    value: likeB,
                    onChanged: (bool value) {
                      setState(() {
                        likeB = value ? true : false;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('香蕉'),
                    value: likeC,
                    onChanged: (bool value) {
                      setState(() {
                        likeC = value ? true : false;
                      });
                    },
                  ),
                ],
              ),
            ),
            Text('2. 您的性别？'),
            Material(
              child: Card(
                child: Column(
                  children: <Widget>[
                    RadioListTile<RadioSex>(
                      title: const Text('man'),
                      value: RadioSex.man,
                      groupValue: _sex,
                      onChanged: (RadioSex value) {
                        setState(() {
                          _sex = value;
                        });
                      },
                    ),
                    RadioListTile<RadioSex>(
                      title: const Text('women'),
                      value: RadioSex.women,
                      groupValue: _sex,
                      onChanged: (RadioSex value) {
                        setState(() {
                          _sex = value;
                        });
                      },
                    ),
                    RadioListTile<RadioSex>(
                      title: const Text('other'),
                      value: RadioSex.other,
                      groupValue: _sex,
                      onChanged: (RadioSex value) {
                        setState(() {
                          _sex = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            SwitchListTile(
              value: isOn, 
              title: Text('3. 开关是否打开？'),
              onChanged: (bool isOn1){
              setState(() {
                isOn = isOn1 ? true : false;
              });
            }),
            Expanded(
                child: Column(
                  children: <Widget>[
                    Text("是否打开：" + isOn.toString() + "    喜欢吃苹果" + likeA.toString() ),
                    Text("喜欢吃梨" + likeB.toString() + "     喜欢吃香蕉" + likeC.toString() ),
                    Text(" 性别" + _sex.toString() + "  值：" + _textEditingController.text),
                  ],
                )
            )
          ],
        ),
        constraints: BoxConstraints.expand(width: 500.0, height: 1000.0),
      ),
    );
  }
}
