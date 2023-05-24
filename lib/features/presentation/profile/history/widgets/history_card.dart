import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/core/helpers/functions.dart';
import 'package:cofee/core/helpers/images.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:cofee/features/domain/entiti/default_history_entiti.dart/order_entiti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class HistoryCard extends StatefulWidget {
  final OrderEntiti orderEntiti;
  final int index;
  const HistoryCard(
      {super.key, required this.orderEntiti, required this.index});

  @override
  State<HistoryCard> createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  String time = '';
  @override
  void initState() {
    final DateFormat formatter = DateFormat('dd.MM.yyyy')..add_Hm();
    time = formatter.format(widget.orderEntiti.whenCreated);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 197.h,
      width: size.width,
      margin: EdgeInsets.symmetric(
        vertical: 4.h,
        horizontal: 16.w,
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorStyles.whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: CustomText(
              title: '№${widget.orderEntiti.number}',
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: ColorStyles.greyTitleColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                Row(
                  children: [
                    widget.orderEntiti.status == 'Closed'
                        ? SvgPicture.asset(
                            SvgImg.pencilCircle,
                            color: const Color(0xff039D00),
                          )
                        : const SizedBox(),
                    CustomText(
                      title: widget.orderEntiti.status == 'Deleted'
                          ? "Заказ отменен"
                          : widget.orderEntiti.status == 'Bill'
                              ? 'Заказ готовится'
                              : widget.orderEntiti.status == 'New'
                                  ? "Новый заказ"
                                  : ' Заказ получен',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: widget.orderEntiti.status == 'Deleted'
                          ? Colors.grey
                          : widget.orderEntiti.status == 'Bill'
                              ? Colors.black
                              : widget.orderEntiti.status == 'New'
                                  ? Colors.black
                                  : const Color(0xff039D00),
                    ),
                  ],
                ),
                const Spacer(),
                RatingBar.builder(
                  itemSize: 20,
                  initialRating: 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, index) => SvgPicture.asset(
                    SvgImg.star,
                    color: ColorStyles.accentColor,
                    height: 16.h,
                    width: 16.w,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Column(
              children: [
                Row(
                  children: [
                    CustomText(
                      title: 'Сумма заказа',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorStyles.blackColor,
                    ),
                    const Spacer(),
                    CustomText(
                      title: 'Дата и время',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorStyles.blackColor,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    CustomText(
                      title: '${widget.orderEntiti.sum.toInt()} ₽',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: ColorStyles.blackColor,
                    ),
                    const Spacer(),
                    CustomText(
                      title: time,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: ColorStyles.blackColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 1.h,
            width: size.width,
            color: Colors.grey[300],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Functions(context).showMorePageBottomSheet(
                  widget.orderEntiti, widget.index, time);
            },
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 2.w),
                  child: SvgPicture.asset(SvgImg.info),
                ),
                CustomText(
                  title: 'Подробнее',
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorStyles.accentColor,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
