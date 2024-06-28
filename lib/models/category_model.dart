class CategoryModel {
  int id;
  String name;

  CategoryModel({this.id = 0, this.name = ''});

  CategoryModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = json['name'] as String;

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }

  static empty() {
    return CategoryModel();
  }
}
