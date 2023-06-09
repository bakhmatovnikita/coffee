import 'dart:async';

import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/core/services/auth_config/auth_config.dart';
import 'package:cofee/custom_widgets/custom_button.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:cofee/features/data/datasorces/local_datasource/local_datasource.dart';
import 'package:cofee/features/presentation/cart/widgets/checkout/widgets/way_of_obtaining/controller/way_of_obtaining_cubit.dart';
import 'package:cofee/injection.container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../cart/widgets/checkout/widgets/way_of_obtaining/controller/way_of_obtaining_state.dart';
import '../../../profile/edit_order/widgets/shipping_options.dart';

class ChoiceWayOfObtaining extends StatefulWidget {
  final String id;
  final int orderTypeId;
  const ChoiceWayOfObtaining(
      {super.key, required this.id, required this.orderTypeId});

  @override
  State<ChoiceWayOfObtaining> createState() => _ChoiceWayOfObtainingState();
}

class _ChoiceWayOfObtainingState extends State<ChoiceWayOfObtaining> {
  List<Map<String, dynamic>> wayOfObtaining = [
    {
      'isSelected': true,
      'title': "Самовывоз",
    },
    {
      'isSelected': true,
      'title': "Доставка",
    },
    {
      'isSelected': true,
      'title': "Едамат",
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
            initialData: widget.orderTypeId,
            stream: streamController.stream,
            builder: (context, snapshot) {
              return Scaffold(
                body: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: 16.w, left: 16.w, bottom: 56.h, top: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                              title: wayOfObtaining[index]['title'],
                              isSelected: snapshot.data! == index
                                  ? wayOfObtaining[index]['isSelected'] = true
                                  : wayOfObtaining[index]['isSelected'] = false,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: CustomButton(
                            title: 'Далее',
                            onTap: () async {
                              sl<AuthConfig>().orderType =
                                  wayOfObtaining[snapshot.data!]['title'];
                              sl<AuthConfig>().orderTypeId = snapshot.data!;
                              await sl<LocalDatasource>()
                                  .saveOrderTypeId(snapshot.data!);
                              await sl<LocalDatasource>().saveOrderType(wayOfObtaining[snapshot.data!]['title']);

                              Navigator.of(context).pushNamedAndRemoveUntil(
                                "/MainView",
                                (route) => false,
                                arguments: {
                                  'organizationId': widget.id,
                                },
                              );
                              // if (wayOfObtaining[2]['isSelected']) {
                              //   Navigator.pop(context);
                              //   const Duration(
                              //     seconds: 1,
                              //   );
                              //   Functions(context).showMapPageBottomsheet(
                              //       widget.cartModel,
                              //       widget.totalAmount,
                              //       widget.totalWeigth);
                              // } else {
                              //   setState(() {
                              //     widget.pageController.nextPage(
                              //       duration: const Duration(milliseconds: 600),
                              //       curve: Curves.easeInOutQuint,
                              //     );
                              //   });
                              // }
                            }),
                      )
                    ],
                  ),
                ),
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
