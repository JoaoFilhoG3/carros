import 'dart:convert';

import 'package:carros/main.dart';
import 'package:carros/pages/usuario.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<Usuario> login(String login, String senha) async {
    var url = 'https://carros-springboot.herokuapp.com/api/v2/login';

    Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    Map params = {
      "username": login,
      "password": senha,
    };

    var response =
        await http.post(url, body: json.encode(params), headers: headers);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    Map mapResponse = json.decode(response.body);

    String nome = mapResponse["nome"];
    String email = mapResponse["email"];

    if (response.statusCode == 200) {
      final user = Usuario.fromJson(mapResponse);
      return user;
    }
  }
}
