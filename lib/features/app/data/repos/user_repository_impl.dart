import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:linkyou_task/core/errors/failure.dart';
import 'package:linkyou_task/features/app/data/repos/user_repository.dart';
import 'package:linkyou_task/features/app/data/services/api_service.dart';

import '../models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final ApiService _apiService;

  UserRepositoryImpl(this._apiService);

  @override
  Future<Either<Failure, void>> createUser(String name, String email) async {
    try {
      return right(await _apiService.createUser(name, email));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(
          ServerFailure.fromDioError(e),
        );
      } else {
        return left(
          ServerFailure(
            errorMessage: e.toString(),
          ),
        );
      }
    }
  }

  @override
 Future <Either<Failure, List<UserModel>>> fetchUsers() async {
    try{
      return right(await _apiService.fetchUsers());
    }  on Exception catch (e) {
      if (e is DioException) {
        return Left(
          ServerFailure.fromDioError(e),
        );
      } else {
        return left(
          ServerFailure(
            errorMessage: e.toString(),
          ),
        );
      }
    }
  }
}
