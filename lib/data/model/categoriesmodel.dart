class CategoriesModel {
  int? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDatetime;

  CategoriesModel({
    this.categoriesId,
    this.categoriesName,
    this.categoriesNameAr,
    this.categoriesImage,
    this.categoriesDatetime,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      categoriesId: json['categories_id'],
      categoriesName: json['categories_name'],
      categoriesNameAr: json['categories_name_ar'],
      categoriesImage: json['categories_image'],
      categoriesDatetime: json['categories_datetime'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'categories_id': categoriesId,
      'categories_name': categoriesName,
      'categories_name_ar': categoriesNameAr,
      'categories_image': categoriesImage,
      'categories_datetime': categoriesDatetime,
    };
    return data;
  }
}
