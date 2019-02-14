import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simpleflutter/view/resources/mColors.dart';

class FivethPage extends StatefulWidget {
  FivethState createState() => new FivethState();
}

class FivethState extends State<FivethPage> {

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 1920)
      ..init(context);
    // TODO: implement build
    return Container(
      color: Color(mColors.c_ffffff),
      child: ListView(
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(490),
            width: ScreenUtil.screenWidth,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/img_minebg.png"),
                    fit: BoxFit.fill)
            ),
            padding: EdgeInsets.only(
              top: ScreenUtil().setHeight(180),
              left: ScreenUtil().setWidth(82),
            ),
            alignment: Alignment.topCenter,
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: ScreenUtil().setWidth(220),
                    height: ScreenUtil().setWidth(220),
                    child: CircleAvatar(
                      radius: 36.0,
                      backgroundImage:
                      NetworkImage(
                        "http://pic2.zhimg.com/v2-ab015fb3413dac1e9f77e24e4317ac71_b.jpg",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "啦啦啦",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(54),
                            color: Color(mColors.c_333333),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            "hantalk-android",
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(42),
                                color: Color(mColors.c_333333)
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            "联系电话：152****670",
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(42),
                                color: Color(mColors.c_333333)
                            ),
                          ),
                        ),

                      ],
                    ),

                  ),

                ],
              ),
            ),

          ),
          Container(
            height: ScreenUtil().setHeight(30),
            width: ScreenUtil.screenWidth,
            color: Color(mColors.c_f9f9f9),
          ),
          ListTile(
            leading: ImageIcon(AssetImage("images/img_mine_icon1.png")),
            title: Text("修改密码", style: TextStyle(
                fontSize: ScreenUtil().setSp(43),
                color: Color(mColors.c_333333))),
            trailing: ImageIcon(AssetImage("images/img_mine_icon5.png"),color: Color(mColors.c_cccccc),),
          ),
          Container(
            height: ScreenUtil().setHeight(1),
            width: ScreenUtil.screenWidth,
            color: Color(mColors.c_DDDDDD),
          ),
          ListTile(
            leading: ImageIcon(AssetImage("images/img_mine_banben.png")),
            title: Text("当前版本", style: TextStyle(
                fontSize: ScreenUtil().setSp(43),
                color: Color(mColors.c_333333))),
            trailing: ImageIcon(AssetImage("images/img_mine_icon5.png"),color: Color(mColors.c_cccccc),),
          ),
          Container(
            height: ScreenUtil().setHeight(1),
            width: ScreenUtil.screenWidth,
            color: Color(mColors.c_DDDDDD),
          ),
          ListTile(
            leading: ImageIcon(AssetImage("images/img_mine_icon2.png")),
            title: Text("反馈问题", style: TextStyle(
                fontSize: ScreenUtil().setSp(43),
                color: Color(mColors.c_333333))),
            trailing: ImageIcon(AssetImage("images/img_mine_icon5.png"),color: Color(mColors.c_cccccc),),
          ),
          Container(
            height: ScreenUtil().setHeight(1),
            width: ScreenUtil.screenWidth,
            color: Color(mColors.c_DDDDDD),
          ),
          ListTile(
            leading: ImageIcon(AssetImage("images/img_mine_icon3.png")),
            title: Text("帮助中心", style: TextStyle(
                fontSize: ScreenUtil().setSp(43),
                color: Color(mColors.c_333333))),
            trailing: ImageIcon(AssetImage("images/img_mine_icon5.png"),color: Color(mColors.c_cccccc),),
          ),
          Container(
            height: ScreenUtil().setHeight(30),
            width: ScreenUtil.screenWidth,
            color: Color(mColors.c_f9f9f9),
          ),
          ListTile(
            leading: ImageIcon(AssetImage("images/img_mine_icon4.png")),
            title: Text("设置", style: TextStyle(
                fontSize: ScreenUtil().setSp(43),
                color: Color(mColors.c_333333))),
            trailing: ImageIcon(AssetImage("images/img_mine_icon5.png"),color: Color(mColors.c_cccccc),),
          ),
          Container(
            height: ScreenUtil().setHeight(1),
            width: ScreenUtil.screenWidth,
            color: Color(mColors.c_DDDDDD),
          ),

        ],
      ),
    );
  }

}