import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/app/app.dart';
import '/core/database/cache/cache_helper.dart';
import '/feature/auth/presentation/cubit/auth_cubit.dart';

import 'core/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLoactor();
  await sl<CacheHelper>().init();
  // await sl<CacheHelper>().removeData(key: AppStrings.onBoardingKey);
  // await Firebase.initializeApp();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<AuthCubit>()),
      ],
      child: const MyApp(),
    ),
  );
}
