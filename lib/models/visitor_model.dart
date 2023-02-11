import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ispa_app/constants/api_url.dart';

class VisitorModel {
  String url = "/visitors";
  String urlNik = "/visitor_nik";

  Future<List<dynamic>?> getVisitor() async {
    var result = await http.get(Uri.parse(ApiUrl.url + url));
    return json.decode(result.body)['data'];
  }

  Future<List<dynamic>> getVisitorById(String id) async {
    var result = await http.get(Uri.parse("${ApiUrl.url}$url/$id"));
    return json.decode(result.body)['data'];
  }

  Future<List<dynamic>> getVisitorByNik(String nik) async {
    var result = await http.get(Uri.parse("${ApiUrl.url}$urlNik/$nik"));
    return json.decode(result.body)['data'];
  }

  Future<dynamic> updateVisitor(String nik, String name, String gender,
      String dateBirth, String password, String status) async {
    var result = await http.put(
      Uri.parse("${ApiUrl.url}$url/1"),
      body: {
        'name': name,
        'nik': nik,
        'gender': gender,
        'date_birth': dateBirth,
        'password': password,
        'status': status,
      },
    );
    return json.decode(result.body);
  }
}
