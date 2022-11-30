import 'package:cofee/core/helpers/images.dart';
import 'package:cofee/features/auth/presentation/views/hello_view/hello_view.dart';
import 'package:cofee/features/auth/presentation/views/login_view/view/login_view.dart';
import 'package:cofee/features/auth/presentation/views/root_screen/controller/root_screen_cubit.dart';
import 'package:cofee/features/auth/presentation/views/root_screen/controller/root_screen_state.dart';
import 'package:cofee/features/home/presentation/views/widgets/bottom_nav_view.dart';
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
          return const BottomNavView();
        } else if (state is RootScreenEmptyState) {
          context.read<RootScreenCubit>().checkAuthorization();
        } else {
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
