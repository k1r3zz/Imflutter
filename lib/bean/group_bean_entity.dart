class GroupBeanEntityList {
	final List<GroupBeanEntity> GroupBeanEntitylist;

	GroupBeanEntityList({
		this.GroupBeanEntitylist,
	});

	factory GroupBeanEntityList.fromJson(List<dynamic> parsedJson) {
		List<GroupBeanEntity> GroupBeanEntitylist =
		new List<GroupBeanEntity>();
		GroupBeanEntitylist =
				parsedJson.map((i) => GroupBeanEntity.fromJson(i)).toList();

		return new GroupBeanEntityList(
			GroupBeanEntitylist: GroupBeanEntitylist,
		);
	}
}

class GroupBeanEntity {
	int blockType;
	String groupName;
	int level;
	int ownerId;
	int id;
	String avatar;

	GroupBeanEntity({this.blockType, this.groupName, this.level, this.ownerId, this.id, this.avatar});

	GroupBeanEntity.fromJson(Map<String, dynamic> json) {
		blockType = json['block_type'];
		groupName = json['group_name'];
		level = json['level'];
		ownerId = json['owner_id'];
		id = json['id'];
		avatar = json['avatar'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['block_type'] = this.blockType;
		data['group_name'] = this.groupName;
		data['level'] = this.level;
		data['owner_id'] = this.ownerId;
		data['id'] = this.id;
		data['avatar'] = this.avatar;
		return data;
	}
}
