import 'package:simpleflutter/bean/login_bean_entity.dart';
import 'package:simpleflutter/bean/contact_bean_entity.dart';
import 'package:simpleflutter/bean/group_bean_entity.dart';
import 'package:simpleflutter/bean/chat_list_bean_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "LoginBeanEntity") {
      return LoginBeanEntity.fromJson(json) as T;
    } else if (T.toString() == "ContactBeanEntityList") {
      return ContactBeanEntityList.fromJson(json) as T;
    } else if (T.toString() == "GroupBeanEntity") {
      return GroupBeanEntity.fromJson(json) as T;
    } else if (T.toString() == "ChatListBeanEntityList") {
      return ChatListBeanEntityList.fromJson(json) as T;
    } else {
      return null;
    }
  }
}