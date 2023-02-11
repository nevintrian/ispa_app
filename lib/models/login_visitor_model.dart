import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ispa_app/constants/api_url.dart';

class LoginVisitorModel {
  String url = "/login_visitor";

  Future<dynamic> login(
    String nik,
    String password,
  ) async {
    var result = await http.post(
      Uri.parse(ApiUrl.url + url),
      body: {
        'nik': nik,
        'password': password,
      },
    );
    return json.decode(result.body);
  }
}
