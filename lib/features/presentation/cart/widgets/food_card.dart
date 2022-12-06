import 'package:cached_network_image/cached_network_image.dart';
import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/core/helpers/images.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:cofee/features/data/models/cart/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FoodCard extends StatefulWidget {
  CartModel cartModel;
  final int index;

  final Function() onTap;
  final Function() onUpdatePrice;
  final Function() onUpdateWeight;
  FoodCard({
    super.key,
    required this.index,
    required this.onTap,
    required this.onUpdatePrice,
    required this.onUpdateWeight,
    required this.cartModel,
  });

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
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
                widget.cartModel.imageLink.isNotEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: CachedNetworkImage(
                          imageUrl: widget.cartModel.imageLink[0],
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
                          title: widget.cartModel.name,
                          fontSize: 17,
                          color: ColorStyles.blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      CustomText(
                        title: widget.cartModel.fatFullAmount,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff515151),
                      ),
                      CustomText(
                        title: widget.cartModel.weight.toStringAsFixed(2),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff515151),
                      ),
                      CustomText(
                        title:
                            'БЖУ: ${widget.cartModel.proteinsFullAmount}/${widget.cartModel.weight.toStringAsFixed(2)}/${widget.cartModel.carbohydratesFullAmount}',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff515151),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: CustomText(
                          title: '${widget.cartModel.sizePrices.toString()} ₽',
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
