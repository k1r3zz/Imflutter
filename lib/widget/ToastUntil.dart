import 'package:fluttertoast/fluttertoast.dart';

class ToastUntil{

  static void ToastMsg(String msg){
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1,
    );
  }

}