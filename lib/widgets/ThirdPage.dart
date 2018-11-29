import 'package:flutter/material.dart';
import 'package:flutter_learn_app/Constant.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_learn_app/bean/JokeBean.dart';
import 'dart:core';
import 'package:flutter_learn_app/utils/Utils.dart';

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage>
    with SingleTickerProviderStateMixin {
  String url_new = Constant.base_url +
      "&page=2&pagesize=20&sort=asc&time=" +
      DateTime(2018).millisecondsSinceEpoch.toString().substring(0, 10);

  String url_random = "http://v.juhe.cn/joke/content/text.php?key=" +
      Constant.joke_key +
      "&page=1&pagesize=20";
  TabController tabController;
  List<Text> _list;
  JokeBean _jokeBean;

  @override
  void initState() {
    super.initState();
    _list = new List<Text>();
    _list.add(Text('最新'));
    _list.add(Text('随机'));
    tabController = new TabController(length: _list.length, vsync: this);
    _loadData(url_new);
  }

  Widget showBody() {
    if (_jokeBean == null) {
      return new Center(child: new CircularProgressIndicator());
    } else {
      if (_jokeBean.error_code != 0) {
        return Center(
          child: Text(_jokeBean.reason + "\n" + _bodyText),
        );
      } else {
        return TabBarView(
          children: <Widget>[
            getListView(),
            getListView(),
          ],
          controller: tabController,
        );
      }
    }
  }

  Widget getListView() {
    return ListView.builder(
      itemBuilder: (context, index) {
        DataBean dataBean = _jokeBean.result.data.elementAt(index);
        return Card(
          elevation: 3.3,
          margin: const EdgeInsets.all(10.0),
          child: ListTile(
            title: Text(dataBean.updatetime),
            subtitle: Text(dataBean.content),
            onTap: () {
              Utils.dialogTip(context, dataBean.content);
            },
          ),
        );
      },
      itemCount: _jokeBean.result.data.length,
    );
  }

  _loadData(url) async {
    http.Response response = await http.get(url);
    setState(() {
      print("response===>" + response.body);
      _jokeBean = JokeBean(response.body);
    });
  }

  //首次运行中间文字显示点击效果
  String _bodyText = '点击效果';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(Constant.find),
            actions: <Widget>[
              FlatButton(onPressed: () {
                _loadData(url_random);
              }, child: Text("刷新")),
              new PopupMenuButton<String>(
                  //这是点击弹出菜单的操作，点击对应菜单后，改变屏幕中间文本状态，将点击的菜单值赋予屏幕中间文本
                  onSelected: (String value) {
                    setState(() {
                      _bodyText = value;
                    });
                  },
                  //这是弹出菜单的建立，包含了两个子项，分别是增加和删除以及他们对应的值
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                        PopupMenuItem(
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new Text('添加'),
                              new Icon(Icons.add_circle)
                            ],
                          ),
                          value: '添加',
                        ),
                        PopupMenuItem(
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new Text('删除'),
                              new Icon(Icons.remove_circle)
                            ],
                          ),
                          value: '删除',
                        )
                      ])
            ],
            centerTitle: true,
            elevation: 0.0,
            bottom: TabBar(
              tabs: _list,
              controller: tabController,
              isScrollable: true,
            )),
        body: showBody());
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
