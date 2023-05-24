import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/core/helpers/images.dart';
import 'package:cofee/core/helpers/input_formatter.dart';
import 'package:cofee/custom_widgets/custom_button.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:cofee/features/presentation/profile/%20personal_area/controller/profile_page_cubit.dart';
import 'package:cofee/features/presentation/profile/edit_profile/controller/edit_profile_cubit.dart';
import 'package:cofee/features/presentation/profile/edit_profile/controller/edit_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../custom_widgets/push_error.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController number = TextEditingController();
  @override
  void initState() {
    name.addListener(() {});
    email.addListener(() {});
    number.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 25.w,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SvgPicture.asset(
                          SvgImg.goBackk,
                          height: 17.82.h,
                          width: 10.26.w,
                          color: ColorStyles.accentColor,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: CustomText(
                      title: 'Редактировать',
                      color: ColorStyles.blackColor,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: 16.w,
                        left: 31.w,
                      ),
                      child: CustomText(
                        title: 'Отмена',
                        color: ColorStyles.accentColor,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: CustomText(
                      title: 'Имя и Фамилия',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    width: double.infinity,
                    height: 48.h,
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: ColorStyles.whiteColor,
                    ),
                    child: TextField(
                      controller: name,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 17.h,
                        color: ColorStyles.blackColor,
                      ),
                      cursorColor: ColorStyles.accentColor,
                      // inputFormatters: [CustomInputFormatter()],
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Имя Фамилия',
                        hintStyle: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 17.h,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: CustomText(
                      title: 'Номер телефона',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    width: double.infinity,
                    height: 48.h,
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: ColorStyles.whiteColor,
                    ),
                    child: TextField(
                      controller: number,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 17.h,
                        color: ColorStyles.blackColor,
                      ),
                      cursorColor: ColorStyles.accentColor,
                      inputFormatters: [CustomInputFormatter()],
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration.collapsed(
                        hintText: '+7 (999) 999-99-99',
                        hintStyle: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 17.h,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: CustomText(
                      title: 'E-mail',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    width: double.infinity,
                    height: 48.h,
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: ColorStyles.whiteColor,
                    ),
                    child: TextField(
                      controller: email,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 17.h,
                        color: ColorStyles.blackColor,
                      ),
                      cursorColor: ColorStyles.accentColor,
                      // inputFormatters: [CustomInputFormatter()],
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration.collapsed(
                        hintText: 'mail@yandex.ru',
                        hintStyle: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 17.h,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: CustomText(
                      title: 'День рождения',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    width: double.infinity,
                    height: 48.h,
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: ColorStyles.whiteColor,
                    ),
                    child: TextField(
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 17.h,
                        color: ColorStyles.blackColor,
                      ),
                      cursorColor: ColorStyles.accentColor,
                      // inputFormatters: [CustomInputFormatter()],
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Дата рождения',
                        hintStyle: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 17.h,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.h),
              child: CustomButton(
                title: 'Сохранить изменения',
                onTap: () async {
                  if (number.text.length < 18 || number.text.isEmpty) {
                    SmartDialog.show(
                      animationType: SmartAnimationType.fade,
                      maskColor: Colors.transparent,
                      displayTime: const Duration(seconds: 3),
                      clickMaskDismiss: false,
                      usePenetrate: true,
                      builder: (context) => const SafeArea(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: PushError(
                            title: 'Введен неверный номер',
                          ),
                        ),
                      ),
                    );
                  } else {
                    context
                        .read<EditProfileCubit>()
                        .createCustomer(
                            'loyalty/iiko/customer/create_or_update',
                            number.text,
                            email.text,
                            name.text)
                        .then(
                          (value) => context
                              .read<ProfilePageCubit>()
                              .fetchUserInfo('organizations'),
                        );
                    Navigator.pop(context);
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
