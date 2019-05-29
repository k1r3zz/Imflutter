import 'package:simpleflutter/bean/login_bean_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "LoginBeanEntity") {
      return LoginBeanEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}