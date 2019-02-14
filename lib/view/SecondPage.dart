import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simpleflutter/view/resources/mColors.dart';


class SecondPage extends StatefulWidget {
  SecondState createState() => new SecondState();
}

class SecondState extends State<SecondPage> {

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 1920)
      ..init(context);
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("通讯录",
          style: TextStyle(
              color: Color(mColors.c_333333),
              fontSize: ScreenUtil().setSp(54)
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(mColors.c_ffffff),
        elevation: 0,
        automaticallyImplyLeading: false,
        brightness: Brightness.light,
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Color(mColors.c_ffffff),
            child: Padding(
              padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(43),
                right: ScreenUtil().setWidth(43),
                bottom: ScreenUtil().setWidth(29),
                top: ScreenUtil().setWidth(29),
              ),
              child: Container(
                width: ScreenUtil.screenWidth,
                height: ScreenUtil().setSp(110),
                decoration: BoxDecoration(
                    color: Color(mColors.c_f1f1f3),
                    borderRadius: BorderRadius.circular(ScreenUtil().setSp(10))
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(mColors.c_999999
                      ),
                    ),
                    labelStyle: TextStyle(
                        color: Color(mColors.c_ff0000),
                        fontSize: 88
                    ),
                    hintText:"搜索",
                  ),
                  autofocus: false,
                  enabled: false,

                ),
              ),
            ),
          ),

        ],
      ),

    );
  }

}