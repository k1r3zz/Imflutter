import 'package:simpleflutter/bean/login_bean_entity.dart';
import 'package:simpleflutter/bean/chat_list_bean_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "LoginBeanEntity") {
      return LoginBeanEntity.fromJson(json) as T;
    } else if (T.toString() == "ChatListBeanEntity") {
      return ChatListBeanEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}