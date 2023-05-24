import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/core/helpers/images.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:cofee/features/presentation/home/view/main_home.dart';
import 'package:cofee/features/presentation/profile/history/controller/history_cubit.dart';
import 'package:cofee/features/presentation/profile/history/controller/history_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({super.key});

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
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
          return Scaffold(
            backgroundColor: ColorStyles.backgroundColor,
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colors.transparent,
              leading: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(
                  Icons.close_rounded,
                  color: ColorStyles.accentColor,
                ),
              ),
              title: CustomText(
                title: 'Статус заказа',
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
            ),
            body: ScrollConfiguration(
              behavior: MyBehavior(),
              child: ListView.builder(
                itemCount: state.historyEntiti.orders.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, indexOrder) => ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
                      child: CustomText(
                        title: state.historyEntiti.orders[indexOrder].order
                                    .status ==
                                'Deleted'
                            ? "Заказ отменен"
                            : state.historyEntiti.orders[indexOrder].order
                                        .status ==
                                    'Bill'
                                ? 'Заказ готовится'
                                : state.historyEntiti.orders[indexOrder].order
                                            .status ==
                                        'New'
                                    ? "Новый заказ"
                                    : 'Заказ получен',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomText(
                            title:
                                'Заказ №${state.historyEntiti.orders[indexOrder].order.number}',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              state.historyEntiti.orders[indexOrder].order
                                          .status ==
                                      'Closed'
                                  ? SvgPicture.asset(
                                      SvgImg.pencilCircle,
                                      color: const Color(0xff039D00),
                                    )
                                  : const SizedBox(),
                              CustomText(
                                title: state.historyEntiti.orders[indexOrder]
                                            .order.status ==
                                        'Deleted'
                                    ? "Заказ отменен"
                                    : state.historyEntiti.orders[indexOrder]
                                                .order.status ==
                                            'Bill'
                                        ? 'Заказ готовится'
                                        : state.historyEntiti.orders[indexOrder]
                                                    .order.status ==
                                                'New'
                                            ? "Новый заказ"
                                            : ' Заказ получен',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: state.historyEntiti.orders[indexOrder]
                                            .order.status ==
                                        'Deleted'
                                    ? Colors.grey
                                    : state.historyEntiti.orders[indexOrder]
                                                .order.status ==
                                            'Bill'
                                        ? Colors.black
                                        : state.historyEntiti.orders[indexOrder]
                                                    .order.status ==
                                                'New'
                                            ? Colors.black
                                            : const Color(0xff039D00),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomText(
                            title: 'Заберите заказ до 17:00',
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: ColorStyles.accentColor,
                          ),
                          const Divider(
                            height: 26,
                            color: Colors.grey,
                            thickness: 1,
                          ),
                          CustomText(
                            title: 'Содержание заказа',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            height: 200,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.historyEntiti.orders[indexOrder]
                                  .order.items.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Container(
                                width: 160,
                                margin: const EdgeInsets.only(right: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Colors.amber,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Flexible(
                                      child: CustomText(
                                        title: state
                                            .historyEntiti
                                            .orders[indexOrder]
                                            .order
                                            .items[index]
                                            .discountType
                                            .name,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                    CustomText(
                                      title:
                                          '${state.historyEntiti.orders[indexOrder].order.items[index].amount.toInt()} Порция',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return Scaffold(
          backgroundColor: ColorStyles.backgroundColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Icon(
                Icons.close_rounded,
                color: ColorStyles.accentColor,
              ),
            ),
            title: CustomText(
              title: 'Статус заказа',
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
          ),
          body: const Center(
            child: CircularProgressIndicator(
              color: ColorStyles.accentColor,
            ),
          ),
        );
      },
    );
  }
}
