import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/core/helpers/functions.dart';
import 'package:cofee/core/helpers/images.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:cofee/custom_widgets/switch_button.dart';
import 'package:cofee/features/presentation/profile/%20personal_area/controller/profile_page_cubit.dart';
import 'package:cofee/features/presentation/profile/%20personal_area/controller/profile_page_state.dart';
import 'package:cofee/features/presentation/profile/%20personal_area/widgets/restaurant_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scale_button/scale_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Map<String, dynamic>> settings = [
    {
      "icon": SvgImg.clock,
      "title": "История заказов",
    },
    {
      "icon": SvgImg.slider,
      "title": "Настройки фильтров",
    },
    {
      "icon": SvgImg.forkKnife,
      "title": "Автозаказ",
    },
    {
      "icon": SvgImg.creditCard,
      "title": "Способы оплаты",
    },
    {
      "icon": SvgImg.info,
      "title": "О нас",
    },
  ];

  bool switchValue = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<ProfilePageCubit, ProfilePageState>(
      builder: (context, state) {
        if (state is ProfilePageEmptyState) {
          context.read<ProfilePageCubit>().fetchOrganization('organizations');
        } else if (state is ProfilePageLoadedState) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Padding(
                        padding: EdgeInsets.only(left: 25.w, top: 5),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: SvgPicture.asset(
                            SvgImg.cross,
                            height: 13.64.h,
                            width: 13.64.w,
                            color: ColorStyles.accentColor,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: CustomText(
                        title: 'Личный кабинет',
                        color: ColorStyles.blackColor,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 16.h,
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 80.h,
                            width: 80.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage(
                                  Img.avatar,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                title: "Имя Фамилия",
                                color: ColorStyles.blackColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              CustomText(
                                title: "mail@yandex.ru",
                                color: ColorStyles.greyTitleColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              CustomText(
                                title: "+7 654 675-78-09",
                                color: ColorStyles.greyTitleColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    ScaleButton(
                      onTap: () =>
                          Functions(context).showEditProfilePageBottomSheet(),
                      bound: 0.02,
                      duration: const Duration(milliseconds: 100),
                      child: Container(
                        height: 48.h,
                        margin: EdgeInsets.symmetric(horizontal: 16.w),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(SvgImg.edit),
                            SizedBox(
                              width: 8.w,
                            ),
                            CustomText(
                              title: "Редактировать",
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: ColorStyles.blackColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 16.h,
                      ),
                      child: Image.asset(Img.bonusCard),
                    ),
                    RestaurantWidget(
                      size: size,
                      title: state.organizationsEntiti.organizations[0].name,
                      address: state.organizationsEntiti.organizations[0]
                          .restaurantAddress,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      margin: EdgeInsets.only(
                        bottom: 16.h,
                        right: 16.w,
                        left: 16.w,
                      ),
                      height: 52.h,
                      width: size.width.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ColorStyles.whiteColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          CustomText(
                            title: 'Push-Уведомления',
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w500,
                            color: ColorStyles.blackColor,
                          ),
                          const Spacer(),
                          SwitchBtn(
                            onChange: (value) {
                              setState(() {
                                switchValue = value;
                              });
                            },
                            value: switchValue,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 16.h,
                        right: 16.w,
                        left: 16.w,
                      ),
                      width: size.width.w,
                      decoration: BoxDecoration(
                        color: ColorStyles.whiteColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: List.generate(
                          settings.length,
                          (index) => GestureDetector(
                            onTap: () {
                              Functions(context).showUserHistoryBottomSheet();
                            },
                            child: Container(
                              color: Colors.transparent,
                              padding: index == 4
                                  ? EdgeInsets.only(
                                      bottom: 16.h,
                                      top: 16.h,
                                      right: 16.w,
                                      left: 16.w)
                                  : EdgeInsets.only(
                                      top: 16.h, right: 16.w, left: 16.w),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: index == 4
                                        ? EdgeInsets.only(bottom: 0.h)
                                        : EdgeInsets.only(bottom: 10.h),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: 15.w),
                                          child: SvgPicture.asset(
                                            settings[index]["icon"],
                                          ),
                                        ),
                                        CustomText(
                                          title: settings[index]["title"],
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.w500,
                                          color: ColorStyles.blackColor,
                                        ),
                                        const Spacer(),
                                        SvgPicture.asset(SvgImg.goto),
                                      ],
                                    ),
                                  ),
                                  index == 4
                                      ? Container()
                                      : Container(
                                          height: 1.h,
                                          width: size.width,
                                          color: Colors.grey[300],
                                        ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else if (state is ProfilePageErrorState) {
          return Scaffold(
            body: Center(child: CustomText(title: 'Error!')),
          );
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              color: Colors.orange,
            ),
          ),
        );
      },
    );
  }
}
