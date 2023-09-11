import 'package:get_it/get_it.dart';
import 'package:up_chat_app/feature/auth/presentation/cubit/auth_cubit.dart';

import '../database/cache/cache_helper.dart';

final sl = GetIt.instance;
void initServiceLoactor() {
  //cubits
sl.registerLazySingleton(() => AuthCubit());
//feaures

//external
  sl.registerLazySingleton(() => CacheHelper());
}
