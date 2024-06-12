class UserModel {
  int id;
  String name;
  String email;
  String phone;
  String token;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.token});

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = json['name'] as String,
        email = json['email'] as String,
        phone = json['phone'] as String,
        token = json['token'] as String;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'token': token
    };
  }
}
