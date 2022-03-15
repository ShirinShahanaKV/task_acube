class ItemElements {
late String key;
late   String itemTypeName;
late   String itemTypeCode;
late   String brandName;
late   String brandCode;
late   String colorName;
late   String colorCode;
late   String sizeName;
late   String sizeCode;
late   String categoryName;
late   String categoryCode;
late   String subCategoryName;
late   String subCategoryCode;
late   String itemName;
late   int itemId;
late   int companyID;

  ItemElements(
      {required this.key,
        required this.itemTypeName,
        required this.itemTypeCode,
        required this.brandName,
        required this.brandCode,
        required  this.colorName,
        required this.colorCode,
        required this.sizeName,
        required this.sizeCode,
        required this.categoryName,
        required this.categoryCode,
        required this.subCategoryName,
        required this.subCategoryCode,
        required this.itemName,
        required this.itemId,
        required this.companyID});

  ItemElements.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    itemTypeName = json['itemTypeName'];
    itemTypeCode = json['itemTypeCode'];
    brandName = json['brandName'];
    brandCode = json['brandCode'];
    colorName = json['colorName'];
    colorCode = json['colorCode'];
    sizeName = json['sizeName'];
    sizeCode = json['sizeCode'];
    categoryName = json['categoryName'];
    categoryCode = json['categoryCode'];
    subCategoryName = json['subCategoryName'];
    subCategoryCode = json['subCategoryCode'];
    itemName = json['itemName'];
    itemId = json['itemId'];
    companyID = json['companyID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['itemTypeName'] = this.itemTypeName;
    data['itemTypeCode'] = this.itemTypeCode;
    data['brandName'] = this.brandName;
    data['brandCode'] = this.brandCode;
    data['colorName'] = this.colorName;
    data['colorCode'] = this.colorCode;
    data['sizeName'] = this.sizeName;
    data['sizeCode'] = this.sizeCode;
    data['categoryName'] = this.categoryName;
    data['categoryCode'] = this.categoryCode;
    data['subCategoryName'] = this.subCategoryName;
    data['subCategoryCode'] = this.subCategoryCode;
    data['itemName'] = this.itemName;
    data['itemId'] = this.itemId;
    data['companyID'] = this.companyID;
    return data;
  }
}
