import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:linkyou_task/core/networking/api_constants.dart';
import '../models/user_model.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

  Future<void> createUser(String name, String email) async {
    try {
      await _dio.post('/users', data: {'name': name, 'email': email});
    } catch (e) {
      log('Error creating user: $e');
      throw Exception('Failed to create user');
    }
  }

  Future<List<UserModel>> fetchUsers() async {
    try {
      final response = await _dio.get('/users');
      return (response.data['data'] as List)
          .map((json) => UserModel.fromJson(json))
          .toList();
    } catch (e) {
      log('Error fetching users: $e');
      throw Exception('Failed to fetch users');
    }
  }
}
