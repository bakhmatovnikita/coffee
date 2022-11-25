import 'package:cofee/features/auth/presentation/data/datasorces/remote_datasource/remote_datasource.dart';
import 'package:cofee/features/auth/presentation/data/datasorces/remote_datasource/remote_datasource_impl.dart';
import 'package:cofee/features/auth/presentation/data/repository/coffee_repository_implements.dart';
import 'package:cofee/features/auth/presentation/domain/repository/coffe_repository.dart';
import 'package:cofee/features/auth/presentation/domain/usecase/create_user.dart';
import 'package:cofee/features/auth/presentation/domain/usecase/get_organization.dart';
import 'package:cofee/features/auth/presentation/domain/usecase/get_token.dart';
import 'package:cofee/features/auth/presentation/views/choice_adress/controller/choice_adress_cubit.dart';
import 'package:cofee/features/home/presentation/views/controller/home_page_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.asNewInstance();

Future<void> init() async {
  //Cubit
  sl.registerFactory(
    () => ChoiceAdressCubit(
      getOrganization: sl(),
      createUser: sl(),
    ),
  );
  sl.registerFactory(() => HomePageCubit(getToken: sl()));
  //Usecase
  sl.registerLazySingleton(() => CreateUser(sl()));
  sl.registerLazySingleton(() => GetOrganization(sl()));
  sl.registerLazySingleton(() => GetToken(sl()));
  //Repository
  sl.registerLazySingleton<CoffeeRepository>(() => CoffeeRepositoryImpl(sl()));
  //Datasource
  sl.registerLazySingleton<RemoteDatasource>(() => RemoteDatasourceImplement());
}
