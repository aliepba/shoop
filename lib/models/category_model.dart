class CategoryModel {
  int id;
  String name;

  CategoryModel({required this.id, required this.name});

  CategoryModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = json['name'] as String;

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
