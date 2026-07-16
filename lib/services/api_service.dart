import 'package:dio/dio.dart';
import '../models/bike_model.dart';

class ApiService {
  final Dio _dio = Dio();
  static const String baseUrl = 'https://fakestoreapi.com';

  Future<List<BikeModel>> fetchBikes() async {
    try {
      final response = await _dio.get('$baseUrl/products');
      if (response.statusCode == 200) {
        final List data = response.data;
        return data.map((json) => BikeModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
