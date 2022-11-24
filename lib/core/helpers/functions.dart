import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/features/auth/presentation/views/login_view/widgets/login_bottomscheet.dart';
import 'package:cofee/features/widgets/custom_button.dart';
import 'package:cofee/features/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Functions {
  final BuildContext context;

  Functions(this.context);
  void showModalNotifications() {
    showMaterialModalBottomSheet(
      animationCurve: Curves.easeInOutQuint,
      elevation: 12,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.2),
      duration: const Duration(milliseconds: 600),
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          height: 600.h,
          decoration: BoxDecoration(
            color: ColorStyles.whiteColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.r),
              topLeft: Radius.circular(30.r),
            ),
          ),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 100.h)),
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
                    padding: EdgeInsets.only(
                      top: 40.h,
                      left: 16.h,
                      right: 16.h,
                    ),
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
                      Navigator.of(context).pushNamed('/HelloView');
                    },
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: CustomButton(
                    onTap: () => Navigator.pop(context),
                    title: 'Вернуться назад',
                    accent: false,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showLoginBottomsheet() {
    showMaterialModalBottomSheet(
      animationCurve: Curves.easeInOutQuint,
      elevation: 12,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.2),
      duration: const Duration(milliseconds: 600),
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return const LoginBottomsheet();
      },
    );
  }
}
