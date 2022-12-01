import 'package:cofee/features/auth/presentation/views/choice_adress/controller/choice_adress_cubit.dart';
import 'package:cofee/features/auth/presentation/views/login_view/controller/login_view_cubit.dart';
import 'package:cofee/features/auth/presentation/views/root_screen/controller/root_screen_cubit.dart';
import 'package:cofee/features/home/presentation/views/controller/bottom_nav_nar_controller/bottom_nav_bar_cubit.dart';
import 'package:cofee/features/home/presentation/views/controller/home_view_cubit.dart';
import 'package:cofee/rout_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'injection.container.dart' as di;
import 'injection.container.dart';

void main() async {
  await di.init();
  WidgetsFlutterBinding.ensureInitialized();
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
          )
        ],
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return const MaterialApp(
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
