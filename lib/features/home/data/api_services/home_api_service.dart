import 'dart:developer';

import 'package:linkyou_task/core/networking/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:linkyou_task/features/home/data/models/user_model.dart';
class HomeApiService{
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
   Future<List<UserModel>> fetchUsers(int page) async {
    try {
      final response = await _dio.get('/users', queryParameters: {'page': page});
      final List<UserModel> users = (response.data['data'] as List)
          .map((json) => UserModel.fromJson(json))
          .toList();
      return users;
    } catch (e) {
      log('Error fetching users: $e');
      throw Exception('Failed to fetch users');
    }
  }
}