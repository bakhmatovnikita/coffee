import 'dart:async';
import 'dart:math';

import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/core/helpers/functions.dart';
import 'package:cofee/custom_widgets/custom_button.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:cofee/features/data/models/cart/cart_model.dart';
import 'package:cofee/features/data/models/cart_to_order.dart/cart_to_order_model.dart';
import 'package:cofee/features/presentation/cart/widgets/checkout/widgets/selected_cart/controller/select_cart_cubit.dart';
import 'package:cofee/features/presentation/cart/widgets/checkout/widgets/selected_cart/controller/select_cart_state.dart';
import 'package:cofee/features/presentation/cart/widgets/checkout/widgets/selected_cart/widgets/cart_selected.dart';
import 'package:cofee/features/presentation/home/controller/bottom_nav_nar_controller/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:sberbank_acquiring/sberbank_acquiring_core.dart';

import '../../../../../../../../custom_widgets/push_error.dart';

class SelectCart extends StatefulWidget {
  final PageController pageController;
  final double totalAmount;
  final List<CartModel> cartModel;
  const SelectCart({
    super.key,
    required this.totalAmount,
    required this.pageController,
    required this.cartModel,
  });

  @override
  State<SelectCart> createState() => _SelectCartState();
}

class _SelectCartState extends State<SelectCart> {
  final streamController = StreamController<int>();

  SberbankAcquiring acquiring = SberbankAcquiring(
    SberbankAcquiringConfig.credential(
      userName: "T616305058432-api",
      password: "T616305058432",
      isDebugMode: true,
    ),
  );
  OrderStatus? orderStatus;
  double totalPrice = 0.0;
  double bonus = 500;

  Future<void> webviewPayment(
      String paymentTypeKind, int sum, String paymentTypeId) async {
    final RegisterResponse register = await acquiring.register(
      RegisterRequest(
        amount: widget.totalAmount.toInt() * 100,
        returnUrl: 'https://3dsec.sberbank.ru/payment/rest/register.do',
        failUrl: 'https://www.yandex.ru/',
        orderNumber: Random().nextInt(10000).toString(),
        pageView: 'MOBILE',
      ),
    );
    final String? formUrl =
        register.formUrl?.replaceFirst('/www.3dsec.sberbank.ru', '');
    if (!register.hasError && formUrl != null) {
      Functions(context).showCustomBottomSheet(acquiring, formUrl, orderStatus,
          () => _successPaid(paymentTypeKind, sum, paymentTypeId));
    }
  }

  List<Map<String, dynamic>> listCart = [
    {
      'title': "Visa Gold (#9523)",
      'isSelected': true,
    },
    {
      'title': "Visa Silver (#9523)",
      'isSelected': true,
    },
    {
      'title': "Visa Bonze (#9523)",
      'isSelected': true,
    },
  ];

  @override
  void initState() {
    if (widget.totalAmount - bonus < 0) {
      bonus = bonus - widget.totalAmount;
    } else {
      totalPrice =
          (widget.totalAmount - bonus) - (widget.totalAmount / 100 * 10);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectCartCubit, SelectCartState>(
      builder: (context, state) {
        if (state is SelectCartEmptyState) {
          context.read<SelectCartCubit>().fetchCart('payment_types');
        } else if (state is SelectCartLoadedState) {
          return StreamBuilder<int>(
            stream: streamController.stream,
            initialData: 0,
            builder: (context, snapshot) {
              return Expanded(
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.w, right: 16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              title: 'Шаг 6',
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500,
                              color: ColorStyles.greyTitleColor,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 4.h),
                              child: CustomText(
                                title: 'Оплата заказа',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: ColorStyles.blackColor,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: 8.h,
                              ),
                              child: CustomText(
                                title: 'Выберите способ оплаты',
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: ColorStyles.blackColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
                        child: Column(
                          children: [
                            ...List.generate(
                              state.selectCartEntiti.paymentTypes.length,
                              (index) => GestureDetector(
                                onTap: () => streamController.sink.add(index),
                                child: SelectedCart(
                                  title: state.selectCartEntiti
                                      .paymentTypes[index].name,
                                  isSelected: snapshot.data! == index
                                      ? listCart[index]['isSelected'] = true
                                      : listCart[index]['isSelected'] = false,
                                ),
                              ),
                            ),
                            // GestureDetector(
                            //   onTap: () =>
                            //       Functions(context).showCartAddedBottomsheet(),
                            //   child: Container(
                            //     width: 343.w,
                            //     height: 56.h,
                            //     margin: EdgeInsets.symmetric(
                            //         horizontal: 16.w, vertical: 4.h),
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(8.r),
                            //       color: ColorStyles.whiteColor,
                            //     ),
                            //     child: Row(
                            //       crossAxisAlignment: CrossAxisAlignment.center,
                            //       children: [
                            //         Container(
                            //           height: 16.83.h,
                            //           width: 16.83.h,
                            //           margin: EdgeInsets.only(
                            //               left: 23.58.w, right: 11.58.w),
                            //           child: SvgPicture.asset(
                            //             SvgImg.plus,
                            //             color: ColorStyles.blackColor,
                            //           ),
                            //         ),
                            //         CustomText(
                            //           title: 'Добавить карту',
                            //           color: ColorStyles.blackColor,
                            //           fontSize: 17.sp,
                            //           fontWeight: FontWeight.w600,
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        height: 1,
                        margin: EdgeInsets.symmetric(horizontal: 16.w),
                        color: const Color(0xffCDCDCD),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        height: 90.h,
                        width: 343.w,
                        margin: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 16.h),
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 15.h),
                        decoration: BoxDecoration(
                            color: ColorStyles.whiteColor,
                            borderRadius: BorderRadius.circular(16.r)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              title: 'БАЛАНС БОНУСНОГО СЧЕТА',
                              color: ColorStyles.greyTitleColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                            const Spacer(),
                            CustomText(
                              title: '$bonus ₽',
                              color: ColorStyles.accentColor,
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: CustomText(
                          title:
                              'Внимание!  В первую очередь списание происходит с внутреннего счета, а остаток суммы оплачивается с помощью банковской карты ',
                          color: ColorStyles.greyTitleColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 16.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              title: 'Итого к оплате:',
                              color: ColorStyles.blackColor,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            CustomText(
                              title: '$totalPrice ₽ (-10%)',
                              color: ColorStyles.blackColor,
                              fontSize: 32.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 96.h),
                        child: CustomButton(
                            title: state.selectCartEntiti
                                        .paymentTypes[snapshot.data!].code ==
                                    'CASH'
                                ? 'Оформить'
                                : 'Оплатить',
                            onTap: () async {
                              if (state.selectCartEntiti
                                      .paymentTypes[snapshot.data!].code ==
                                  'CASH') {
                                _successPaid(
                                    state
                                        .selectCartEntiti
                                        .paymentTypes[snapshot.data!]
                                        .paymentTypeKind,
                                    widget.totalAmount.toInt(),
                                    state.selectCartEntiti
                                        .paymentTypes[snapshot.data!].id);
                              } else {
                                webviewPayment(
                                    state
                                        .selectCartEntiti
                                        .paymentTypes[snapshot.data!]
                                        .paymentTypeKind,
                                    widget.totalAmount.toInt(),
                                    state.selectCartEntiti
                                        .paymentTypes[snapshot.data!].id);
                              }
                            }),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        } else if (state is SelectCartErrorState) {
          return Center(
            child: CustomText(title: 'Error'),
          );
        }
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.orange,
          ),
        );
      },
    );
  }

  void _successPaid(
      String paymentTypeKind, int sum, String paymentTypeId) async {
    await context.read<CartCubit>().createClientOrder(
          'order/create',
          List.generate(
            widget.cartModel.length,
            (index) => Item(
              type: 'Product',
              amount: widget.cartModel[index].count,
              comment: 'comment',
              productId: widget.cartModel[index].productId,
            ),
          ),
          paymentTypeKind,
          sum,
          paymentTypeId,
          () => SmartDialog.show(
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
          ),
          () => widget.pageController.nextPage(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOutQuint,
          ),
        );
  }
}
