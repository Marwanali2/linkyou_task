import 'package:get_it/get_it.dart';
import 'package:linkyou_task/features/app/data/repos/user_repository.dart';
import 'package:linkyou_task/features/app/data/repos/user_repository_impl.dart';
import 'package:linkyou_task/features/app/data/services/api_service.dart';
import 'package:linkyou_task/features/app/presentaion/manager/user_cubit.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(ApiService()),
  );
  getIt.registerFactory<UserCubit>(
    () => UserCubit(getIt<UserRepository>()),
  );
}
