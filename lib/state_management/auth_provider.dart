import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/auth_service.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

final authStateProvider = NotifierProvider<AuthNotifier, bool>(AuthNotifier.new);

class AuthNotifier extends Notifier<bool> {
  @override
  bool build() {
    _checkStatus();
    return false; // Initial state
  }

  Future<void> _checkStatus() async {
    final authService = ref.read(authServiceProvider);
    state = await authService.checkLoginStatus();
  }

  Future<void> login(String mobileNumber) async {
    final authService = ref.read(authServiceProvider);
    await authService.login(mobileNumber);
  }

  Future<bool> verifyOtp(String otp) async {
    final authService = ref.read(authServiceProvider);
    final success = await authService.verifyOtp(otp);
    if (success) {
      state = true;
    }
    return success;
  }

  Future<void> logout() async {
    final authService = ref.read(authServiceProvider);
    await authService.logout();
    state = false;
  }
}
