import 'package:cofee/custom_widgets/push_access.dart';
import 'package:cofee/features/domain/entiti/products/product_entiti.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:scale_button/scale_button.dart';
import 'package:cofee/features/presentation/auth/login_view/controller/login_view_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/core/helpers/functions.dart';

import '../../../../../custom_widgets/custom_text.dart';
import '../../../../../custom_widgets/push_error.dart';
import '../../../../data/models/cart/cart_model.dart';
import '../../controller/bottom_nav_nar_controller/cart_cubit.dart';
import '../../controller/home_view_cubit.dart';
import '../../controller/home_view_state.dart';

class ProductCard extends StatefulWidget {
  final ProductEntiti productEntiti;
  const ProductCard({super.key, required this.productEntiti});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  SmartDialogController smartDialogController = SmartDialogController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewCubit, HomeViewState>(
      builder: (context, state) {
        return ScaleButton(
          onTap: () => Functions(context)
              .showProductEntityBottomsheet(widget.productEntiti),
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
                      // child: widget.productEntiti.imageLink.isNotEmpty
                      // ? ExtendedImage.network(
                      //     widget.productEntiti.imageLink[0],
                      //     width: 155.w,
                      //     fit: BoxFit.cover,

                      //   )
                      SizedBox(
                    width: 155.w,
                    child: Image.asset(
                      'assets/images/splash.png',
                      width: 155.w / 2,
                      height: 155.w / 2,
                    ),
                  ),
                  // child: widget.productEntiti.imageLink.isNotEmpty
                  //     ? OctoImage(
                  //         image: CachedNetworkImageProvider(
                  //           widget.productEntiti.imageLink[0],
                  //         ),
                  //         width: 155.w,
                  //         placeholderBuilder: OctoPlaceholder.blurHash(
                  //           'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                  //         ),
                  //         // memCacheHeight: 0,
                  //         // memCacheWidth: 0,
                  //         filterQuality: FilterQuality.none,
                  //         fit: BoxFit.cover,
                  //       )
                  //     : SizedBox(
                  //         width: 155.w,
                  //         child: Image.asset(
                  //           'assets/images/splash.png',
                  //           width: 155.w / 2,
                  //           height: 155.w / 2,
                  //         ),
                  //       ),
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
                            GestureDetector(
                              onTap: () {
                                try {
                                  context.read<CartCubit>().addToCartItem(
                                        CartModel(
                                            name: widget.productEntiti.name,
                                            fatFullAmount: widget
                                                .productEntiti.fatFullAmount
                                                .toStringAsFixed(2),
                                            weight: widget.productEntiti.weight,
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
                                            imageLink:
                                                widget.productEntiti.imageLink,
                                            count: 1,
                                            productId: widget.productEntiti.id),
                                      );
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
      },
    );
  }
}
