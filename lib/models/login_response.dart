class LoginResponse {
  late String userName;
  late int roleName;
  late int facilityId;
  late String token;
  late String message;

  LoginResponse(
      {required this.userName,
        required this.roleName,
        required this.facilityId,
        required this.token,
        required this.message});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    roleName = json['roleName'];
    facilityId = json['facilityId'];
    token = json['token'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['roleName'] = this.roleName;
    data['facilityId'] = this.facilityId;
    data['token'] = this.token;
    data['message'] = this.message;
    return data;
  }
}
