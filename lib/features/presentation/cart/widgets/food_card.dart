import 'package:cached_network_image/cached_network_image.dart';
import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/core/helpers/images.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FoodCard extends StatefulWidget {
  final String name;
  final String weight;
  final String fatFullAmount;
  final String proteinsFullAmount;
  final String carbohydratesFullAmount;
  final double sizePrices;
  final List<dynamic> imageLink;
  final int index;
  final Function() onTap;
  const FoodCard({
    super.key,
    required this.name,
    required this.weight,
    required this.fatFullAmount,
    required this.proteinsFullAmount,
    required this.carbohydratesFullAmount,
    required this.sizePrices,
    required this.imageLink,
    required this.index,
    required this.onTap,
  });

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: SizedBox(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.imageLink.isNotEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: CachedNetworkImage(
                          imageUrl: widget.imageLink[0],
                          height: 130.h,
                          width: 130.w,
                          fit: BoxFit.cover,
                        ),
                      )
                    : SizedBox(
                        width: 130.w,
                        height: 130.h,
                        child: Image.asset(
                          'assets/images/splash.png',
                          width: 155.w / 2,
                          height: 155.w / 2,
                        ),
                      ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150,
                        child: CustomText(
                          title: widget.name,
                          fontSize: 17,
                          color: ColorStyles.blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      CustomText(
                        title: widget.fatFullAmount,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff515151),
                      ),
                      CustomText(
                        title: widget.weight,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff515151),
                      ),
                      CustomText(
                        title:
                            'БЖУ: ${widget.proteinsFullAmount}/${widget.weight}/${widget.carbohydratesFullAmount}',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff515151),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: CustomText(
                          title: '${widget.sizePrices.toString()} ₽',
                          fontSize: 20,
                          color: ColorStyles.accentColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    print('object');
                    setState(() {
                      widget.onTap();
                    });
                  },
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: SvgPicture.asset(SvgImg.cross),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Row(
                children: [
                  CustomText(
                    title: 'Количество порций',
                    fontSize: 17,
                    color: ColorStyles.blackColor,
                    fontWeight: FontWeight.w500,
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 40.h,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (count < 2) {
                                count = 1;
                              } else {
                                count--;
                              }
                            });
                          },
                          child: Container(
                            height: 32.h,
                            width: 32.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                SvgImg.minus,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 30.w,
                          child: CustomText(
                            title: count.toString(),
                            fontSize: 17,
                            color: ColorStyles.blackColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              count++;
                            });
                          },
                          child: Container(
                            height: 32.h,
                            width: 32.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                SvgImg.plus,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.h),
              height: 1,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
