import 'package:cofee/features/auth/presentation/data/datasorces/remote_datasource/remote_datasource.dart';
import 'package:cofee/features/auth/presentation/data/datasorces/remote_datasource/remote_datasource_impl.dart';
import 'package:cofee/features/auth/presentation/data/repository/coffee_repository_implements.dart';
import 'package:cofee/features/auth/presentation/domain/repository/coffe_repository.dart';
import 'package:cofee/features/auth/presentation/domain/usecase/create_user.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.asNewInstance();

Future<void> init() async {
  //Cubit
  
  //Usecase
  sl.registerLazySingleton(() => CreateUser(sl()));
  //Repository
  sl.registerLazySingleton<CoffeeRepository>(() => CoffeeRepositoryImpl(sl()));
  //Datasource
  sl.registerLazySingleton<RemoteDatasource>(() => RemoteDatasourceImplement());
}
