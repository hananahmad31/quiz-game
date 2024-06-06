import 'package:shared_preferences/shared_preferences.dart';

class Sharedpreference {
  late SharedPreferences sharedPreferencesObj;
  Future<void> storeToken(String token) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('token', token);
  }

// Retrieve the token
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString('token');
  }

// Clear the token (log out)
  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove('token');
  }
}
