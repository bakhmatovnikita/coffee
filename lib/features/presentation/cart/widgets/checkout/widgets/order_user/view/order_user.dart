import 'package:cached_network_image/cached_network_image.dart';
import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/custom_widgets/custom_button.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:cofee/features/data/models/cart/cart_model.dart';
import 'package:cofee/injection.container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:octo_image/octo_image.dart';

import '../../../../../../../../core/services/auth_config/time_accept.dart';

class OrderUser extends StatefulWidget {
  final PageController pageController;
  final List<CartModel> cartModel;
  final double totalAmount;
  final double totalWeigth;
  const OrderUser({
    super.key,
    required this.pageController,
    required this.cartModel,
    required this.totalAmount,
    required this.totalWeigth,
  });

  @override
  State<OrderUser> createState() => _OrderUserState();
}

class _OrderUserState extends State<OrderUser> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CustomText(
                title: 'Шаг 5',
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
                color: ColorStyles.greyTitleColor,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 8.h, left: 16.w, right: 16.w),
              child: CustomText(
                title: 'Проверьте правильность заполненных данных',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: ColorStyles.blackColor,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(
                  top: 24.h, bottom: 8.h, left: 16.w, right: 16.w),
              child: CustomText(
                title: 'Вы заказываете:',
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
                color: ColorStyles.greyTitleColor,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: widget.cartModel.length,
              (context, index) {
                return Container(
                  height: 80,
                  margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      widget.cartModel[index].imageLink.isNotEmpty
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: OctoImage(
                                image: CachedNetworkImageProvider(
                                  widget.cartModel[index].imageLink[0],
                                ),
                                height: 80.h,
                                width: 80.w,
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
                              width: 80.w,
                              height: 80.h,
                              child: Image.asset(
                                'assets/images/splash.png',
                                width: 155.w / 2,
                                height: 155.w / 2,
                              ),
                            ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomText(
                              title: widget.cartModel[index].name,
                              fontSize: 17,
                              color: ColorStyles.blackColor,
                              fontWeight: FontWeight.w600,
                              maxLength: 14,
                            ),
                            CustomText(
                              title:
                                  "${widget.cartModel[index].fatFullAmount} ккал",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: ColorStyles.accentColor,
                            ),
                            CustomText(
                              title:
                                  "${widget.cartModel[index].weight.toStringAsFixed(2)} гр",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff515151),
                            ),
                            CustomText(
                              title:
                                  'БЖУ: ${widget.cartModel[index].proteinsFullAmount}/${widget.cartModel[index].weight.toStringAsFixed(2)}/${widget.cartModel[index].carbohydratesFullAmount}',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff515151),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            title:
                                "${widget.cartModel[index].count} * ${widget.cartModel[index].sizePrices.toString()} ₽",
                            color: ColorStyles.accentColor,
                            fontSize: 20.sp,
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 1,
              color: Colors.grey,
              margin: EdgeInsets.only(top: 8.h, left: 16.w, right: 16.w),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SizedBox(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 15.h),
                          child: CustomText(
                            title: 'Итого:',
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5.h),
                          child: CustomText(
                            title: '${widget.totalAmount} ₽ (-10%)',
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomText(
                          title:
                              '${widget.totalWeigth.toStringAsFixed(2)} Ккал',
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: ColorStyles.accentColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 32.h, right: 16.w, left: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    title: 'Заказ будет готов',
                    fontSize: 17,
                    color: ColorStyles.greyTitleColor,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomText(
                    title:
                        'во ${sl<AcceptTime>().weekDay} ${sl<AcceptTime>().day} ${sl<AcceptTime>().month}, ${sl<AcceptTime>().time}',
                    fontSize: 16,
                    color: ColorStyles.accentColor,
                    fontWeight: FontWeight.w600,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.h),
                    child: CustomText(
                      title: 'Вы должны забрать заказ',
                      fontSize: 17,
                      color: ColorStyles.greyTitleColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  CustomText(
                    title: 'в ${sl<AcceptTime>().time}',
                    fontSize: 16,
                    color: ColorStyles.accentColor,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 32.h, bottom: 62.h),
              child: CustomButton(
                title: 'Далее',
                onTap: () => setState(
                  () {
                    widget.pageController.nextPage(
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeInOutQuint,
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
