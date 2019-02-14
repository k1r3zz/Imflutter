import 'package:flutter/material.dart';
import 'package:simpleflutter/MyHomePage.dart';
import 'package:simpleflutter/view/login/login.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => new _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
    new AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));

    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushAndRemoveUntil(
//            MaterialPageRoute(builder: (context) => MyHomePage(title: 'Flutter Demo Home Page')),
//                (route) => route == null);
            MaterialPageRoute(builder: (context) => loginView()),
                (route) => route == null);
      }
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: _animation,
        child: new Image.network(
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1549127941700&di=e4dc053b3611dc14b92d8fd1a1f8495e&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201411%2F01%2F20141101045249_NF285.thumb.700_0.jpeg",
          scale: 2,
          fit: BoxFit.cover,
        ),

    );
  }
}
