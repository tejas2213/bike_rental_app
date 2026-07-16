import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../screens/login_screen.dart';
import '../screens/otp_screen.dart';
import '../screens/home_screen.dart';
import '../screens/bike_details_screen.dart';
import '../screens/booking_screen.dart';
import '../screens/booking_success_screen.dart';
import '../state_management/auth_provider.dart';
import '../models/bike_model.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final isLoggingIn = state.matchedLocation == '/login' || state.matchedLocation == '/otp';
      if (!authState && !isLoggingIn) return '/login';
      if (authState && isLoggingIn) return '/';
      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/otp',
        builder: (context, state) {
          final mobile = state.extra as String? ?? '';
          return OtpScreen(mobileNumber: mobile);
        },
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/details',
        builder: (context, state) {
          final bike = state.extra as BikeModel;
          return BikeDetailsScreen(bike: bike);
        },
      ),
      GoRoute(
        path: '/booking',
        builder: (context, state) {
          final bike = state.extra as BikeModel;
          return BookingScreen(bike: bike);
        },
      ),
      GoRoute(
        path: '/booking-success',
        builder: (context, state) => const BookingSuccessScreen(),
      ),
    ],
  );
});
