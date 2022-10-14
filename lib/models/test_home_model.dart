import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ispa_app/constants/api_url.dart';

class TestHomeModel {
  String url = "/test";

  Future<dynamic> addTest(
      String name,
      String gender,
      String age,
      String x1,
      String x2,
      String x3,
      String x4,
      String x5,
      String x6,
      String x7,
      String x8,
      String x9) async {
    var result = await http.post(
      Uri.parse(ApiUrl.url + url),
      body: {
        'name': name,
        'gender': gender,
        'age': age,
        'x1': x1,
        'x2': x2,
        'x3': x3,
        'x4': x4,
        'x5': x5,
        'x6': x6,
        'x7': x7,
        'x8': x8,
        'x9': x9,
      },
    );
    return json.decode(result.body);
  }
}
