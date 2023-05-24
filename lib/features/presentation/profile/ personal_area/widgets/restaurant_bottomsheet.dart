import 'dart:async';

import 'package:cofee/core/helpers/images.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:cofee/features/presentation/auth/choice_adress/controller/choice_adress_cubit.dart';
import 'package:cofee/features/presentation/auth/choice_adress/controller/choice_adress_state.dart';
import 'package:cofee/features/presentation/profile/%20personal_area/controller/profile_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constants/colors/color_styles.dart';
import '../../../../../custom_widgets/custom_button.dart';
import '../../../auth/choice_adress/widgets/choiced_restaurant.dart';

class RestaurantBottomsheet extends StatefulWidget {
  String? id;
   RestaurantBottomsheet({super.key, this.id});

  @override
  State<RestaurantBottomsheet> createState() => _RestaurantBottomsheetState();
}

class _RestaurantBottomsheetState extends State<RestaurantBottomsheet> {
  final streamController = StreamController<int>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<ChoiceAdressCubit, ChoiceAdressState>(
      builder: (context, state) {
        if (state is ChoiceAdressEmptyState) {
          context.read<ChoiceAdressCubit>().fetchOrganization("organizations");
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
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: 27.h,
                                bottom: 31.h,
                                left: 25.5.w,
                                right: 16.w),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: GestureDetector(
                                    onTap: () => Navigator.of(context).pop(),
                                    child: const Icon(
                                      Icons.arrow_back_ios_new_rounded,
                                      color: ColorStyles.accentColor,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: CustomText(
                                    title: 'Изменить адрес',
                                    fontSize: 17,
                                    color: ColorStyles.blackColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
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
                            margin: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 40.h),
                            child: Column(
                              children: List.generate(
                                  state.organizationsEntiti.organizations
                                      .length, (index) {
                                if (widget.id ==
                                    state.organizationsEntiti
                                        .organizations[index].id) {
                                  streamController.sink.add(index);
                                }
                                return GestureDetector(
                                  onTap: () => {
                                    streamController.sink.add(index),
                                    widget.id = state.organizationsEntiti
                                        .organizations[index].id,
                                  },
                                  child: ChoicedRestaurant(
                                    title: state.organizationsEntiti
                                        .organizations[index].name,
                                    adress: state.organizationsEntiti
                                        .organizations[index].restaurantAddress,
                                    isSelected: snapshot.data! == index &&
                                            widget.id ==
                                                state.organizationsEntiti
                                                    .organizations[index].id
                                        ? true
                                        : false,
                                  ),
                                );
                              }),
                            ),
                          ),
                          CustomButton(
                            title: "Готово",
                            onTap: () {
                              if (context
                                  .read<ProfilePageCubit>()
                                  .saveOrganization(state.organizationsEntiti
                                      .organizations[snapshot.data!].id)) {
                                context
                                    .read<ProfilePageCubit>()
                                    .fetchUserInfo('organizations');
                                Navigator.of(context).pop();
                              } else {
                                print('error');
                              }
                              context
                                  .read<ChoiceAdressCubit>()
                                  .fetchTerminalGroup(
                                      'terminal_groups',
                                      state.organizationsEntiti
                                          .organizations[snapshot.data!].id);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              color: Colors.orange,
            ),
          ),
        );
      },
    );
  }
}
