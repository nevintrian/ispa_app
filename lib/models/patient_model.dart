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
      String ageYear,
      String ageMonth,
      String dateBirth,
      String x1,
      String x2,
      String x3,
      String x4,
      String x5,
      String x6,
      String x7,
      String x8,
      String x9,
      String labelFormDisease) async {
    var result = await http.post(
      Uri.parse(ApiUrl.url + url),
      body: {
        'name': name,
        'gender': gender,
        // 'age_year': ageYear,
        // 'age_month': ageMonth,
        'date_birth': dateBirth,
        'x1': x1,
        'x2': x2,
        'x3': x3,
        'x4': x4,
        'x5': x5,
        'x6': x6,
        'x7': x7,
        'x8': x8,
        'x9': x9,
        'label_from_disease_id': labelFormDisease
      },
    );
    return json.decode(result.body);
  }

  Future<dynamic> updatePatient(
      int id,
      String name,
      String gender,
      String ageYear,
      String ageMonth,
      String dateBirth,
      String x1,
      String x2,
      String x3,
      String x4,
      String x5,
      String x6,
      String x7,
      String x8,
      String x9,
      String labelFormDisease) async {
    var result = await http.put(
      Uri.parse("${ApiUrl.url}$url/$id"),
      body: {
        'name': name,
        'gender': gender,
        // 'age_year': ageYear,
        // 'age_month': ageMonth,
        'date_birth': dateBirth,
        'x1': x1,
        'x2': x2,
        'x3': x3,
        'x4': x4,
        'x5': x5,
        'x6': x6,
        'x7': x7,
        'x8': x8,
        'x9': x9,
        'label_from_disease_id': labelFormDisease
      },
    );
    return json.decode(result.body);
  }

  Future<dynamic> deletePatient(int id) async {
    var result = await http.delete(Uri.parse("${ApiUrl.url}$url/$id"));
    return json.decode(result.body);
  }
}
