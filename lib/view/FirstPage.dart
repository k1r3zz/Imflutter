import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simpleflutter/view/resources/mColors.dart';

class FirstPage extends StatefulWidget {
  FirstState createState() => new FirstState();
}

class FirstState extends State<FirstPage> {
  List chatlist = new List();

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 20; i++) {
      chatlist.add("item$i");
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 1920)
      ..init(context);
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("聊天",
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
        actions: <Widget>[

          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.add, color: Color(mColors.c_5676FC),),
          ),
        ],
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

          Expanded(
            child: ListView.builder(
              itemCount: chatlist.length,
              itemBuilder: (context, position) {
                return listwidget(chatlist[position]);
              },
            ),
          ),

        ],
      ),

    );
  }

  listwidget(String data) {
    return Column(
      children: <Widget>[
        Container(
          child: new ListTile(
            title: Text(
              "$data我的",
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(48),
                  color: Color(mColors.c_333333)
              ),
            ),
            leading: CircleAvatar(
              radius: 36.0,
              backgroundImage:
              NetworkImage(
                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1550047604&di=c9c27fb2d26432419140449c29cb4dfb&imgtype=jpg&er=1&src=http%3A%2F%2Fimg.25pp.com%2Fuploadfile%2Fapp%2Ficon%2F20150903%2F1441223857700007.png",
              ),
            ),
            trailing: Container(
              height: ScreenUtil().setHeight(225),
              width: ScreenUtil().setWidth(100),
              color: Color(mColors.c_ffffff),

            ),
            subtitle: Text(
              "1233",
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(42),
                  color: Color(mColors.c_999999)
              ),

            ),
          ),
          width: ScreenUtil.screenWidth,
          height: ScreenUtil().setHeight(228),
          color: Color(mColors.c_ffffff),
          alignment: Alignment.centerRight,
        ),

        Container(
          width: ScreenUtil.screenWidth,
          height: ScreenUtil().setHeight(1),
          color: Color(mColors.c_DDDDDD),
        )

      ],
    );
  }

}