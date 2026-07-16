import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _authKey = 'is_logged_in';

  Future<bool> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_authKey) ?? false;
  }

  Future<void> login(String mobileNumber) async {
    // In a real app, send OTP here.
    await Future.delayed(const Duration(seconds: 1)); // Simulate API call
  }

  Future<bool> verifyOtp(String otp) async {
    // Dummy verification: '1234' is the valid OTP
    await Future.delayed(const Duration(seconds: 1));
    if (otp == '1234') {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_authKey, true);
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_authKey);
  }
}
