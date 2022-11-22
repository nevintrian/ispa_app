import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ispa_app/constants/api_url.dart';

class LoginModel {
  String url = "/login";

  Future<dynamic> login(
    String username,
    String password,
  ) async {
    var result = await http.post(
      Uri.parse(ApiUrl.url + url),
      body: {
        'username': username,
        'password': password,
      },
    );
    return json.decode(result.body);
  }
}
