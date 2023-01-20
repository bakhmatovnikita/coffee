import 'package:cofee/core/helpers/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../constants/colors/color_styles.dart';
import '../../../../../../core/helpers/images.dart';
import '../../../../../../custom_widgets/custom_text.dart';

class EditOrderBottomSheet extends StatefulWidget {
  const EditOrderBottomSheet({super.key});

  @override
  State<EditOrderBottomSheet> createState() => _EditOrderBottomSheetState();
}

class _EditOrderBottomSheetState extends State<EditOrderBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                  title: 'Изменение заказа',
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
                    left: 16.w,
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
          padding: EdgeInsets.only(top: 24.h, left: 37.w),
          child: CustomText(
            title: 'Дата и время заказа',
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.w, top: 16.h, right: 16.w),
          child: Row(
            children: [
              CustomText(
                title: 'Вторник 8:23',
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Functions(context).showTimeAcceptBottomsheet();
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      SvgImg.edit,
                      color: ColorStyles.accentColor,
                    ),
                    CustomText(
                      title: 'Изменить время',
                      color: ColorStyles.accentColor,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 24.h, left: 16.w, bottom: 16.h),
          child: CustomText(
            title: 'Способ получения',
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 40,
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
              height: 40.h,
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: ColorStyles.whiteColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: CustomText(
                title: 'Доставка',
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 24.h, bottom: 24.h),
          child: Divider(
            color: Colors.grey,
            height: 1.h,
            indent: 16.w,
            endIndent: 16.w,
          ),
        ),
      ],
    );
  }
}
