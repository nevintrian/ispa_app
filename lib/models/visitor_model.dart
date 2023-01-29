import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ispa_app/constants/api_url.dart';

class VisitorModel {
  String url = "/visitors";

  Future<List<dynamic>?> getVisitor() async {
    var result = await http.get(Uri.parse(ApiUrl.url + url));
    return json.decode(result.body)['data'];
  }

  Future<List<dynamic>> getVisitorById(String id) async {
    var result = await http.get(Uri.parse("${ApiUrl.url}$url/$id"));
    return json.decode(result.body)['data'];
  }
}
