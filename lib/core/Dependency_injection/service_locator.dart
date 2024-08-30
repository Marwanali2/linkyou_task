import 'package:get_it/get_it.dart';
import 'package:linkyou_task/features/home/presentation/views/manager/user_cubit.dart';
import 'package:linkyou_task/features/Auth/data/api_services/login_api_services.dart';
import 'package:linkyou_task/features/home/data/api_services/home_api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // getIt.registerFactory<UserCubit>(
  //   () => UserCubit(HomeApiService(), LoginApiServices()),
  // );
}
