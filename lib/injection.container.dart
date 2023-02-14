import 'package:cofee/core/services/auth_config/auth_config.dart';
import 'package:cofee/core/services/auth_config/time_accept.dart';
import 'package:cofee/features/data/datasorces/local_datasource/local_datasource.dart';
import 'package:cofee/features/data/datasorces/local_datasource/local_datasource_impl.dart';
import 'package:cofee/features/data/datasorces/remote_datasource/remote_datasource.dart';
import 'package:cofee/features/data/datasorces/remote_datasource/remote_datasource_impl.dart';
import 'package:cofee/features/data/repository/coffee_repository_implements.dart';
import 'package:cofee/features/domain/repository/coffe_repository.dart';
import 'package:cofee/features/domain/usecase/create_order.dart';
import 'package:cofee/features/domain/usecase/create_user.dart';
import 'package:cofee/features/domain/usecase/get_cart.dart';
import 'package:cofee/features/domain/usecase/get_history.dart';
import 'package:cofee/features/domain/usecase/get_order_types.dart';
import 'package:cofee/features/domain/usecase/get_organization.dart';
import 'package:cofee/features/domain/usecase/get_products.dart';
import 'package:cofee/features/domain/usecase/get_terminal_group.dart';
import 'package:cofee/features/domain/usecase/get_token.dart';
import 'package:cofee/features/presentation/auth/choice_adress/controller/choice_adress_cubit.dart';
import 'package:cofee/features/presentation/auth/login_view/controller/login_view_cubit.dart';
import 'package:cofee/features/presentation/auth/root_screen/controller/root_screen_cubit.dart';
import 'package:cofee/features/presentation/cart/controller/cart_cubit.dart';
import 'package:cofee/features/presentation/cart/widgets/checkout/widgets/modal_menu_in_cart/controller/list_view_modal_menu_cubit.dart';
import 'package:cofee/features/presentation/cart/widgets/checkout/widgets/selected_cart/controller/select_cart_cubit.dart';
import 'package:cofee/features/presentation/cart/widgets/checkout/widgets/way_of_obtaining/controller/way_of_obtaining_cubit.dart';
import 'package:cofee/features/presentation/home/controller/bottom_nav_nar_controller/cart_cubit.dart';
import 'package:cofee/features/presentation/home/controller/home_view_cubit.dart';
import 'package:cofee/features/presentation/profile/%20personal_area/controller/profile_page_cubit.dart';
import 'package:cofee/features/presentation/profile/edit_profile/controller/edit_profile_cubit.dart';
import 'package:cofee/features/presentation/profile/history/controller/history_cubit.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.asNewInstance();

Future<void> init() async {
  //Cubit
  sl.registerFactory(
    () => ChoiceAdressCubit(
      getOrganization: sl(),
      createUser: sl(),
      getToken: sl(),
      getTerminalGroup: sl(),
    ),
  );
  sl.registerFactory(() => RootScreenCubit(
        localDatasource: sl(),
      ));
  sl.registerFactory(() => HomeViewCubit(getProducts: sl()));
  sl.registerFactory(() => LoginViewCubit(getToken: sl()));
  sl.registerFactory(() => CartCubit(sl(), sl()));
  sl.registerFactory(() => ListViewCubit());
  sl.registerFactory(() => HistoryCubit(
        getHistory: sl(),
        localDatasource: sl(),
      ));
  sl.registerFactory(
    () => EditProfileCubit(createUser: sl(), localDatasource: sl()),
  );
  sl.registerFactory(
    () => ProfilePageCubit(
      getOrganization: sl(),
      localDatasource: sl(),
    ),
  );
  sl.registerFactory(
      () => SelectCartCubit(getCart: sl(), localDatasource: sl()));
  sl.registerFactory(() => CartViewCubit(localDatasource: sl()));
  sl.registerFactory(() => OrderTypesCubit(getOrderTypes: sl(), localDatasource: sl()));
  //Usecase
  sl.registerLazySingleton(() => CreateUser(sl()));
  sl.registerLazySingleton(() => GetOrganization(sl()));
  sl.registerLazySingleton(() => GetToken(sl()));
  sl.registerLazySingleton(() => GetProducts(sl()));
  sl.registerLazySingleton(() => GetTerminalGroup(sl()));
  sl.registerLazySingleton(() => CreateOrder(sl()));
  sl.registerLazySingleton(() => GetHistory(sl()));
  sl.registerLazySingleton(() => GetCart(coffeeRepository: sl()));
  sl.registerLazySingleton(() => GetOrderTypes(sl()));
  //Repository
  sl.registerLazySingleton<CoffeeRepository>(
      () => CoffeeRepositoryImpl(sl(), sl()));
  //Datasource
  sl.registerLazySingleton<RemoteDatasource>(() => RemoteDatasourceImplement());
  sl.registerLazySingleton<LocalDatasource>(
      () => LocalDatasourceImplement(sl(), sl(), sl()));
  //UserData
  sl.registerLazySingleton<AuthConfig>(() => AuthConfig());
  sl.registerLazySingleton<AcceptTime>(() => AcceptTime());
  const flutterSecureStorage = FlutterSecureStorage();
  sl.registerLazySingleton(() => flutterSecureStorage);
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
