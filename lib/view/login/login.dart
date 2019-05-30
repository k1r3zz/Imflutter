import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simpleflutter/MenuPage.dart';
import 'package:simpleflutter/bean/login_bean_entity.dart';
import 'package:simpleflutter/config/PrefsConfig.dart';
import 'package:simpleflutter/view/http/Api.dart';
import 'package:simpleflutter/view/http/HttpUtils.dart';
import 'package:simpleflutter/view/resources/mColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simpleflutter/widget/SPUntil.dart';
import 'package:simpleflutter/widget/ToastUntil.dart';

class loginView extends StatefulWidget {
  @override
  loginView_State createState() => new loginView_State();
}

class loginView_State extends State<loginView> {
  final usercontroller = TextEditingController();
  final psdcontroller = TextEditingController();

  void _login() {
    loadData();
  }

  loadData() async {
    FormData formData = new FormData.from(
        {"username": usercontroller.text, "password": psdcontroller.text});

    await HttpUtil().post(Api.Loginold, (data) {
      ToastUntil.ToastMsg("登陆成功");
      SPUntil.setString(PrefsConfig.Token, data["HC_ACCESS_TOKEN"].toString());
      Navigator.of(context)
          .push(new MaterialPageRoute(builder: (context) => new MenuPage()));
    }, errorcallback: (error) {
      ToastUntil.ToastMsg(error);
    }, data: formData);

//    Map<String, dynamic> json = response;
//    /*将Json转成实体类*/
//    LoginBeanEntity beanEntity = LoginBeanEntity.fromJson(json);
//    if (beanEntity.code == 200) {
//      SharedPreferences prefs = await SharedPreferences.getInstance();
//      prefs.setString(PrefsConfig.Token, beanEntity.data.hcAccessToken);
//      Navigator.of(context)
//          .push(new MaterialPageRoute(builder: (context) => new MenuPage()));
//    } else {
//      Fluttertoast.showToast(
//        msg: beanEntity.message,
//        toastLength: Toast.LENGTH_SHORT,
//        gravity: ToastGravity.CENTER,
//        timeInSecForIos: 1,
//      );
//    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 1920)..init(context);
//    usercontroller.addListener(() {
//      print('user ${usercontroller.text}');
//    });
//    psdcontroller.addListener(() {
//      print('psd ${psdcontroller.text}');
//    });
    return new Scaffold(
      body: Container(
        color: Color(mColors.c_ffffff),
        child: new SingleChildScrollView(
          child: new ConstrainedBox(
            constraints: new BoxConstraints(
              minHeight: 0,
            ),
            child: new Column(
              children: <Widget>[
                Container(
                  height: ScreenUtil().setHeight(610),
                  width: ScreenUtil.screenWidth,
                  child: Image.asset("images/img_loginbg.png"),
                  margin: EdgeInsets.only(bottom: ScreenUtil.statusBarHeight),
                ),
                Container(
                  width: ScreenUtil().setWidth(892),
                  child: TextField(
                    cursorColor: Color(mColors.c_ff0000),
                    decoration: InputDecoration(
                      hintText: "请输入工号",
                      prefixIcon: Container(
                        width: ScreenUtil().setWidth(1),
                        height: ScreenUtil().setHeight(2),
                        child: Center(
                          child: Image.asset(
                            "images/img_loginuser.png",
                            height: ScreenUtil().setHeight(40),
                            width: ScreenUtil().setWidth(46),
                          ),
                        ),
                      ),
                    ),
                    controller: usercontroller,
                  ),
                ),
                Container(
                  width: ScreenUtil().setWidth(892),
                  height: ScreenUtil().setHeight(400),
                  padding: EdgeInsets.only(top: ScreenUtil().setSp(40)),
                  child: TextField(
                    cursorColor: Color(mColors.c_ff0000),
                    obscureText: true, //是否是密码
                    decoration: InputDecoration(
                      hintText: "请输入密码",
                      prefixIcon: Container(
                        width: ScreenUtil().setWidth(1),
                        height: ScreenUtil().setHeight(2),
                        child: Center(
                          child: Image.asset(
                            "images/img_loginpsd.png",
                            height: ScreenUtil().setHeight(40),
                            width: ScreenUtil().setWidth(46),
                          ),
                        ),
                      ),
                    ),
                    controller: psdcontroller,
                  ),
                ),
                GestureDetector(
                  child: Container(
                    width: ScreenUtil().setWidth(912),
                    height: ScreenUtil().setHeight(158),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("images/img_loginbut.png"))),
                    child: Center(
                      child: Text(
                        "登陆",
                        style: TextStyle(
                            color: Color(mColors.c_ffffff),
                            fontSize: ScreenUtil().setSp(46)),
                      ),
                    ),
                  ),
                  onTap: _login,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showAlertDialog(BuildContext context) {
  NavigatorState navigator =
      context.rootAncestorStateOfType(const TypeMatcher<NavigatorState>());
  debugPrint("navigator is null?" + (navigator == null).toString());

  showDialog(
      context: context,
      builder: (_) => new AlertDialog(
              title: new Text("Dialog Title"),
              content: new Text("This is my content"),
              actions: <Widget>[
                new FlatButton(
                  child: new Text("CANCEL"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                new FlatButton(
                  child: new Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ]));
}
