import 'dart:async';
import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/core/helpers/functions.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:cofee/features/presentation/auth/login_view/controller/login_view_cubit.dart';
import 'package:cofee/features/presentation/home/controller/home_view_cubit.dart';
import 'package:cofee/features/presentation/home/controller/home_view_state.dart';
import 'package:cofee/features/presentation/home/widgets/main_view_widgets/category_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scale_button/scale_button.dart';
import '../../../../constants/constants_for_back/constants.dart';
import '../widgets/calendar_select_modal.dart';
import '../widgets/main_view_widgets/product_card_widget.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  late List<double> itemMenu;
  late List<double> itemCategory;
  late ScrollController scrollController;
  ScrollController scrollControllerCategory = ScrollController();
  final day = DateTime.now().day;
  final month = BackConstants.months[DateTime.now().month];
  final weekDay = BackConstants.weekDays[DateTime.now().weekday];
  final stream = StreamController<int>();
  double num = 0.0;

  void changeCategory() {
    for (var i = 0; i < itemCategory.length; i++) {
      if (scrollController.offset >= itemMenu[i]) {
        scrollControllerCategory.animateTo(
          itemCategory[i],
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInOut,
        );
        stream.sink.add(i);
      }
    }
  }

  Future<void> onTapCategory(int index) async {
    scrollController.removeListener(() {
      changeCategory();
    });
    await scrollController.animateTo(
      itemCategory[index],
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
    scrollController.addListener(() {
      changeCategory();
    });
    // await scrollController.position.animateTo(
    //   itemMenu[index],
    //   duration: const Duration(milliseconds: 600),
    //   curve: Curves.easeInOut,
    // );
  }

  Future<void> feetchMenu(
      Function() accessToken, Function() nomenclature) async {
    await accessToken();
    await nomenclature();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    context.read<LoginViewCubit>().saveToken("access_token");
    scrollController = ScrollController();
    // scrollControllerCategory.addListener(() {});
    // scrollController.addListener(() {
    //   changeCategory();
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<HomeViewCubit, HomeViewState>(
      builder: (context, state) {
        if (state is HomeViewEmptyState) {
          context.read<HomeViewCubit>().fetchProducts('nomenclature');
        } else if (state is HomeViewLoadedState) {
          itemMenu = List.generate(
            state.productsEntiti.groups.length,
            (index) => index.toDouble(),
          );
          itemCategory = List.generate(
              state.productsEntiti.groups.length, (index) => index.toDouble());
          return Scaffold(
            backgroundColor: const Color(0xffF3F3F3),
            body: SafeArea(
              child: CustomScrollView(
                clipBehavior: Clip.hardEdge,
                physics: const BouncingScrollPhysics(),
                controller: scrollController,
                slivers: [
                  SliverAppBar(
                    backgroundColor: ColorStyles.backgroundColor,
                    toolbarHeight: 170.h,
                    elevation: 0,
                    flexibleSpace: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 33.h, left: 15.w, right: 15.w),
                          child: Row(
                            children: [
                              CustomText(
                                title: 'Меню',
                                fontWeight: FontWeight.w600,
                                fontSize: 40,
                              ),
                              const Expanded(child: SizedBox()),
                              ScaleButton(
                                onTap: () =>
                                    Functions(context).showModalNotifications(),
                                bound: 0.05,
                                duration: const Duration(milliseconds: 100),
                                child: Container(
                                  width: 40.h,
                                  height: 40.h,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    color: ColorStyles.whiteColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/icons/bell.svg',
                                    width: 19.55.w,
                                    height: 21.08.h,
                                  ),
                                ),
                              ),
                              SizedBox(width: 16.w),
                              ScaleButton(
                                onTap: () => Functions(context)
                                    .showProfileUserBottomSheet(),
                                bound: 0.05,
                                duration: const Duration(milliseconds: 100),
                                child: Container(
                                  width: 40.h,
                                  height: 40.h,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    // color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/avatar.png',
                                    width: 40.w,
                                    height: 40.h,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 17.h, left: 15.w),
                          child: GestureDetector(
                            onTap: () => calendarSelectModal(
                                context, Offset(15.w, 170.5.h), (index) {}, 0),
                            child: CustomText(
                              title: 'Меню на $day $month ($weekDay)',
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 15.h, left: 15.w, bottom: 5.h),
                          child: GestureDetector(
                            onTap: () => calendarSelectModal(
                                context, Offset(15.w, 185.h), (index) {}, 0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.calendar_month_rounded,
                                  color: ColorStyles.accentColor,
                                  size: 16.h,
                                ),
                                SizedBox(width: 4.w),
                                CustomText(
                                  title: 'Выбрать день',
                                  fontSize: 16.h,
                                  color: ColorStyles.accentColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverAppBar(
                    backgroundColor: ColorStyles.backgroundColor,
                    pinned: true,
                    elevation: 0,
                    flexibleSpace: StreamBuilder<int>(
                        stream: stream.stream,
                        initialData: 0,
                        builder: (context, snapshot) {
                          return Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              height: 40.h,
                              child: ScrollConfiguration(
                                behavior: MyBehavior(),
                                child: ListView.separated(
                                  controller: scrollControllerCategory,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                  ),
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      width: 10.h,
                                    );
                                  },
                                  scrollDirection: Axis.horizontal,
                                  itemCount: itemCategory.length,
                                  itemBuilder: (context, index) {
                                    return GetBoxOffset(
                                      offset: (Offset offset) {
                                        itemCategory[index] = offset.dx;
                                      },
                                      child: GestureDetector(
                                        onTap: () async {
                                          scrollController.animateTo(
                                              itemMenu[index],
                                              duration: const Duration(
                                                  milliseconds: 600),
                                              curve: Curves.easeInOut);
                                          stream.sink.add(index);
                                        },
                                        child: CategoryCardWidget(
                                          groupsEntiti: state
                                              .productsEntiti.groups[index],
                                          isSelected: snapshot.data! == index
                                              ? true
                                              : false,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: itemMenu.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => GetBoxOffset(
                            offset: (offset) {
                              itemMenu[index] = offset.dy;
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 20.w,
                                      top: 20.h,
                                    ),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: CustomText(
                                        title: state
                                            .productsEntiti.groups[index].name,
                                        fontSize: 20.h,
                                      ),
                                    ),
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: state.productsEntiti.products
                                        .where((element) {
                                      return element.parentGroup ==
                                          state.productsEntiti.groups[index].id;
                                    }).length,
                                    itemBuilder: (context, indexProducts) =>
                                        ProductCard(
                                      productEntiti: state
                                          .productsEntiti.products
                                          .where((element) =>
                                              element.parentGroup ==
                                              state.productsEntiti.groups[index]
                                                  .id)
                                          .toList()[indexProducts],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        } else if (state is HomeViewErrorState) {
          feetchMenu(
              () => context.read<LoginViewCubit>().saveToken('access_token'),
              () =>
                  context.read<HomeViewCubit>().fetchProducts('nomenclature'));
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

class GetBoxOffset extends StatefulWidget {
  final Widget child;
  final Function(Offset offset) offset;
  const GetBoxOffset({super.key, required this.child, required this.offset});

  @override
  State<GetBoxOffset> createState() => _GetBoxOffsetState();
}

class _GetBoxOffsetState extends State<GetBoxOffset> {
  GlobalKey widgetKey = GlobalKey();
  Offset offset = const Offset(0.0, 0.0);
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final box = widgetKey.currentContext!.findRenderObject() as RenderBox;
      offset = box.localToGlobal(Offset.zero);
      widget.offset(offset);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widgetKey,
      child: widget.child,
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
