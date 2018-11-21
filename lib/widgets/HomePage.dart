import 'package:flutter/material.dart';
import 'package:flutter_learn_app/utils/Utils.dart';
import 'package:flutter_learn_app/Constant.dart';
import 'FirstPage.dart';
import 'SecondPage.dart';
import 'ThirdPage.dart';
import 'FourthPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController;
  var _index = 0;
  
  final _bottomList = <BottomNavigationBarItem>[
    new BottomNavigationBarItem(icon: Icon(Icons.home), title: Text(Constant.home)),
    new BottomNavigationBarItem(icon: Icon(Icons.slideshow), title: Text(Constant.show)),
    new BottomNavigationBarItem(icon: Icon(Icons.find_in_page), title: Text(Constant.find)),
    new BottomNavigationBarItem(icon: Icon(Icons.person), title: Text(Constant.me)),
  ];
  
  final _drawerData = <_DrawerItems>[
    _DrawerItems(Constant.add, Icons.add),
    _DrawerItems(Constant.problem, Icons.report_problem),
    _DrawerItems(Constant.build, Icons.build),
    _DrawerItems(Constant.report, Icons.report),
    _DrawerItems(Constant.aboutme,Icons.person),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = new PageController(initialPage: _index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          FirstPage(),
          SecondPage(),
          ThirdPage(),
          FourthPage(),
        ],
        onPageChanged: (index){
          setState(() {
            this._index = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomList,
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        onTap: (int currentIndex) {
          _pageController.animateToPage(currentIndex,
              duration: Duration(milliseconds: 100), curve: Curves.easeIn);
        },
      ),
      drawer: Drawer(
          elevation: 3.0,
          semanticLabel: 'drawer',
          child: ListView(
            children: _getItems(),
          )),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  
  List<Widget> _getItems(){
    List<Widget> items = List();
    
    items.add(Image(
        image: NetworkImage(Constant.drawer_header_image),
        height: 200.0,
        fit: BoxFit.cover,)
    );
    _drawerData.forEach((item){
      items.add(Divider(color: Colors.black45, height: 1.0, indent: 1.0,));
      items.add( ListTile(
          title: Text(item.title,style: TextStyle(color: Colors.black,fontSize: 18.0),),
          leading: Icon(item.icon,color: Colors.lightBlue,size: 20.0,),
          trailing: Icon(Icons.arrow_forward,size: 18.0,color: Colors.lightBlue,),
          onTap: (){
            Utils.dialogTip(context, item.title);
          },
        ),
      );
    });
    items.add(Divider(color: Colors.black45, height: 2.0,));
    return items;
  }
}

class _DrawerItems{
  final String title;
  final IconData icon;

  _DrawerItems(this.title, this.icon);
}

