import 'package:cofee/rout_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) {
    runApp(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: "/",
            onGenerateRoute: RouteGenerator.generatenRoute,
          );
        },
      ),
    );
  });
}
