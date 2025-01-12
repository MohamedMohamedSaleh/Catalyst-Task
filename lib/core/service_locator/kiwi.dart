import 'package:catalyst_task/features/home/logic/cubit/home_cubit.dart';
import 'package:catalyst_task/features/properties/logic/cubit/property_cubit.dart';
import 'package:catalyst_task/features/users/logic/cubit/users_cubit.dart';
import 'package:dio/dio.dart';
import 'package:kiwi/kiwi.dart';

import '../api/dio_service.dart';

void initKiwi() {
  KiwiContainer container = KiwiContainer();


  container.registerSingleton<Dio>((container) => Dio());

  container.registerSingleton<DioService>((container) => DioService(dio: container.resolve<Dio>()));

  container.registerSingleton((container) => UsersCubit(container.resolve<DioService>()));
  container.registerSingleton((container) => PropertyCubit(container.resolve<DioService>()));

  container.registerSingleton((container) => HomeCubit());



 
}