import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/core/helpers/images.dart';
import 'package:cofee/custom_widgets/custom_button.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:cofee/features/data/models/cart/cart_model.dart';
import 'package:cofee/features/presentation/cart/widgets/checkout/widgets/modal_menu_in_cart/controller/list_view_modal_menu_cubit.dart';
import 'package:cofee/features/presentation/cart/widgets/checkout/widgets/modal_menu_in_cart/controller/list_view_modal_menu_state.dart';
import 'package:cofee/features/presentation/cart/widgets/checkout/widgets/modal_menu_in_cart/widget/modal_menu_food_card.dart';
import 'package:cofee/features/presentation/home/controller/bottom_nav_nar_controller/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListViewModalCart extends StatefulWidget {
  const ListViewModalCart({
    super.key,
  });

  @override
  State<ListViewModalCart> createState() => _ListViewModalCartState();
}

class _ListViewModalCartState extends State<ListViewModalCart> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListViewCubit, ListViewState>(
      builder: (context, state) {
        if (state is HaveListViewState) {
          return Column(
            children: [
              ListView.builder(
                itemCount: state.cart.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(0.h),
                itemBuilder: (context, index) => Column(
                  children: [
                    ModalMenuFoodCard(
                      index: index,
                      onTap: () {
                        context.read<ListViewCubit>().deleteOneInModalCart(index);
                      },
                      onUpdatePrice: () {},
                      onUpdateWeight: () {},
                      cartModel: state.cart[index],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 8.h, bottom: 16.w, left: 16.w, right: 16.w),
                      child: Row(
                        children: [
                          CustomText(
                            title: 'Количество порций',
                            fontSize: 17,
                            color: ColorStyles.blackColor,
                            fontWeight: FontWeight.w500,
                          ),
                          const Spacer(),
                          SizedBox(
                            height: 40.h,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (state.cart[index].count < 2) {
                                        state.cart[index].count = 1;
                                      } else {
                                        state.cart[index].count--;
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: 32.h,
                                    width: 32.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SvgPicture.asset(
                                        SvgImg.minus,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 30.w,
                                  child: CustomText(
                                    title: state.cart[index].count.toString(),
                                    fontSize: 17,
                                    color: ColorStyles.blackColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    state.cart[index].count++;
                                    setState(() {});
                                  },
                                  child: Container(
                                    height: 32.h,
                                    width: 32.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SvgPicture.asset(
                                        SvgImg.plus,
                                        color: Colors.black,
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
                  ],
                ),
              ),
              CustomButton(
                title: "Добавить к заказу",
                onTap: () {
                  for (CartModel cartModel in state.cart) {
                    context.read<CartCubit>().addToCartItem(cartModel);
                  }
                  context.read<ListViewCubit>().deleteAllInModalCart();
                  Navigator.of(context).pop();
                },
              ),
              Container(
                height: 1.h,
                color: const Color(0xffCDCDCD),
                margin: EdgeInsets.only(top: 24.h, right: 16.w, left: 16.h),
              ),
            ],
          );
        } else if (state is EmptyListViewState) {
          return Container();
        }
        return Container();
      },
    );
  }
}


// SliverList listViewModalCart(){
//   return BlocBuilder<ListViewCubit, ListViewState>(
//       builder: (context, state) {
//         if (state is HaveListViewState) {
//           return SliverList(
//             delegate: SliverChildBuilderDelegate(
//               childCount: state.cart.length,
//               (context, index) => ModalMenuFoodCard(
//                 index: index,
//                 onTap: () {},
//                 onUpdatePrice: () {},
//                 onUpdateWeight: () {},
//                 cartModel: state.cart[index],
//               ),
//             ),
//           );
//         } else {
//           return SliverList(delegate: delegate);
//         }
//       },
//     );
// }