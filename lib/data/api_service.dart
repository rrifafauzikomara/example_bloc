import 'dart:async';
import 'package:dio/dio.dart';
import 'package:example_bloc/data/seafood_response.dart';

class ApiService {
  final Dio _dio = Dio();

  static const String _baseUrl = 'https://www.themealdb.com/api/json/v1/1/';

  Future<SeafoodResponse> getSeafood() async {
    try {
      final response = await _dio.get("${_baseUrl}filter.php?c=Seafood");
      return SeafoodResponse.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }
}