import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ispa_app/constants/api_url.dart';

class AboutDiseaseModel {
  String url = "/about_diseases";

  Future<List<dynamic>?> getAboutDisease() async {
    var result = await http.get(Uri.parse(ApiUrl.url + url));
    return json.decode(result.body)['data'];
  }

  Future<List<dynamic>> getAboutDiseaseById(String id) async {
    var result = await http.get(Uri.parse("${ApiUrl.url}$url/$id"));
    return json.decode(result.body)['data'];
  }

  Future<dynamic> addAboutDisease(
    String title,
    String description,
  ) async {
    var result = await http.post(
      Uri.parse(ApiUrl.url + url),
      body: {
        'title': title,
        'description': description,
      },
    );
    return json.decode(result.body);
  }

  Future<dynamic> updateAboutDisease(
    int id,
    String title,
    String description,
  ) async {
    var result = await http.put(
      Uri.parse("${ApiUrl.url}$url/$id"),
      body: {
        'title': title,
        'description': description,
      },
    );
    return json.decode(result.body);
  }

  Future<dynamic> deleteAboutDisease(int id) async {
    var result = await http.delete(Uri.parse("${ApiUrl.url}$url/$id"));
    return json.decode(result.body);
  }
}
