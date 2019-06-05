import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simpleflutter/bean/chat_list_bean_entity.dart';
import 'package:simpleflutter/bean/contact_bean_entity.dart';
import 'package:simpleflutter/bean/group_bean_entity.dart';
import 'package:simpleflutter/bean/login_bean_entity.dart';
import 'package:simpleflutter/config/PrefsConfig.dart';
import 'package:simpleflutter/db/ContactBeanManager.dart';
import 'package:simpleflutter/db/GroupBeanManager.dart';
import 'package:simpleflutter/util/ChatListUtil.dart';
import 'package:simpleflutter/view/http/Api.dart';
import 'package:simpleflutter/view/http/HttpUtils.dart';
import 'package:simpleflutter/view/resources/mColors.dart';
import 'package:simpleflutter/widget/SPUntil.dart';
import 'package:simpleflutter/widget/ToastUntil.dart';
import 'dart:convert' show json;

class FirstPage extends StatefulWidget {
  FirstState createState() => new FirstState();
}

class FirstState extends State<FirstPage> {
  List<ChatListBeanEntity> chatlist = new List();
  var contactBeanManager = ContactBeanManager();
  var groupBeanManager = GroupBeanManager();

  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() async {
    await HttpUtil().get(Api.GetConversationList, (data) {
      ChatListBeanEntityList cardbeanList =
          new ChatListBeanEntityList.fromJson(data);
      setState(() {
        chatlist.addAll(cardbeanList.ChatListBeanEntitylist);
      });
    });
  }

  Future<ContactBeanEntity> _getContract(uid) async {
    ContactBeanEntity item = await contactBeanManager.getContacts(uid);
    //   await contactBeanManager.close();
    return item;
  }

  Future<GroupBeanEntity> _getGroup(uid) async {
    GroupBeanEntity groupBeanEntity = await groupBeanManager.getGroup(uid);
    //   await groupBeanManager.close();
    return groupBeanEntity;
  }

//  _getToken() async {
//    ToastUntil.ToastMsg(await SPUntil.getString(PrefsConfig.Token));
//  }
  void _onClick() {
    //  ToastUntil.ToastMsg('${data.toId != null ? data.toId : data.last}');
//    ToastUntil.ToastMsg('123');
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 1920)..init(context);
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          "聊天",
          style: TextStyle(
              color: Color(mColors.c_333333), fontSize: ScreenUtil().setSp(54)),
        ),
        centerTitle: true,
        backgroundColor: Color(mColors.c_ffffff),
        elevation: 0,
        automaticallyImplyLeading: false,
        brightness: Brightness.light,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.add,
              color: Color(mColors.c_5676FC),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Color(mColors.c_ffffff),
            child: Padding(
              padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(43),
                right: ScreenUtil().setWidth(43),
                bottom: ScreenUtil().setWidth(29),
                top: ScreenUtil().setWidth(29),
              ),
              child: Container(
                width: ScreenUtil.screenWidth,
                height: ScreenUtil().setSp(110),
                decoration: BoxDecoration(
                    color: Color(mColors.c_f1f1f3),
                    borderRadius:
                        BorderRadius.circular(ScreenUtil().setSp(10))),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(mColors.c_999999),
                    ),
                    labelStyle:
                        TextStyle(color: Color(mColors.c_ff0000), fontSize: 88),
                    hintText: "搜索",
                  ),
                  autofocus: false,
                  enabled: false,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chatlist.length,
              itemBuilder: (context, position) {
                return listwidget(chatlist[position]);
              },
            ),
          ),
        ],
      ),
    );
  }

  listwidget(ChatListBeanEntity data) {
//    if (data.toId == null) {
//      return _builditem(null, null, null);
//    } else
    if (data.toId > 1000000) {
      return GroupFutureBuilder(data);
    } else if (data.toId > 0) {
      return ContractFutureBuilder(data);
    }
//    else{
//        return Text("test");
//      }
    else {
      return _builditem(null, null, null);
    }
  }

  GroupFutureBuilder(ChatListBeanEntity data) {
    return FutureBuilder(
      builder: (BuildContext context, AsyncSnapshot<GroupBeanEntity> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            print('还没有开始网络请求');
            return Text('还没有开始网络请求');
          case ConnectionState.active:
            print('active');
            return Text('ConnectionState.active');
          case ConnectionState.waiting:
            print('waiting');
            return _builditem(null, null, null);
//            return Text("waiting");
//              Center(
//              child: CircularProgressIndicator(),
//            );
          case ConnectionState.done:
            print('done');
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            return _builditem(
              data,
              null,
              snapshot.data,
            );
          default:
            return _builditem(data, null, snapshot.data);
        }
      },
      future: _getGroup(data.toId),
    );
  }

  ContractFutureBuilder(ChatListBeanEntity data) {
    return FutureBuilder(
//      builder: _buildFuture(context,AsyncSnapshot<ContactBeanEntity> async,data),
      builder:
          (BuildContext context, AsyncSnapshot<ContactBeanEntity> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            print('还没有开始网络请求');
            return Text('还没有开始网络请求');
          case ConnectionState.active:
            print('active');
            return Text('ConnectionState.active');
          case ConnectionState.waiting:
            print('waiting');
            return _builditem(null, null, null);

//              Center(
//              child: CircularProgressIndicator(),
//            );
          case ConnectionState.done:
            print('done');
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            return _builditem(data, snapshot.data, null);
          default:
            return _builditem(data, snapshot.data, null);
        }
      },
      future: _getContract(data.toId),
    );
  }

  _builditem(ChatListBeanEntity data, ContactBeanEntity contact,
      GroupBeanEntity group) {
    return Column(children: <Widget>[
      GestureDetector(
        child: Container(
          child: new ListTile(
            title: Text(
              getText(data, contact, group),
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(48),
                  color: Color(mColors.c_333333)),
            ),
            leading: new ClipOval(
              child: new CachedNetworkImage(
                placeholder: new CircularProgressIndicator(),
                imageUrl: getAvatar(data, contact, group),
                width: 60,
                height: 60,
                fit: BoxFit.fitWidth,
              ),
            ),

//            CircleAvatar(
//              child: new CachedNetworkImage(
//                placeholder: new CircularProgressIndicator(),
//                imageUrl: getAvatar(data, contact, group),
//              ),
//              radius: 30.0,
////              backgroundImage: NetworkImage(getAvatar(data, contact, group)),
//            ),
            trailing: Container(
              height: ScreenUtil().setHeight(225),
              width: ScreenUtil().setWidth(100),
              color: Color(mColors.c_ffffff),
            ),
            subtitle: Text(
              data != null && data.toId != null ? '${data.toId}' : "不支持",
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(42),
                  color: Color(mColors.c_999999)),
            ),
          ),
          width: ScreenUtil.screenWidth,
          height: ScreenUtil().setHeight(200),
          color: Color(mColors.c_ffffff),
          alignment: Alignment.centerRight,
        ),
        onTap: () {
          ToastUntil.ToastMsg('${data.toId != null ? data.toId : data.last}');
        },
//        onDoubleTap: _onClick(data),
//        onTapDown: _onClick(data),
      ),
      Container(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil().setHeight(1),
        color: Color(mColors.c_DDDDDD),
      )
    ]);
  }

  getText(ChatListBeanEntity data, ContactBeanEntity contact,
      GroupBeanEntity group) {
    if (data == null || data.toId == null) return "暂不支持";
    switch (ChatListUtil.getChatListType(data.toId)) {
      case 1:
        return group != null && group.groupName != null
            ? group.groupName
            : '${data.toId}group';
      case 2:
        return contact != null && contact.fullName != null
            ? contact.fullName
            : '${data.toId}con';
      case 3:
        return "暂不支持";
    }
  }

  getAvatar(ChatListBeanEntity data, ContactBeanEntity contact,
      GroupBeanEntity group) {
    if (data == null || data.toId == null)
      return "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1550047604&di=c9c27fb2d26432419140449c29cb4dfb&imgtype=jpg&er=1&src=http%3A%2F%2Fimg.25pp.com%2Fuploadfile%2Fapp%2Ficon%2F20150903%2F1441223857700007.png";
    switch (ChatListUtil.getChatListType(data.toId)) {
      case 1:
        return group != null && group.avatar != null
            ? group.avatar
            : "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1550047604&di=c9c27fb2d26432419140449c29cb4dfb&imgtype=jpg&er=1&src=http%3A%2F%2Fimg.25pp.com%2Fuploadfile%2Fapp%2Ficon%2F20150903%2F1441223857700007.png";
      case 2:
        return contact != null && contact.avatar != null
            ? contact.avatar
            : "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1550047604&di=c9c27fb2d26432419140449c29cb4dfb&imgtype=jpg&er=1&src=http%3A%2F%2Fimg.25pp.com%2Fuploadfile%2Fapp%2Ficon%2F20150903%2F1441223857700007.png";
      case 3:
        return "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1550047604&di=c9c27fb2d26432419140449c29cb4dfb&imgtype=jpg&er=1&src=http%3A%2F%2Fimg.25pp.com%2Fuploadfile%2Fapp%2Ficon%2F20150903%2F1441223857700007.png";
    }
  }
}
