import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ispa_app/constants/api_url.dart';

class RegisterVisitorModel {
  String url = "/visitors";

  Future<dynamic> register(
    String name,
    String gender,
    String nik,
    String password,
    String dateBirth,
  ) async {
    var result = await http.post(
      Uri.parse(ApiUrl.url + url),
      body: {
        'name': name,
        'gender': gender,
        'nik': nik,
        'password': password,
        'date_birth': dateBirth,
      },
    );
    return json.decode(result.body);
  }
}
