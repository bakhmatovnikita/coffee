import 'package:cofee/features/auth/presentation/views/choice_adress/controller/choice_adress_cubit.dart';
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
              create: (context) => sl<ChoiceAdressCubit>())
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
