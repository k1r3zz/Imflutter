import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simpleflutter/view/resources/mColors.dart';

class FourthPage extends StatefulWidget {
  FourState createState() => new FourState();
}

class FourState extends State<FourthPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("文章",
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
    );
  }

}