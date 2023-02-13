import 'dart:async';
import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/core/helpers/functions.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:cofee/features/presentation/auth/login_view/controller/login_view_cubit.dart';
import 'package:cofee/features/presentation/auth/root_screen/controller/root_screen_cubit.dart';
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
  String? organizationId;
  MainHome({super.key, this.organizationId});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  List<double> itemMenu = [];
  List<GlobalKey> itemCategory = [];
  late ScrollController scrollController;
  BuildContext? tabContext;
  ScrollController scrollControllerCategory = ScrollController();
  late TabController tabController;
  final day = DateTime.now().day;
  final month = BackConstants.months[DateTime.now().month];
  final weekDay = BackConstants.weekDays[DateTime.now().weekday];
  final stream = StreamController<int>();
  double num = 0.0;

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
    scrollController.addListener(changeTabs);
    super.initState();
  }

  void changeTabs() {
    int currentIndex = 0;
    for (var i = 0; i < itemCategory.length; i++) {
      if (scrollController.offset >= itemMenu[i]) {
        currentIndex = i;
        DefaultTabController.of(tabContext!)!.animateTo(
          i,
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInOut,
        );
      }
    }
    stream.sink.add(currentIndex);
  }

  scrollTo(int index) async {
    scrollController.removeListener(changeTabs);
    stream.sink.add(index);
    await Scrollable.ensureVisible(
      itemCategory[index].currentContext!,
      duration: const Duration(milliseconds: 600),
    );
    scrollController.addListener(changeTabs);
  }

  Future<void> checkUser(
      Function() nomenclature, Function() checkUserNumber) async {
    await checkUserNumber();
    await nomenclature();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewCubit, HomeViewState>(
      builder: (context, state) {
        if (state is HomeViewEmptyState) {
          // checkUser(
          //     () => context.read<HomeViewCubit>().fetchProducts('nomenclature'),
          //     () => context.read<RootScreenCubit>().checkAuthorization());
          context.read<HomeViewCubit>().fetchProducts('nomenclature');
        } else if (state is HomeViewLoadedState) {
          itemCategory = List.generate(
            state.productsEntiti.groups.length,
            (index) => GlobalKey(),
          );
          return DefaultTabController(
            length: state.productsEntiti.groups.length,
            child: Builder(
              builder: (context) {
                tabContext = context;
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
                                      onTap: () => Functions(context)
                                          .showModalNotifications(),
                                      bound: 0.05,
                                      duration:
                                          const Duration(milliseconds: 100),
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
                                      duration:
                                          const Duration(milliseconds: 100),
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
                                  onTap: () => calendarSelectModal(context,
                                      Offset(15.w, 170.5.h), (index) {}, 0),
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
                                  onTap: () => calendarSelectModal(context,
                                      Offset(15.w, 185.h), (index) {}, 0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                          bottom: PreferredSize(
                            preferredSize: Size.fromHeight(10.h),
                            child: StreamBuilder<int>(
                                stream: stream.stream,
                                initialData: 0,
                                builder: (context, snapshot) {
                                  return TabBar(
                                    physics: const BouncingScrollPhysics(),
                                    indicatorColor: Colors.transparent,
                                    indicatorSize: TabBarIndicatorSize.label,
                                    labelPadding:
                                        EdgeInsets.symmetric(horizontal: 4.w),
                                    isScrollable: true,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.w, vertical: 10.h),
                                    onTap: (value) {
                                      scrollTo(value);
                                    },
                                    tabs: List.generate(
                                      itemCategory.length,
                                      (index) => CategoryCardWidget(
                                        groupsEntiti:
                                            state.productsEntiti.groups[index],
                                        isSelected: snapshot.data! == index
                                            ? true
                                            : false,
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: state.productsEntiti.groups.length,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) => GetBoxOffset(
                                  offset: (offset) {
                                    itemMenu.add(offset.dy);
                                    setState(() {});
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Column(
                                      children: [
                                        Padding(
                                          key: itemCategory[index],
                                          padding: EdgeInsets.only(
                                            left: 20.w,
                                            top: 20.h,
                                          ),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: CustomText(
                                              title: state.productsEntiti
                                                  .groups[index].name,
                                              fontSize: 20.h,
                                            ),
                                          ),
                                        ),
                                        ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: state
                                              .productsEntiti.products
                                              .where((element) {
                                            return element.parentGroup ==
                                                state.productsEntiti
                                                    .groups[index].id;
                                          }).length,
                                          itemBuilder:
                                              (context, indexProducts) =>
                                                  ProductCard(
                                            productEntiti: state
                                                .productsEntiti.products
                                                .where((element) =>
                                                    element.parentGroup ==
                                                    state.productsEntiti
                                                        .groups[index].id)
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
              },
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
