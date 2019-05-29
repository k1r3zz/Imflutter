class LoginBeanEntity {
	int code;
	int httpCode;
	LoginBeanData data;
	String message;

	LoginBeanEntity({this.code, this.httpCode, this.data, this.message});

	LoginBeanEntity.fromJson(Map<String, dynamic> json) {
		code = json['code'];
		httpCode = json['http_code'];
		data = json['data'] != null ? new LoginBeanData.fromJson(json['data']) : null;
		message = json['message'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['code'] = this.code;
		data['http_code'] = this.httpCode;
		if (this.data != null) {
      data['data'] = this.data.toJson();
    }
		data['message'] = this.message;
		return data;
	}
}

class LoginBeanData {
	String hcAccessToken;

	LoginBeanData({this.hcAccessToken});

	LoginBeanData.fromJson(Map<String, dynamic> json) {
		hcAccessToken = json['HC_ACCESS_TOKEN'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['HC_ACCESS_TOKEN'] = this.hcAccessToken;
		return data;
	}
}
