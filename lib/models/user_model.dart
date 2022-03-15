class User {
  late String companyID;
  late String applicationID;
  late String userName;
  late String password;

  User({required this.companyID, required this.applicationID, required this.userName, required this.password});

  User.fromJson(Map<String, dynamic> json) {
    companyID = json['companyID'];
    applicationID = json['applicationID'];
    userName = json['userName'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['companyID'] = this.companyID;
    data['applicationID'] = this.applicationID;
    data['userName'] = this.userName;
    data['password'] = this.password;
    return data;
  }
}
