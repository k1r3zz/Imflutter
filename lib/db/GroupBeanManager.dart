import 'package:path/path.dart';
import 'package:simpleflutter/bean/group_bean_entity.dart';
import 'package:sqflite/sqflite.dart';

class GroupBeanManager {
  static final GroupBeanManager _instance = GroupBeanManager.internal();

  factory GroupBeanManager() => _instance;
  static Database db;
  final String group_list = 'group_list';
  final String id = 'id';
  final String group_name = 'group_name';
  final String avatar = 'avatar';
  final String owner_id = 'owner_id';
  final String block_type = 'block_type';
  final String level = 'level';

  Future<Database> get groupdb async {
    if (db == null) {
      db = await openSqlite();
    }

    return db;
  }

  GroupBeanManager.internal();

  openSqlite() async {
    // 获取数据库文件的存储路径
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'Group.db');

    //根据数据库文件路径和数据库版本号创建数据库表
    var newdb = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE $group_list (
            $id INTEGER PRIMARY KEY, 
            $group_name TEXT, 
            $avatar TEXT, 
            $owner_id INTEGER, 
            $block_type INTEGER,
            $level INTEGER
            )
          ''');
    });
    return newdb;
  }

  // 插入一条数据
  insert(GroupBeanEntity group) async {
    var dbClient = await groupdb;
    await dbClient.insert(group_list, group.toJson());
  }

  // 插入一条数据
  insertAll(List<GroupBeanEntity> contacts) async {
    clear();
    var dbClient = await groupdb;
    for (GroupBeanEntity item in contacts) {
      await dbClient.insert(group_list, item.toJson());
    }
    print("ok");
  }

  Future<GroupBeanEntity> getGroup(int ids) async {
    var dbClient = await groupdb;
    try {
      List<Map> maps = await dbClient.query(group_list,
          columns: [id, group_name, avatar, owner_id, block_type, level],
          where: '$id = ?',
          whereArgs: [ids]);
      if (maps.length > 0) {
        return GroupBeanEntity.fromJson(maps.first);
      }
    } on Exception catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<int> update(GroupBeanEntity bean) async {
    var dbClient = await groupdb;
    return await dbClient.update(group_list, bean.toJson(),
        where: '$id = ?', whereArgs: [bean.id]);
  }

  //清空数据
  Future<int> clear() async {
    var dbClient = await groupdb;
    return await dbClient.delete(group_list);
  }

  // 记得及时关闭数据库，防止内存泄漏
  close() async {
    var dbClient = await groupdb;
    await dbClient.close();
  }
}
