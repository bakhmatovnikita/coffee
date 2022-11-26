import 'package:cofee/core/services/auth_config/auth_config.dart';
import 'package:cofee/features/auth/presentation/data/datasorces/local_datasource/local_datasource.dart';
import 'package:cofee/features/auth/presentation/data/datasorces/local_datasource/local_datasource_impl.dart';
import 'package:cofee/features/auth/presentation/data/datasorces/remote_datasource/remote_datasource.dart';
import 'package:cofee/features/auth/presentation/data/datasorces/remote_datasource/remote_datasource_impl.dart';
import 'package:cofee/features/auth/presentation/data/repository/coffee_repository_implements.dart';
import 'package:cofee/features/auth/presentation/domain/repository/coffe_repository.dart';
import 'package:cofee/features/auth/presentation/domain/usecase/create_user.dart';
import 'package:cofee/features/auth/presentation/domain/usecase/get_organization.dart';
import 'package:cofee/features/auth/presentation/domain/usecase/get_token.dart';
import 'package:cofee/features/auth/presentation/views/choice_adress/controller/choice_adress_cubit.dart';
import 'package:cofee/features/auth/presentation/views/login_view/controller/login_view_cubit.dart';
import 'package:cofee/features/auth/presentation/views/root_screen/controller/root_screen_cubit.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.asNewInstance();

Future<void> init() async {
  //Cubit
  sl.registerFactory(
    () => ChoiceAdressCubit(
      getOrganization: sl(),
      createUser: sl(),
      getToken: sl(),
    ),
  );
  sl.registerFactory(() => RootScreenCubit(
        localDatasource: sl(),
      ));
  sl.registerFactory(() => LoginViewCubit(getToken: sl()));
  //Usecase
  sl.registerLazySingleton(() => CreateUser(sl()));
  sl.registerLazySingleton(() => GetOrganization(sl()));
  sl.registerLazySingleton(() => GetToken(sl()));
  //Repository
  sl.registerLazySingleton<CoffeeRepository>(
      () => CoffeeRepositoryImpl(sl(), sl()));
  //Datasource
  sl.registerLazySingleton<RemoteDatasource>(() => RemoteDatasourceImplement());
  sl.registerLazySingleton<LocalDatasource>(
      () => LocalDatasourceImplement(sl(), sl()));
  //UserData
  sl.registerLazySingleton<AuthConfig>(() => AuthConfig());
  const sharedPreferences = FlutterSecureStorage();
  sl.registerLazySingleton(() => sharedPreferences);
}
