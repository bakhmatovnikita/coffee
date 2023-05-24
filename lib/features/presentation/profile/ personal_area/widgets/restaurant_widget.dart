import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/core/helpers/functions.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestaurantWidget extends StatelessWidget {
  final String title;
  final String address;
  final String id;
  const RestaurantWidget({
    Key? key,
    required this.size,
    required this.title,
    required this.address,
    required this.id,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 16.h,
        right: 16.w,
        left: 16.w,
      ),
      padding: const EdgeInsets.all(16),
      height: 146.h,
      width: size.width.w,
      decoration: BoxDecoration(
        color: ColorStyles.whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomText(
                title: 'Адрес ресторана',
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Functions(context).showRestaurantBottomSheet(id);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 95.w,
                  height: 32.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(46.r),
                    border:
                        Border.all(color: ColorStyles.accentColor, width: 2.w),
                  ),
                  child: CustomText(
                    title: 'Изменить',
                    color: ColorStyles.accentColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              Container(
                height: 10.h,
                width: 10.w,
                margin: EdgeInsets.only(right: 7.w),
                decoration: const BoxDecoration(
                  color: ColorStyles.accentColor,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: 7.w,
              ),
              CustomText(
                title: title,
                color: ColorStyles.accentColor,
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          const Spacer(),
          CustomText(
            title: address,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: ColorStyles.greyTitleColor,
          ),
        ],
      ),
    );
  }
}
