import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/auth_service.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

final authStateProvider = StateNotifierProvider<AuthNotifier, bool>((ref) {
  final authService = ref.watch(authServiceProvider);
  return AuthNotifier(authService);
});

class AuthNotifier extends StateNotifier<bool> {
  final AuthService _authService;

  AuthNotifier(this._authService) : super(false) {
    _checkStatus();
  }

  Future<void> _checkStatus() async {
    state = await _authService.checkLoginStatus();
  }

  Future<void> login(String mobileNumber) async {
    await _authService.login(mobileNumber);
  }

  Future<bool> verifyOtp(String otp) async {
    final success = await _authService.verifyOtp(otp);
    if (success) {
      state = true;
    }
    return success;
  }

  Future<void> logout() async {
    await _authService.logout();
    state = false;
  }
}
