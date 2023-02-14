import 'dart:async';

import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/core/helpers/functions.dart';
import 'package:cofee/custom_widgets/custom_button.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:cofee/features/data/models/cart/cart_model.dart';
import 'package:cofee/features/presentation/cart/widgets/checkout/widgets/way_of_obtaining/controller/way_of_obtaining_cubit.dart';
import 'package:cofee/features/presentation/cart/widgets/checkout/widgets/way_of_obtaining/controller/way_of_obtaining_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:yandex_geocoder/yandex_geocoder.dart';

import '../widgets/shipping_options.dart';

class WayOfObtaining extends StatefulWidget {
  final List<CartModel> cartModel;
  final double totalAmount;
  final double totalWeigth;
  final PageController pageController;
  const WayOfObtaining(
      {Key? key,
      required this.pageController,
      required this.cartModel,
      required this.totalAmount,
      required this.totalWeigth})
      : super(key: key);

  @override
  State<WayOfObtaining> createState() => _WayOfObtainingState();
}

class _WayOfObtainingState extends State<WayOfObtaining> {
  List<Map<String, dynamic>> wayOfObtaining = [
    {
      'isSelected': true,
      'title': "На подносе",
    },
    {
      'isSelected': true,
      'title': "В контейнере",
    },
    {
      'isSelected': true,
      'title': "Доставка",
    },
  ];
  final streamController = StreamController<int>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderTypesCubit, OrderTypesState>(
      builder: (context, state) {
        if (state is OrderTypesEmptyState) {
          context
              .read<OrderTypesCubit>()
              .fetchOrderTypes('/deliveries/order_types');
        } else if (state is OrderTypesLoadedState) {
          return StreamBuilder<int>(
            initialData: 0,
            stream: streamController.stream,
            builder: (context, snapshot) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(right: 16.w, left: 16.w, bottom: 56.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          title: 'Шаг 2',
                          color: ColorStyles.greyTitleColor,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        CustomText(
                          title: 'Выберите способ получения заказа',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 200.h,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(0),
                      itemCount: wayOfObtaining.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () => streamController.sink.add(index),
                        child: ShippingOptions(
                          title: state.orderTypesEntiti.orderTypes[0].items[index].name,
                          isSelected: snapshot.data! == index
                              ? wayOfObtaining[index]['isSelected'] = true
                              : wayOfObtaining[index]['isSelected'] = false,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 23),
                    child: CustomButton(
                        title: 'Далее',
                        onTap: () async {
                          if (wayOfObtaining[2]['isSelected']) {
                            Navigator.pop(context);
                            const Duration(
                              seconds: 1,
                            );
                            Functions(context).showMapPageBottomsheet(
                                widget.cartModel,
                                widget.totalAmount,
                                widget.totalWeigth);
                          } else {
                            setState(() {
                              widget.pageController.nextPage(
                                duration: const Duration(milliseconds: 600),
                                curve: Curves.easeInOutQuint,
                              );
                            });
                          }
                        }),
                  )
                ],
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(
            color: ColorStyles.accentColor,
          ),
        );
      },
    );
  }
}
