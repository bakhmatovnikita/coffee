import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/core/helpers/functions.dart';
import 'package:cofee/core/helpers/images.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:cofee/custom_widgets/push_access.dart';
import 'package:cofee/custom_widgets/push_error.dart';
import 'package:cofee/features/data/models/cart/cart_model.dart';
import 'package:cofee/features/domain/entiti/products/product_entiti.dart';
import 'package:cofee/features/presentation/home/controller/bottom_nav_nar_controller/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scale_button/scale_button.dart';

import '../controller/list_view_modal_menu_cubit.dart';
import '../controller/list_view_modal_menu_state.dart';

class ProductCartWidget extends StatefulWidget {
  final ProductEntiti productEntiti;
  const ProductCartWidget({super.key, required this.productEntiti});

  @override
  State<ProductCartWidget> createState() => _ProductCartWidgetState();
}

class _ProductCartWidgetState extends State<ProductCartWidget> {
  int countProducts = 0;
  returnBool(List<CartModel> cart) {
    for (var element in cart) {
      if (element.name == widget.productEntiti.name && element.isSelected) {
        countProducts = element.count;
        return true;
      }
    }
    return false;
  }

  SmartDialogController smartDialogController = SmartDialogController();
  @override
  Widget build(BuildContext context) {
    return ScaleButton(
      onTap: () =>
          Functions(context).showProductEntityBottomsheet(widget.productEntiti),
      bound: 0.02,
      duration: const Duration(milliseconds: 100),
      child: Container(
        padding: EdgeInsets.zero,
        height: 155.71.h,
        decoration: BoxDecoration(
          color: ColorStyles.whiteColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 7.5.h,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                bottomLeft: Radius.circular(16.r),
              ),
              child:
                  // child: productEntiti.imageLink.isNotEmpty
                  //     ? OctoImage(
                  //         image: CachedNetworkImageProvider(
                  //           productEntiti.imageLink[0],
                  //         ),
                  //         width: 155.w,
                  //         placeholderBuilder: OctoPlaceholder.blurHash(
                  //           'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                  //         ),
                  //         memCacheHeight: 0,
                  //         memCacheWidth: 0,
                  //         filterQuality: FilterQuality.low,
                  //         fit: BoxFit.cover,
                  //       )
                  //     :
                  SizedBox(
                width: 155.w,
                child: Image.asset(
                  'assets/images/splash.png',
                  width: 155.w / 2,
                  height: 155.w / 2,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(14.86.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: CustomText(
                      title: widget.productEntiti.name,
                      fontSize: 17.h,
                      fontWeight: FontWeight.w600,
                      maxLength: 13,
                    ),
                  ),
                  CustomText(
                    title:
                        '${widget.productEntiti.fatFullAmount.toStringAsFixed(2)} калл',
                    fontSize: 14.h,
                    fontWeight: FontWeight.w400,
                  ),
                  CustomText(
                    title:
                        '${widget.productEntiti.weight.toStringAsFixed(1)} гр',
                    fontSize: 14.h,
                    fontWeight: FontWeight.w400,
                  ),
                  CustomText(
                    title:
                        'БЖУ: ${widget.productEntiti.proteinsFullAmount.toStringAsFixed(1)}/${widget.productEntiti.fatFullAmount.toStringAsFixed(1)}/${widget.productEntiti.carbohydratesFullAmount.toStringAsFixed(1)}',
                    fontSize: 14.h,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    width: 151.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          title:
                              '${widget.productEntiti.sizePrices[0].price.currentPrice} ₽'
                                  .toUpperCase(),
                          fontSize: 20.h,
                          fontWeight: FontWeight.w600,
                          color: ColorStyles.accentColor,
                        ),
                        BlocBuilder<ListViewCubit, ListViewState>(
                          builder: (context, state) {
                            if (state is HaveListViewState) {
                              return returnBool(state.cart)
                                  ? SizedBox(
                                      height: 40.h,
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              if (countProducts < 2) {
                                                countProducts = 1;
                                              } else if (countProducts < 49) {
                                                countProducts--;
                                              }
                                            },
                                            child: Container(
                                              height: 32.h,
                                              width: 32.w,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
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
                                              title: countProducts.toString(),
                                              fontSize: 17,
                                              color: ColorStyles.blackColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              if (countProducts > 49) {
                                                countProducts = 50;
                                              } else {
                                                countProducts++;
                                              }
                                              context
                                                  .read<ListViewCubit>()
                                                  .addToModalCart(
                                                    CartModel(
                                                      name: widget
                                                          .productEntiti.name,
                                                      fatFullAmount: widget
                                                          .productEntiti
                                                          .fatFullAmount
                                                          .toStringAsFixed(2),
                                                      weight: widget
                                                          .productEntiti.weight,
                                                      proteinsFullAmount: widget
                                                          .productEntiti
                                                          .proteinsFullAmount
                                                          .toStringAsFixed(2),
                                                      carbohydratesFullAmount:
                                                          widget.productEntiti
                                                              .carbohydratesFullAmount
                                                              .toStringAsFixed(
                                                                  2),
                                                      sizePrices: widget
                                                          .productEntiti
                                                          .sizePrices[0]
                                                          .price
                                                          .currentPrice,
                                                      imageLink: widget
                                                          .productEntiti
                                                          .imageLink,
                                                      count: 1,
                                                      productId: widget
                                                          .productEntiti.id,
                                                      isSelected: true,
                                                    ),
                                                  );
                                            },
                                            child: Container(
                                              height: 32.h,
                                              width: 32.w,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
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
                                  : GestureDetector(
                                      onTap: () {
                                        try {
                                          context
                                              .read<ListViewCubit>()
                                              .addToModalCart(
                                                CartModel(
                                                  name:
                                                      widget.productEntiti.name,
                                                  fatFullAmount: widget
                                                      .productEntiti
                                                      .fatFullAmount
                                                      .toStringAsFixed(2),
                                                  weight: widget
                                                      .productEntiti.weight,
                                                  proteinsFullAmount: widget
                                                      .productEntiti
                                                      .proteinsFullAmount
                                                      .toStringAsFixed(2),
                                                  carbohydratesFullAmount: widget
                                                      .productEntiti
                                                      .carbohydratesFullAmount
                                                      .toStringAsFixed(2),
                                                  sizePrices: widget
                                                      .productEntiti
                                                      .sizePrices[0]
                                                      .price
                                                      .currentPrice,
                                                  imageLink: widget
                                                      .productEntiti.imageLink,
                                                  count: 1,
                                                  productId:
                                                      widget.productEntiti.id,
                                                  isSelected: true,
                                                ),
                                              );
                                          setState(() {});
                                          SmartDialog.show(
                                            animationType:
                                                SmartAnimationType.fade,
                                            maskColor: Colors.transparent,
                                            controller: smartDialogController,
                                            displayTime:
                                                const Duration(seconds: 3),
                                            clickMaskDismiss: false,
                                            usePenetrate: true,
                                            builder: (context) =>
                                                const SafeArea(
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: PushAccess(
                                                  title:
                                                      'Товар добавлен в корзину',
                                                  subTitle:
                                                      'Вы можете оформить заказ!',
                                                ),
                                              ),
                                            ),
                                          );
                                        } catch (e) {
                                          SmartDialog.show(
                                            animationType:
                                                SmartAnimationType.fade,
                                            maskColor: Colors.transparent,
                                            displayTime:
                                                const Duration(seconds: 3),
                                            clickMaskDismiss: false,
                                            usePenetrate: true,
                                            builder: (context) =>
                                                const SafeArea(
                                              child: Align(
                                                alignment: Alignment.topCenter,
                                                child: PushError(
                                                  title: 'Что-то пошло не так',
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                      child: SizedBox(
                                        height: 30.h,
                                        width: 30.w,
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: SvgPicture.asset(
                                            'assets/icons/plus.svg',
                                            width: 16.83.h,
                                            height: 16.83.h,
                                          ),
                                        ),
                                      ),
                                    );
                            }
                            return GestureDetector(
                              onTap: () {
                                try {
                                  context.read<ListViewCubit>().addToModalCart(
                                        CartModel(
                                          name: widget.productEntiti.name,
                                          fatFullAmount: widget
                                              .productEntiti.fatFullAmount
                                              .toStringAsFixed(2),
                                          weight: widget.productEntiti.weight,
                                          proteinsFullAmount: widget
                                              .productEntiti.proteinsFullAmount
                                              .toStringAsFixed(2),
                                          carbohydratesFullAmount: widget
                                              .productEntiti
                                              .carbohydratesFullAmount
                                              .toStringAsFixed(2),
                                          sizePrices: widget.productEntiti
                                              .sizePrices[0].price.currentPrice,
                                          imageLink:
                                              widget.productEntiti.imageLink,
                                          count: 1,
                                          productId: widget.productEntiti.id,
                                          isSelected: true,
                                        ),
                                      );
                                  setState(() {});
                                  SmartDialog.show(
                                    animationType: SmartAnimationType.fade,
                                    maskColor: Colors.transparent,
                                    controller: smartDialogController,
                                    displayTime: const Duration(seconds: 3),
                                    clickMaskDismiss: false,
                                    usePenetrate: true,
                                    builder: (context) => const SafeArea(
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: PushAccess(
                                          title: 'Товар добавлен в корзину',
                                          subTitle: 'Вы можете оформить заказ!',
                                        ),
                                      ),
                                    ),
                                  );
                                } catch (e) {
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
                                          title: 'Что-то пошло не так',
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: SizedBox(
                                height: 30.h,
                                width: 30.w,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: SvgPicture.asset(
                                    'assets/icons/plus.svg',
                                    width: 16.83.h,
                                    height: 16.83.h,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );

//   @override
//   // TODO: implement wantKeepAlive
//   bool get wantKeepAlive => true;

// }
// class VerticalScrollableTabBarStatus {
//   static bool isOnTap = false;
//   static int isOnTapIndex = 0;

//   static void setIndex(int index) {
//     VerticalScrollableTabBarStatus.isOnTap = true;
//     VerticalScrollableTabBarStatus.isOnTapIndex = index;
//   }
  }
}
