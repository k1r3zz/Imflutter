import 'package:path/path.dart';
import 'package:simpleflutter/bean/contact_bean_entity.dart';
import 'package:sqflite/sqflite.dart';

class ContactBeanManager {
  static final ContactBeanManager _instance = ContactBeanManager.internal();

  factory ContactBeanManager() => _instance;
  static Database db;
  final String contact_list = 'contact_list';
  final String id = 'id';
  final String uid = 'uid';
  final String staff_id = 'staff_id';
  final String full_name = 'full_name';
  final String username = 'username';
  final String mobile = 'mobile';
  final String entry_time = 'entry_time';
  final String avatar = 'avatar';
  final String big_img = 'big_img';
  final String part_name = 'part_name';
  final String team_name = 'team_name';
  final String job_name = 'job_name';
  final String partner_name = 'partner_name';
  final String label_name = 'label_name';
  final String part_full = 'part_full';

  Future<Database> get Contactdb async {
    if (db == null) {
      db =await openSqlite();
    }
    return db;
  }

  ContactBeanManager.internal();

  openSqlite() async {
    // 获取数据库文件的存储路径
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'Contact.db');

    //根据数据库文件路径和数据库版本号创建数据库表
    var newdb = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE $contact_list (
            $id INTEGER PRIMARY KEY, 
            $uid INTEGER, 
            $staff_id INTEGER, 
            $full_name TEXT, 
            $username TEXT,
            $mobile REAL,
            $entry_time TEXT,
            $avatar TEXT,
            $big_img TEXT,
            $part_name TEXT,
            $team_name TEXT,
            $job_name TEXT,
            $partner_name TEXT,
            $label_name TEXT,
            $part_full TEXT
            )
          ''');
    });
    return newdb;
  }

  // 插入一条数据
  insert(ContactBeanEntity contact) async {
    var dbClient=await Contactdb;
    await dbClient.insert(contact_list, contact.toJson());
  }

  // 插入一条数据
  insertAll(List<ContactBeanEntity> contacts) async {
    clear();
    var dbClient=await Contactdb;
    for (ContactBeanEntity item in contacts) {
      await dbClient.insert(contact_list, item.toJson());
    }
    print("ok");
  }

  Future<ContactBeanEntity> getContacts(int uids) async {
    var dbClient=await Contactdb;
    try {
      List<Map> maps = await dbClient.query(contact_list,
          columns: [
            id,
            uid,
            staff_id,
            full_name,
            username,
            mobile,
            entry_time,
            avatar,
            big_img,
            part_name,
            team_name,
            job_name,
            partner_name,
            label_name,
            part_full
          ],
          where: '$uid = ?',
          whereArgs: [uids]);
      if (maps.length > 0) {
        return ContactBeanEntity.fromJson(maps.first);
      }
    } on Exception catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<int> update(ContactBeanEntity bean) async {
    var dbClient=await Contactdb;
    return await dbClient.update(contact_list, bean.toJson(),
        where: '$uid = ?', whereArgs: [bean.id]);
  }

  //清空数据
  Future<int> clear() async {
    var dbClient = await Contactdb;
    return await dbClient.delete(contact_list);
  }

  // 记得及时关闭数据库，防止内存泄漏
  close() async {
    var dbClient=await Contactdb;
    await dbClient.close();
  }
}
