import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/core/helpers/images.dart';
import 'package:cofee/custom_widgets/custom_button.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:cofee/features/presentation/auth/login_view/controller/login_view_cubit.dart';
import 'package:cofee/features/presentation/auth/login_view/controller/login_view_state.dart';
import 'package:cofee/features/presentation/cart/controller/cart_cubit.dart';
import 'package:cofee/features/presentation/cart/controller/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/functions.dart';
import '../../auth/root_screen/controller/root_screen_cubit.dart';
import '../../auth/root_screen/controller/root_screen_state.dart';

class LoginOrNot extends StatelessWidget {
  const LoginOrNot({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartViewCubit, CartViewState>(
      builder: (context, state) {
        if (state is CartViewEmptyState) {
          context.read<CartViewCubit>().checkAuthorization();
        } else if (state is CartViewHaveNumberState) {
          return SliverToBoxAdapter(
            child: Column(
              children: [
                Image.asset(
                  Img.cart,
                  width: 80.h,
                  height: 80.h,
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 16.h),
                    child: CustomText(
                      title: 'Корзина пустая',
                      fontSize: 16,
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 40.h, left: 16.h, right: 16.h),
                    child: CustomText(
                      title:
                          'Ваша корзину пуста, откройте Меню и выберите блюдо, которое \nвам по душе.',
                      fontSize: 16.h,
                      fontWeight: FontWeight.w500,
                      color: ColorStyles.greyTitleColor,
                      centerTitle: true,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24.h),
                  child: CustomButton(
                    title: 'Выбрать блюдо',
                    onTap: () {
                      Functions(context).showMenuBottomsheet();
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return SliverToBoxAdapter(
          child: Column(
            children: [
              Image.asset(
                Img.thinking,
                width: 80.h,
                height: 80.h,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 16.h),
                  child: CustomText(
                    title: 'Похоже вы не зарегестрированы',
                    fontSize: 16,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 40.h, left: 16.h, right: 16.h),
                  child: CustomText(
                    title:
                        'Зарегестрируйтесь, чтобы получить доступ к корзине и другим полезным функциям',
                    fontSize: 16.h,
                    fontWeight: FontWeight.w500,
                    color: ColorStyles.greyTitleColor,
                    centerTitle: true,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 24.h),
                child: CustomButton(
                  title: 'Зарегестрироваться',
                  onTap: () {
                    Functions(context).showLoginBottomsheet();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: GestureDetector(
                  onTap: () {
                    Functions(context).showLoginBottomsheet();
                  },
                  child: CustomText(
                    title: 'Войти',
                    color: ColorStyles.accentColor,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
