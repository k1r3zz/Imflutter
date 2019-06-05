class ChatListUtil {
  static int getChatListType(int uid) {
    if (uid > 1000000) {
      return 1;//群
    } else if (uid > 0) {
      return 2;//但
    } else {
      return 3;//特殊
    }
  }
}
