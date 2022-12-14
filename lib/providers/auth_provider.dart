import 'package:flutter/cupertino.dart';
import 'package:shamo/models/user_model.dart';
import 'package:shamo/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;

  // Getter dan Setter
  // Get user dan dikembalikan ke _user (User Model)
  UserModel get user => _user; 
  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  // Function untuk mengeksekusi register
  // type data boolean untuk mengecek apakah registrasi berhasil atau tidak
  Future<bool> register({
    String? name,
    String? username,
    String? email,
    String? password,
  }) async {
    // Try Catch apakah registrasi berhasil atau tidak
    try {
      UserModel user = await AuthService().register(
        name: name!,
        username: username!,
        email: email!,
        password: password!,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Function untuk mengeksekusi login
  Future<bool> login({
    String? email,
    String? password,
  }) async {
    // Try Catch apakah registrasi berhasil atau tidak
    try {
      UserModel user = await AuthService().login(
        email: email!,
        password: password!,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
