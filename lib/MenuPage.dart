import 'dart:io';

import 'package:flutter/material.dart' hide TabBarView;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simpleflutter/bean/contact_bean_entity.dart';
import 'package:simpleflutter/bean/group_bean_entity.dart';
import 'package:simpleflutter/db/ContactBeanManager.dart';
import 'package:simpleflutter/db/GroupBeanManager.dart';
import 'package:simpleflutter/view/FirstPage.dart';
import 'package:simpleflutter/view/FivethPage.dart';
import 'package:simpleflutter/view/FourthPage.dart';
import 'package:simpleflutter/view/SecondPage.dart';
import 'package:simpleflutter/view/ThirdPage.dart';
import 'package:simpleflutter/view/http/Api.dart';
import 'package:simpleflutter/view/http/HttpUtils.dart';
import 'package:simpleflutter/view/resources/mColors.dart';
import 'package:simpleflutter/widget/my_tabbar_view.dart';

class MenuPage extends StatefulWidget {
  MenuState createState() => MenuState();
}

class MenuState extends State<MenuPage> with SingleTickerProviderStateMixin {
  TabController tabController;
  ContactBeanManager contactBeanManager = ContactBeanManager();
  GroupBeanManager groupBeanManager =  GroupBeanManager();

  @override
  void initState() {
    super.initState();
    // pageController = new PageController(initialPage: this.page);
    tabController = new TabController(length: 5, vsync: this);
    getContract();
    getGroup();
  }

  getContract() async {
    ContactBeanEntityList cardbeanList;
    await HttpUtil().get(Api.getContacts, (data) {
      cardbeanList = new ContactBeanEntityList.fromJson(data);
    });
    if (cardbeanList != null) {
      await contactBeanManager.insertAll(cardbeanList.ContactBeanEntitylist);
    }
  }
  getGroup() async{
    GroupBeanEntityList groupBeanEntityList;
    await HttpUtil().get(Api.getGroupList, (data) {
      groupBeanEntityList=new GroupBeanEntityList.fromJson(data);

    });
    if(groupBeanEntityList!=null){
      await groupBeanManager.insertAll(groupBeanEntityList.GroupBeanEntitylist);
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 1920)..init(context);
    // TODO: implement build
    return Scaffold(
      body: new Hero(
        tag: "tag",
        child: new TabBarView(controller: tabController, children: <Widget>[
          new FirstPage(),
          new SecondPage(),
          new ThirdPage(),
          new FourthPage(),
          new FivethPage(),
        ]),
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
              new Tab(
                  text: "聊天",
                  icon: ImageIcon(AssetImage("images/img_chatlist1.png"))),
              new Tab(
                  text: "通讯录",
                  icon: ImageIcon(AssetImage("images/img_chatlist2.png"))),
              new Tab(
                  text: "应用",
                  icon: ImageIcon(AssetImage("images/img_chatlist3.png"))),
              new Tab(
                  text: "韩创圈",
                  icon: ImageIcon(AssetImage("images/img_chatlist4.png"))),
              new Tab(
                  text: "我的",
                  icon: ImageIcon(AssetImage("images/img_chatlist5.png"))),
            ]),
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
