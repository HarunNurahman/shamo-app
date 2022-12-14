import 'dart:convert';

import 'package:shamo/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  // API URL
  String baseUrl = 'https://shamo-backend.buildwithangga.id/api';

  // Function untuk register
  Future<UserModel> register({
    String? name,
    String? username,
    String? email,
    String? password,
  }) async {
    var url = '$baseUrl/register';
    // Header tipe untuk API
    var header = {'Content-Type': 'application/json'};
    // Encode JSON
    var body = jsonEncode({
      'name': name!,
      'username': username!,
      'email': email!,
      'password': password!,
    });

    // Response untuk melakukan request kedalam back-end (POST)
    var response = await http.post(
      Uri.parse(url),
      headers: header,
      body: body,
    );

    print(response.body);

    // Mengecheck response code
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token =
          'Bearer ${data['access_token']}'; // Auth token type yang didapat

      return user;
    } else {
      // Error apabila status code yang didapat bukan 200
      print(response.body);
      throw Exception('Registrasi Gagal');
    }
  }

  // Function untuk login
  Future<UserModel> login({
    String? email,
    String? password,
  }) async {
    var url = '$baseUrl/login';
    // Header tipe untuk API
    var header = {'Content-Type': 'application/json'};
    // Encode JSON
    var body = jsonEncode({
      'email': email!,
      'password': password!,
    });

    // Response untuk melakukan request kedalam back-end (POST)
    var response = await http.post(
      Uri.parse(url),
      headers: header,
      body: body,
    );

    print(response.body);

    // Mengecheck response code
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token =
          'Bearer ${data['access_token']}'; // Auth token type yang didapat

      return user;
    } else {
      // Error apabila status code yang didapat bukan 200
      print(response.body);
      throw Exception('Login Gagal');
    }
  }
}
