class MenuResponse {
 late String menuType;
 late String menuName;
 late String menuText;
 late String menuIconName;
 late int sortOrder;

  MenuResponse(
      {required this.menuType,
        required this.menuName,
        required this.menuText,
        required this.menuIconName,
        required this.sortOrder});

  MenuResponse.fromJson(Map<String, dynamic> json) {
    menuType = json['menuType'];
    menuName = json['menuName'];
    menuText = json['menuText'];
    menuIconName = json['menuIconName'];
    sortOrder = json['sortOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['menuType'] = this.menuType;
    data['menuName'] = this.menuName;
    data['menuText'] = this.menuText;
    data['menuIconName'] = this.menuIconName;
    data['sortOrder'] = this.sortOrder;
    return data;
  }
}
