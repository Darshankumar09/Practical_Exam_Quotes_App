class CategoryDatabaseModel {
  int categoryId;
  String categoryName;

  CategoryDatabaseModel({
    required this.categoryId,
    required this.categoryName,
  });

  factory CategoryDatabaseModel.formMap({required Map data}) {
    return CategoryDatabaseModel(
      categoryId: data['category_id'],
      categoryName: data['category_name'],
    );
  }
}
