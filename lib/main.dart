import 'dart:io';

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
import 'package:cofee/rout_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
// import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'injection.container.dart' as di;
import 'injection.container.dart';

Future<void> main() async {
  // AndroidYandexMap.useAndroidViewSurface = false;
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  HttpOverrides.global = DevHttpOverrides();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) {
    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<ChoiceAdressCubit>(
              create: (context) => sl<ChoiceAdressCubit>()),
          BlocProvider<RootScreenCubit>(
            create: (context) => sl<RootScreenCubit>(),
          ),
          BlocProvider<LoginViewCubit>(
            create: (context) => sl<LoginViewCubit>(),
          ),
          BlocProvider<HomeViewCubit>(
            create: (context) => sl<HomeViewCubit>(),
          ),
          BlocProvider<CartCubit>(
            create: (context) => sl<CartCubit>(),
          ),
          BlocProvider<CartCubit>(
            create: (context) => sl<CartCubit>(),
          ),
          BlocProvider<ListViewCubit>(
            create: (context) => sl<ListViewCubit>(),
          ),
          BlocProvider<HistoryCubit>(
            create: (context) => sl<HistoryCubit>(),
          ),
          BlocProvider<EditProfileCubit>(
            create: (context) => sl<EditProfileCubit>(),
          ),
          BlocProvider<ProfilePageCubit>(
            create: (context) => sl<ProfilePageCubit>(),
          ),
          BlocProvider<SelectCartCubit>(
            create: (context) => sl<SelectCartCubit>(),
          ),
          BlocProvider<CartViewCubit>(
            create: (context) => sl<CartViewCubit>(),
          ),
          BlocProvider<OrderTypesCubit>(
            create: (context) => sl<OrderTypesCubit>(),
          )
        ],
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return MaterialApp(
              navigatorObservers: [FlutterSmartDialog.observer],
              builder: FlutterSmartDialog.init(),
              debugShowCheckedModeBanner: false,
              initialRoute: "/",
              onGenerateRoute: RouteGenerator.generatenRoute,
            );
          },
        ),
      ),
    );
  });
}

class DevHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
