import 'package:cofee/features/presentation/auth/choice_adress/controller/choice_adress_cubit.dart';
import 'package:cofee/features/presentation/auth/login_view/controller/login_view_cubit.dart';
import 'package:cofee/features/presentation/auth/root_screen/controller/root_screen_cubit.dart';
import 'package:cofee/features/presentation/cart/controller/cart_cubit.dart';
import 'package:cofee/features/presentation/home/controller/bottom_nav_nar_controller/bottom_nav_bar_cubit.dart';
import 'package:cofee/features/presentation/home/controller/home_view_cubit.dart';
import 'package:cofee/rout_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'injection.container.dart' as di;
import 'injection.container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
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
          BlocProvider<BottomNavigationBarCubit>(
            create: (context) => sl<BottomNavigationBarCubit>(),
          ),
          BlocProvider<CartCubit>(
            create: (context) => sl<CartCubit>(),
          ),
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
