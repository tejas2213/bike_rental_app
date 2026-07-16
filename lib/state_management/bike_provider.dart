import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/bike_model.dart';
import '../services/api_service.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

final bikesProvider = FutureProvider<List<BikeModel>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return await apiService.fetchBikes();
});
