class CategoriesModel {
  int? categoriesId;
  String? categoriesName;

  CategoriesModel({this.categoriesId, this.categoriesName});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    return data;
  }
}
