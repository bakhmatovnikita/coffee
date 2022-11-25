import 'dart:async';

import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/constants/constants_for_back/constants.dart';
import 'package:cofee/core/helpers/images.dart';
import 'package:cofee/features/auth/presentation/views/choice_adress/controller/choice_adress_cubit.dart';
import 'package:cofee/features/auth/presentation/views/choice_adress/controller/choice_adress_state.dart';
import 'package:cofee/features/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/choiced_restaurant.dart';

class ChoiceAdressView extends StatefulWidget {
  final String phone;
  const ChoiceAdressView({super.key, required this.phone});

  @override
  State<ChoiceAdressView> createState() => _ChoiceAdressViewState();
}

class _ChoiceAdressViewState extends State<ChoiceAdressView> {
  Stream<int> getIndex(int index) async* {
    yield index;
  }

  final streamController = StreamController<int>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<ChoiceAdressCubit, ChoiceAdressState>(
      builder: (context, state) {
        if (state is ChoiceAdressEmptyState) {
          context
              .read<ChoiceAdressCubit>()
              .fetchOrganization("organizations", BackConstants.token);
        } else if (state is ChoiceAdressLoadedState) {
          return Scaffold(
            body: StreamBuilder<int>(
              initialData: 0,
                stream: streamController.stream,
                builder: (context, snapshot) {
                  return Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          height: 116.h,
                          width: 68.w,
                          margin: EdgeInsets.only(bottom: 163.h),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(Img.berry),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 56.h,
                              left: 25.5.w,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  icon: const Icon(Icons.arrow_back_ios),
                                  color: ColorStyles.accentColor,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 128.h),
                            child: Text(
                              'Выберите адрес заведения',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: ColorStyles.blackColor,
                              ),
                            ),
                          ),
                          Container(
                            width: size.width,
                            height: 300.w,
                            margin: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 40.h),
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () => streamController.sink.add(index),
                                  child: ChoicedRestaurant(
                                    title: state.organizationsEntiti
                                        .organizations[index].name,
                                    adress: state.organizationsEntiti
                                        .organizations[index].restaurantAddress,
                                  ),
                                );
                              },
                            ),
                          ),
                          CustomButton(
                              title: "Готово",
                              onTap: () {
                                setState(() {
                                  if (context
                                      .read<ChoiceAdressCubit>()
                                      .createCustomer(
                                          "loyalty/iiko/customer/create_or_update",
                                          state.organizationsEntiti
                                              .organizations[snapshot.data!].id,
                                          widget.phone)) {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                      "/",
                                      (route) => false,
                                    );
                                  }
                                });
                              }),
                        ],
                      ),
                    ],
                  );
                }),
          );
        }
        return const SafeArea(
          child: Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            ),
          ),
        );
      },
    );
  }
}
