import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ispa_app/constants/api_url.dart';

class PatientModel {
  String url = "/patients";

  Future<List<dynamic>?> getPatient() async {
    var result = await http.get(Uri.parse(ApiUrl.url + url));
    return json.decode(result.body)['data'];
  }

  Future<List<dynamic>> getPatientById(String id) async {
    var result = await http.get(Uri.parse("${ApiUrl.url}$url/$id"));
    return json.decode(result.body)['data'];
  }

  Future<dynamic> addPatient(
      String name,
      String gender,
      int age,
      int x1,
      int x2,
      int x3,
      int x4,
      int x5,
      int x6,
      int x7,
      int x8,
      int x9,
      int labelFormDisease) async {
    var result = await http.post(
      Uri.parse(ApiUrl.url + url),
      body: {
        'name': name,
        'gender': gender,
        'age': age,
        'x1': x1,
        'x2': x2,
        'x3': x3,
        'x4': x3,
        'x5': x3,
        'x6': x3,
        'x7': x3,
        'x8': x3,
        'x9': x3,
        'label_from_disease': labelFormDisease
      },
    );
    return json.decode(result.body);
  }

  Future<dynamic> updatePatient(
      int id,
      String name,
      String gender,
      int age,
      int x1,
      int x2,
      int x3,
      int x4,
      int x5,
      int x6,
      int x7,
      int x8,
      int x9,
      int labelFormDisease) async {
    var result = await http.put(
      Uri.parse("${ApiUrl.url}$url/$id"),
      body: {
        'name': name,
        'gender': gender,
        'age': age,
        'x1': x1,
        'x2': x2,
        'x3': x3,
        'x4': x3,
        'x5': x3,
        'x6': x3,
        'x7': x3,
        'x8': x3,
        'x9': x3,
        'label_from_disease': labelFormDisease
      },
    );
    return json.decode(result.body);
  }

  Future<dynamic> deletePatient(int id) async {
    var result = await http.delete(Uri.parse("${ApiUrl.url}$url/$id"));
    return json.decode(result.body);
  }
}
