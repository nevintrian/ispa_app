import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ispa_app/constants/api_url.dart';

class DiseaseModel {
  String url = "/diseases";

  Future<List<dynamic>?> getDisease() async {
    var result = await http.get(Uri.parse(ApiUrl.url + url));
    return json.decode(result.body)['data'];
  }

  Future<dynamic> getDiseaseById(String id) async {
    var result = await http.get(Uri.parse("${ApiUrl.url}$url/$id"));
    return json.decode(result.body)['data'];
  }

  Future<dynamic> addDisease(
      String name, String definition, String cause, String therapy) async {
    var result = await http.post(
      Uri.parse(ApiUrl.url + url),
      body: {
        'name': name,
        'definition': definition,
        'cause': cause,
        'therapy': therapy,
      },
    );
    return json.decode(result.body);
  }

  Future<dynamic> updateDisease(int id, String name, String definition,
      String cause, String therapy) async {
    var result = await http.put(
      Uri.parse("${ApiUrl.url}$url/$id"),
      body: {
        'name': name,
        'definition': definition,
        'cause': cause,
        'therapy': therapy
      },
    );
    return json.decode(result.body);
  }

  Future<dynamic> deleteDisease(int id) async {
    var result = await http.delete(Uri.parse("${ApiUrl.url}$url/$id"));
    return json.decode(result.body);
  }
}
