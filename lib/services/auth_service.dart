import 'dart:convert';

import 'package:shoop/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'http://10.0.2.2:3000';

  Future<UserModel> register(
      {required String name,
      required String phone,
      required String email,
      required String password}) async {
    var url = '$baseUrl/create';
    var headers = {'Content-Type': 'application/json'};

    var body = jsonEncode(
        {'name': name, 'phone': phone, 'email': email, 'password': password});

    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    print(response.body);

    if (response.statusCode == 201) {
      var data = jsonDecode((response.body));
      UserModel user = UserModel.fromJson(data);
      // ignore: prefer_interpolation_to_compose_strings
      user.token = 'Bearer ' + data['token'];
      return user;
    } else {
      throw Exception('Register Failed');
    }
  }

  Future<UserModel> login(
      {required String email, required String password}) async {
    var url = '$baseUrl/login';
    var headers = {'Content-Type': 'application/json'};

    var body = jsonEncode({'email': email, 'password': password});

    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      var res = jsonDecode((response.body));
      var data = res['data'];
      print(data);
      UserModel user = UserModel.fromJson(data);
      // ignore: prefer_interpolation_to_compose_strings
      user.token = 'Bearer ' + data['token'];
      return user;
    } else {
      throw Exception('Login Failed');
    }
  }
}
