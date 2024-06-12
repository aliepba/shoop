import 'package:flutter/material.dart';
import 'package:shoop/models/user_model.dart';
import 'package:shoop/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register(
      {required String name,
      required String email,
      required String phone,
      required String password}) async {
    try {
      UserModel user = await AuthService()
          .register(name: name, phone: phone, email: email, password: password);

      _user = user;
      return true;
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return false;
    }
  }

  Future<bool> login({required String email, required String password}) async {
    try {
      UserModel user =
          await AuthService().login(email: email, password: password);

      _user = user;
      return true;
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return false;
    }
  }
}
