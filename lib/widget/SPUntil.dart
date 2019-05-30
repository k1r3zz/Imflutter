import 'package:shared_preferences/shared_preferences.dart';

class SPUntil {
  static setString(key, str) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, str);
  }

  static getString(key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Future<String> future = new Future(() => SharedPreferences.getInstance())
        .then((m) => m.getString(key));

    return future;
  }

  static setInt(key, str) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, str);
  }

  static getInt(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }
}
