import 'package:shared_preferences/shared_preferences.dart';

class SessionModel {
  void setSession(String keys, String values) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(keys, values);
  }

  Future<String?> getSession(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(key);
  }

  Future<bool> removeSession() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.remove('id');
  }
}
