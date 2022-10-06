import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ispa_app/constants/api_url.dart';

class LoginModel {
  String url = "/login";

  Future<List<dynamic>?> getDisease() async {
    var result = await http.get(Uri.parse(ApiUrl.url + url));
    return json.decode(result.body)['data'];
  }
}
