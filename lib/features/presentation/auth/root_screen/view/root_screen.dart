import 'package:cofee/core/helpers/images.dart';
import 'package:cofee/features/presentation/auth/hello_view/hello_view.dart';
import 'package:cofee/features/presentation/auth/login_view/controller/login_view_cubit.dart';
import 'package:cofee/features/presentation/auth/root_screen/controller/root_screen_cubit.dart';
import 'package:cofee/features/presentation/auth/root_screen/controller/root_screen_state.dart';
import 'package:cofee/features/presentation/home/widgets/bottom_nav_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootScreenCubit, RootScreenState>(
      builder: (context, state) {
        if (state is RootScreenIsAuthorized) {
          context.read<LoginViewCubit>().saveToken('access_token');
          const Duration(milliseconds: 600);
          return BottomNavView();
        } else if (state is RootScreenEmptyState) {
          context.read<LoginViewCubit>().saveToken('access_token');
          const Duration(milliseconds: 600);
          context.read<RootScreenCubit>().checkAuthorization();
        } else {
          context.read<LoginViewCubit>().saveToken('access_token');
          const Duration(milliseconds: 600);
          return const HelloView();
        }
        return const Scaffold(
          body: Center(
            child: Image(
              image: AssetImage(Img.Splash),
            ),
          ),
        );
      },
    );
  }
}
