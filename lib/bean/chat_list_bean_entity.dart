class ChatListBeanEntityList{
	final List<ChatListBeanEntity> ChatListBeanEntitylist;

	ChatListBeanEntityList({
		this.ChatListBeanEntitylist,
	});

	factory ChatListBeanEntityList.fromJson(List<dynamic> parsedJson) {

		List<ChatListBeanEntity> ChatListBeanEntitylist = new List<ChatListBeanEntity>();
		ChatListBeanEntitylist = parsedJson.map((i)=>ChatListBeanEntity.fromJson(i)).toList();

		return new ChatListBeanEntityList(
			ChatListBeanEntitylist: ChatListBeanEntitylist,
		);
	}

}

class ChatListBeanEntity {
	int isHide;
	int isBlock;
	String last;
	int num;
	int toId;
	int noticeId;
	int lastId;
	List<Null> callOut;
	int timeline;
	int stick;
	int id;
	String relationship;
	int groupTagId;
	int saveId;
	ChatListBeanNotice notice;

	ChatListBeanEntity({this.isHide, this.isBlock, this.last, this.num, this.toId, this.noticeId, this.lastId, this.callOut, this.timeline, this.stick, this.id, this.relationship, this.groupTagId, this.saveId, this.notice});

	ChatListBeanEntity.fromJson(Map<String, dynamic> json) {
		isHide = json['is_hide'];
		isBlock = json['is_block'];
		last = json['last'];
		num = json['num'];
		toId = json['to_id'];
		noticeId = json['notice_id'];
		lastId = json['last_id'];
		if (json['call_out'] != null) {
			callOut = new List<Null>();
		}
		timeline = json['timeline'];
		stick = json['stick'];
		id = json['id'];
		relationship = json['relationship'];
		groupTagId = json['group_tag_id'];
		saveId = json['save_id'];
		notice = json['notice'] != null ? new ChatListBeanNotice.fromJson(json['notice']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['is_hide'] = this.isHide;
		data['is_block'] = this.isBlock;
		data['last'] = this.last;
		data['num'] = this.num;
		data['to_id'] = this.toId;
		data['notice_id'] = this.noticeId;
		data['last_id'] = this.lastId;
		if (this.callOut != null) {
      data['call_out'] =  [];
    }
		data['timeline'] = this.timeline;
		data['stick'] = this.stick;
		data['id'] = this.id;
		data['relationship'] = this.relationship;
		data['group_tag_id'] = this.groupTagId;
		data['save_id'] = this.saveId;
		if (this.notice != null) {
      data['notice'] = this.notice.toJson();
    }
		return data;
	}
}

class ChatListBeanNotice {
	int uid;
	int groupId;
	//String readUser;
	int id;
	String title;
	String publishAt;
	String content;

	ChatListBeanNotice({this.uid, this.groupId, this.id, this.title, this.publishAt, this.content});

	ChatListBeanNotice.fromJson(Map<String, dynamic> json) {
		uid = json['uid'];
		groupId = json['group_id'];
		id = json['id'];
		title = json['title'];
		publishAt = json['publish_at'];
		content = json['content'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['uid'] = this.uid;
		data['group_id'] = this.groupId;
		data['id'] = this.id;
		data['title'] = this.title;
		data['publish_at'] = this.publishAt;
		data['content'] = this.content;
		return data;
	}
}
