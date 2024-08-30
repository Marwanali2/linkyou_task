import 'package:get_it/get_it.dart';
import 'package:linkyou_task/services/api_service.dart';
import 'package:linkyou_task/view_models/user_cubit.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  getIt.registerFactory<UserCubit>(
    () => UserCubit(ApiService()),
  );
}
