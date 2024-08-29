import 'dart:developer';

import 'package:linkyou_task/core/networking/api_constants.dart';
import 'package:dio/dio.dart';

class LoginApiServices {
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

  Future<void> createUser(String name, String email) async {
    try {
      await _dio.post('/users', data: {'name': name, 'email': email});
    } catch (e) {
      log('Error creating user: $e');
      throw Exception('Failed to create user');
    }
  }
}
