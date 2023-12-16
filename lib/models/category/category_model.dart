class CategoryModel {
  final int id;
  final String name;
  final String created_at;
  final String updated_at;

  CategoryModel({
    required this.id,
    required this.name,
    required this.created_at,
    required this.updated_at,
  });

  factory CategoryModel.fromJson(dynamic jsonData) {
    return CategoryModel(
        id: jsonData['id'],
        name: jsonData['name'],
        created_at: jsonData['created_at'],
        updated_at: jsonData['updated_at']);
  }
}
