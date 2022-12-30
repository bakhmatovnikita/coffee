import 'dart:io';

import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/core/helpers/functions.dart';
import 'package:cofee/features/presentation/auth/login_view/view/login_view.dart';
import 'package:cofee/custom_widgets/custom_button.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scale_button/scale_button.dart';

class BodyView extends StatelessWidget {
  final Function(int) onChangeView;
  const BodyView({super.key, required this.onChangeView});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.backgroundColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          _appBar(context),
          SliverToBoxAdapter(child: SizedBox(height: 142.h)),
          SliverToBoxAdapter(
            child: Image.asset(
              'assets/images/smile.png',
              width: 80.h,
              height: 80.h,
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: CustomText(
                  title: 'Похоже, что тут еще идет разработка',
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 40.h, left: 16.h, right: 16.h),
                child: CustomText(
                  title:
                      'В скором времени мы добавим тут новый функционал, а пока можете посмотреть главную страницу и авторизацию!',
                  fontSize: 16.h,
                  fontWeight: FontWeight.w500,
                  color: ColorStyles.greyTitleColor,
                  centerTitle: true,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 24.h),
              child: CustomButton(
                title: 'Перейти к регистрации',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginView(),
                    ),
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: CustomButton(
                title: 'Перейти к главной странице',
                accent: false,
                onTap: () => onChangeView(0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar _appBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: ColorStyles.backgroundColor,
      toolbarHeight: Platform.isAndroid ? 90.h : 66.h,
      elevation: 1,
      expandedHeight: 10.h,
      // forceElevated: true,
      flexibleSpace: _topInfo(context),
    );
  }

  Padding _topInfo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 68.h, left: 15.w, right: 15.w),
      child: Row(
        children: [
          CustomText(
              title: 'Моё тело', fontWeight: FontWeight.w600, fontSize: 40),
          const Expanded(child: SizedBox()),
          ScaleButton(
            onTap: () => Functions(context).showModalNotifications(),
            bound: 0.05,
            duration: const Duration(milliseconds: 100),
            child: Container(
              width: 40.h,
              height: 40.h,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: ColorStyles.whiteColor,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                'assets/icons/bell.svg',
                width: 19.55.w,
                height: 21.08.h,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          ScaleButton(
            onTap: () => Functions(context).showModalNotifications(),
            bound: 0.05,
            duration: const Duration(milliseconds: 100),
            child: Container(
              width: 40.h,
              height: 40.h,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                // color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/images/avatar.png',
                width: 40.w,
                height: 40.h,
              ),
            ),
          )
        ],
      ),
    );
  }
}
