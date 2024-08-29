class ItemsModel {
  int? itemsId;
  String? itemsName;
  String? itemsImage;
  int? itemsCategories;
  String? itemsPrice;
  String? itemDescription;

  ItemsModel(
      {this.itemsId,
      this.itemsName,
      this.itemsImage,
      this.itemsCategories,
      this.itemsPrice,
      this.itemDescription});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsImage = json['items_image'];
    itemsCategories = json['items_categories'];
    itemsPrice = json['items_price'];
    itemDescription = json['item_description'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['items_id'] = this.itemsId;
  //   data['items_name'] = this.itemsName;
  //   data['items_image'] = this.itemsImage;
  //   data['items_categories'] = this.itemsCategories;
  //   data['items_price'] = this.itemsPrice;
  //   data['item_description'] = this.itemDescription;
  //   return data;
  // }
}
