import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/core/helpers/images.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:cofee/features/presentation/profile/history/controller/history_cubit.dart';
import 'package:cofee/features/presentation/profile/history/controller/history_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/helpers/functions.dart';
import '../widgets/history_card.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    context.read<HistoryCubit>().getUserHistory('order/by_id');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryState>(
      builder: (context, state) {
        if (state is HistoryLoadedSatate) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 25.w,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: SvgPicture.asset(
                            SvgImg.goBackk,
                            height: 17.82.h,
                            width: 10.26.w,
                            color: ColorStyles.accentColor,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.center,
                      child: CustomText(
                        title: 'История заказов',
                        color: ColorStyles.blackColor,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: 25.w,
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: SvgPicture.asset(
                            SvgImg.cross,
                            height: 13.64.h,
                            width: 13.64.w,
                            color: ColorStyles.accentColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: List.generate(
                    state.historyEntiti.orders.length,
                    (index) => GestureDetector(
                      onTap: () =>
                          Functions(context).showEditUserOrderBottomSheet(),
                      child: HistoryCard(
                        orderEntiti: state.historyEntiti.orders[index].order,
                        index: index,
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        } else if (state is NotHaveItemState) {
          return Scaffold(
            backgroundColor: ColorStyles.backgroundColor,
            body: Center(
              child: CustomText(
                title: 'История пуста',
              ),
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
