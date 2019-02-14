import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simpleflutter/bean/ApplictionBean.dart';
import 'package:simpleflutter/view/resources/mColors.dart';
import 'package:simpleflutter/widget/BannerWidget.dart';

class ThirdPage extends StatefulWidget {
  ThirdState createState() => new ThirdState();
}

class ThirdState extends State<ThirdPage> {
  List<BannerItem> bannerList = [];
  List<ApplictionBean> applist = [];

  @override
  void initState() {
    BannerItem item = BannerItem.defaultBannerItem(
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1550141558251&di=a2d5218b1ddceb4153755927c0d6ae8d&imgtype=0&src=http%3A%2F%2Fimg2.3lian.com%2F2014%2Ff4%2F174%2Fd%2F108.jpg',
        '');
    bannerList.add(item);
    item = BannerItem.defaultBannerItem(
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1550141587657&di=c77029351e18f8e39a1b323f45fd0557&imgtype=0&src=http%3A%2F%2Fpic156.nipic.com%2Ffile%2F20180211%2F25535374_202844317000_2.jpg',
        '');
    bannerList.add(item);
    item = BannerItem.defaultBannerItem(
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1550141604497&di=f7f663b752a3f59b50bba03f4fe7f579&imgtype=0&src=http%3A%2F%2Fpic1.nipic.com%2F2008-09-08%2F20089895813245_2.jpg',
        '');
    bannerList.add(item);

    ApplictionIconBean bean1 = new ApplictionIconBean(
        "打卡", "images/img_app_icon1.png");
    ApplictionIconBean bean2 = new ApplictionIconBean(
        "请假", "images/img_app_icon2.png");
    List<ApplictionIconBean> list1 = [bean1, bean2];
    ApplictionBean applictionBean1 = new ApplictionBean("考勤模块", list1);
    applist.add(applictionBean1);

    bean1 = new ApplictionIconBean(
        "思维导图", "images/img_app_icon3.png");
    bean2 = new ApplictionIconBean(
        "办公软件", "images/img_app_icon4.png");
    ApplictionIconBean bean3 = new ApplictionIconBean(
        "会议", "images/img_app_icon1.png");
    ApplictionIconBean bean4 = new ApplictionIconBean(
        "收藏", "images/img_app_icon6.png");
    List<ApplictionIconBean> list2 = [bean1, bean2, bean3, bean4];
    ApplictionBean applictionBean2 = new ApplictionBean("办公软件", list2);
    applist.add(applictionBean2);


    bean1 = new ApplictionIconBean(
        "他山石", "images/img_app_icon7.png");
    bean2 = new ApplictionIconBean(
        "会议制度", "images/img_app_icon8.png");
    bean3 = new ApplictionIconBean(
        "公司文档", "images/img_app_icon9.png");
    bean4 = new ApplictionIconBean(
        "调研分析", "images/img_app_icon10.png");
    List<ApplictionIconBean> list3 = [bean1, bean2, bean3, bean4];
    ApplictionBean applictionBean3 = new ApplictionBean("内部资讯", list3);
    applist.add(applictionBean3);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 1920)
      ..init(context);
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("应用",
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
      body: Container(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        color: Color(mColors.c_ffffff),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(42),
                  right: ScreenUtil().setWidth(42)),
              child: new BannerWidget(
                ScreenUtil().setHeight(456),
                bannerList,
                duration: 3000,
                bannerPress: (pos, item) {
                  print('第 $pos 点击了');
                },
              ),
            ),
            Column(
              children: setItem(applist),
            )

          ],
        ),
      ),
    );
  }

  List<Widget> setItem(List<ApplictionBean> applist) {
    print(applist[0].name + "111");
    List<Widget> items = [];
//    for (int i=0;i<applist.length;i++) {
    for (ApplictionBean item in applist) {
      Widget widget = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: ScreenUtil().setSp(47), left: ScreenUtil().setSp(43)),
            child: Text(
              '${item.name}',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(43),
                color: Color(mColors.c_333333),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          GridView.count(
            crossAxisCount: 3,
            padding: EdgeInsets.all(0.0),
            shrinkWrap: true,
            physics: new NeverScrollableScrollPhysics(),
            //宽高比
            childAspectRatio: 3 / 2,
            children: setIcon(item.appicons),


          ),

        ],
      );
      items.add(widget);
    }
    return items;
  }

  List<Widget>  setIcon(List<ApplictionIconBean> icons) {
    List<Widget> items = [];
    for(ApplictionIconBean bean  in icons){
      Widget item=Padding(
        padding: EdgeInsets.only(top: ScreenUtil().setHeight(30)),
        child: Column(
          children: <Widget>[
            Image(
              image: AssetImage(bean.icon),
              height: ScreenUtil().setWidth(90),
              width: ScreenUtil().setWidth(90),
            ),
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(13)),
              child: Text("${bean.name}", style: TextStyle(color: Color(mColors.c_333333),
                  fontSize: ScreenUtil().setSp(42)),),
            ),

          ],
        ),

      );
      items.add(item);
    }
    return items;
  }

}