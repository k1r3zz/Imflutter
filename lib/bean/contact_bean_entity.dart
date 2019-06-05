class ContactBeanEntityList {
  final List<ContactBeanEntity> ContactBeanEntitylist;

  ContactBeanEntityList({
    this.ContactBeanEntitylist,
  });

  factory ContactBeanEntityList.fromJson(List<dynamic> parsedJson) {
    List<ContactBeanEntity> ContactBeanEntitylist =
        new List<ContactBeanEntity>();
    ContactBeanEntitylist =
        parsedJson.map((i) => ContactBeanEntity.fromJson(i)).toList();

    return new ContactBeanEntityList(
      ContactBeanEntitylist: ContactBeanEntitylist,
    );
  }
}

class ContactBeanEntity {
  int id;
  String entryTime;
  String bigImg;
  String partnerName;
  String mobile;
  String avatar;
  String teamName;
  int uid;
  String fullName;
  String jobName;
  int staffId;
  String labelName;
  String partName;
  String partFull;
  String username;

  ContactBeanEntity(
      {this.entryTime,
      this.bigImg,
      this.partnerName,
      this.mobile,
      this.avatar,
      this.teamName,
      this.uid,
      this.fullName,
      this.jobName,
      this.staffId,
      this.labelName,
      this.partName,
      this.partFull,
      this.username,
      this.id
      });

  ContactBeanEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    entryTime = json['entry_time'];
    bigImg = json['big_img'];
    partnerName = json['partner_name'];
    mobile = json['mobile'];
    avatar = json['avatar'];
    teamName = json['team_name'];
    uid = json['uid'];
    fullName = json['full_name'];
    jobName = json['job_name'];
    staffId = json['staff_id'];
    labelName = json['label_name'];
    partName = json['part_name'];
    partFull = json['part_full'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['entry_time'] = this.entryTime;
    data['big_img'] = this.bigImg;
    data['partner_name'] = this.partnerName;
    data['mobile'] = this.mobile;
    data['avatar'] = this.avatar;
    data['team_name'] = this.teamName;
    data['uid'] = this.uid;
    data['full_name'] = this.fullName;
    data['job_name'] = this.jobName;
    data['staff_id'] = this.staffId;
    data['label_name'] = this.labelName;
    data['part_name'] = this.partName;
    data['part_full'] = this.partFull;
    data['username'] = this.username;
    data['id'] = this.id;
    return data;
  }
}
