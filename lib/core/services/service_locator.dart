import 'package:get_it/get_it.dart';
import 'package:up_chat_app/feature/auth/data/repository/auth_repo.dart';
import 'package:up_chat_app/feature/auth/presentation/cubit/auth_cubit.dart';

import '../database/cache/cache_helper.dart';

final sl = GetIt.instance;
void initServiceLoactor() {
  //cubits
sl.registerLazySingleton(() => AuthCubit(sl()));
//feaures
sl.registerLazySingleton(() => AuthRepo());
//external
  sl.registerLazySingleton(() => CacheHelper());
}
