import 'package:cached_network_image/cached_network_image.dart';
import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/core/helpers/images.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';

import '../../../../../../../data/models/cart/cart_model.dart';

class ModalMenuFoodCard extends StatefulWidget {
  final CartModel cartModel;
  final int index;

  final Function() onTap;
  final Function() onUpdatePrice;
  final Function() onUpdateWeight;
  const ModalMenuFoodCard({
    super.key,
    required this.index,
    required this.onTap,
    required this.onUpdatePrice,
    required this.onUpdateWeight,
    required this.cartModel,
  });

  @override
  State<ModalMenuFoodCard> createState() => _ModalMenuFoodCardState();
}

class _ModalMenuFoodCardState extends State<ModalMenuFoodCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: SizedBox(
        height: 64.h,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.cartModel.imageLink.isNotEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: OctoImage(
                          image: CachedNetworkImageProvider(
                            widget.cartModel.imageLink[0],
                          ),
                          height: 64.h,
                          width: 64.w,
                          placeholderBuilder: OctoPlaceholder.blurHash(
                            'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                          ),
                          fit: BoxFit.cover,
                          memCacheHeight: 0,
                          memCacheWidth: 0,
                          filterQuality: FilterQuality.low,
                        ),
                      )
                    : SizedBox(
                        width: 64.w,
                        height: 64.h,
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
                          maxLength: 10,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: CustomText(
                          title: '${widget.cartModel.sizePrices.toString()} ₽',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
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
                  child: Container(
                    height: 40,
                    width: 40,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: SvgPicture.asset(SvgImg.cross),
                  ),
                ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
