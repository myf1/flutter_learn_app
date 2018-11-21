import 'package:flutter/material.dart';
import 'package:flutter_learn_app/utils/Utils.dart';
import 'package:flutter_learn_app/Constant.dart';

class CustomTab {
  CustomTab({this.name, this.icon});
  final String name;
  final IconData icon;
}

class FirstPage extends StatefulWidget {
  const FirstPage({Key key}) : super(key: key);

  @override
  _MyTabbed createState() => _MyTabbed();
}

class _MyTabbed extends State<FirstPage> with SingleTickerProviderStateMixin {
  List<CustomTab> _tabList;
  TabController _tabController;
  
  @override
  void initState() {
    super.initState();
    _tabList = new List<CustomTab>();
    _tabList.add(CustomTab(name: '首页', icon: Icons.account_balance));
    _tabList.add(CustomTab(name: '商品展示', icon: Icons.shop));
    _tabList.add(CustomTab(name: '购物车', icon: Icons.shopping_cart));
    _tabList.add(CustomTab(name: '我的', icon: Icons.people));
    _tabList.add(CustomTab(name: '车', icon: Icons.directions_car));
    _tabList.add(CustomTab(name: '自行车', icon: Icons.directions_bike));
    _tabList.add(CustomTab(name: '船', icon: Icons.directions_boat));
    _tabList.add(CustomTab(name: '公交', icon: Icons.directions_bus));
    _tabList.add(CustomTab(name: '地铁', icon: Icons.directions_railway));
    _tabList.add(CustomTab(name: '步行', icon: Icons.directions_walk));
    _tabList.add(CustomTab(name: '地图', icon: Icons.map));
    _tabList.add(CustomTab(name: '打印', icon: Icons.print));

    _tabController = TabController(length: _tabList.length, vsync: this);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constant.home),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite, color: Colors.red, size: 20.0,
            ),
            tooltip: 'icon favorite',
            onPressed: (){
              Utils.dialogTip(context, 'favorite');
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.red, size: 20.0,
            ),
            tooltip: 'icon favorite_border',
            onPressed: (){ Utils.dialogTip(context, 'favorite_border');},
          ),
          IconButton(
            icon: Icon(Icons.toys, color: Colors.red, size: 20.0,),
            tooltip: 'icon toys',
            onPressed: (){
              Utils.dialogTip(context, 'toys');
            },
          )
        ],
        centerTitle: true,
        flexibleSpace: Align(child: Text('this is a flexibleSpace',style: TextStyle(color: Colors.cyanAccent),), heightFactor: 300.0,),
        bottom: TabBar(
          tabs: _tabList.map((CustomTab customtab) {
            return Tab(
              icon: Icon(customtab.icon, size: 15.0,),
              text: customtab.name,
            );
          }).toList(),
          isScrollable: true, //是否滚动
          labelColor: Colors.amberAccent, //点击边的颜色
          indicatorWeight: 2.0, //指示的厚度
          unselectedLabelColor: Colors.white, //原颜色
          unselectedLabelStyle: TextStyle(color: Colors.yellow),
          indicatorColor: Colors.amberAccent,
          indicatorSize: TabBarIndicatorSize.tab, //指示器样式
          controller: _tabController, //
          labelStyle: TextStyle(fontSize: 13.0, color: Colors.white),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabList.map((CustomTab tab) {
          return Center(
              child: Column(
                children: <Widget>[
                  Expanded(child: Icon(tab.icon,size: 250.0,)),
                  Expanded(child: Text(tab.name,style: TextStyle(fontSize: 50.0),)),
                ],
              ),
          );
        }).toList(),
      ),
    );
  }
  
  @override
  void dispose() {
    if(_tabController!=null){
      _tabController.dispose();
    }
    super.dispose();
  }
}