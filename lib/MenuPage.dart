import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simpleflutter/view/FirstPage.dart';
import 'package:simpleflutter/view/FivethPage.dart';
import 'package:simpleflutter/view/FourthPage.dart';
import 'package:simpleflutter/view/SecondPage.dart';
import 'package:simpleflutter/view/ThirdPage.dart';
import 'package:simpleflutter/view/resources/mColors.dart';

class MenuPage extends StatefulWidget {
  MenuState createState() => MenuState();
}

class MenuState extends State<MenuPage> with SingleTickerProviderStateMixin {

  TabController tabController;

  @override
  void initState() {
    super.initState();
    // pageController = new PageController(initialPage: this.page);
    tabController = new TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 1920)
      ..init(context);
    // TODO: implement build
    return Scaffold(
      body: new Hero(
        tag: "tag",
        child: new TabBarView(
            controller: tabController,
            children: <Widget>[
              new FirstPage(),
              new SecondPage(),
              new ThirdPage(),
              new FourthPage(),
              new FivethPage(),
            ]
        ),
      ),

      bottomNavigationBar: new Container(
        color: Colors.white,
        padding: Platform.isIOS
            ? const EdgeInsets.only(bottom: 20)
            : const EdgeInsets.only(bottom: 0),
        child: new TabBar(
            controller: tabController,
            labelColor: Color(mColors.c_5676FC),
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.white,
            tabs: <Tab>[
              new Tab(text: "聊天",
                  icon: ImageIcon(AssetImage("images/img_chatlist1.png"))),
              new Tab(text: "通讯录",
                  icon: ImageIcon(AssetImage("images/img_chatlist2.png"))),
              new Tab(text: "应用",
                  icon: ImageIcon(AssetImage("images/img_chatlist3.png"))),
              new Tab(text: "韩创圈",
                  icon: ImageIcon(AssetImage("images/img_chatlist4.png"))),
              new Tab(text: "我的",
                  icon: ImageIcon(AssetImage("images/img_chatlist5.png"))),
            ]
        ),
      ),
    );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
  }

}