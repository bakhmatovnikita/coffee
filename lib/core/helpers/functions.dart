import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/features/data/models/cart/cart_model.dart';
import 'package:cofee/features/domain/entiti/products/product_entiti.dart';
import 'package:cofee/features/presentation/auth/login_view/widgets/login_bottomscheet.dart';
import 'package:cofee/features/presentation/cart/widgets/checkout/view/checkout_bottomsheet.dart';
import 'package:cofee/features/presentation/cart/widgets/checkout/widgets/added_cart/view/added_cart.dart';
import 'package:cofee/features/presentation/cart/widgets/checkout/widgets/delivery/delivery_bottomsheet.dart';
import 'package:cofee/features/presentation/cart/widgets/checkout/widgets/map/view/map.dart';
import 'package:cofee/features/presentation/cart/widgets/checkout/widgets/selected_cart/widgets/payment.dart';
import 'package:cofee/features/presentation/home/widgets/entity_popup.dart';
import 'package:cofee/custom_widgets/custom_button.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:cofee/features/presentation/profile/%20personal_area/view/profile_page.dart';
import 'package:cofee/features/presentation/profile/%20personal_area/widgets/restaurant_bottomsheet.dart';
import 'package:cofee/features/presentation/profile/about_us/view/about_us_bottomsheet.dart';
import 'package:cofee/features/presentation/profile/complaint/view/complaint_page.dart';
import 'package:cofee/features/presentation/profile/edit_profile/view/edit_profile_page.dart';
import 'package:cofee/features/presentation/profile/history/view/history.dart';
import 'package:cofee/features/presentation/profile/history/widgets/edit_order/edit_order.dart';
import 'package:cofee/features/presentation/profile/history/widgets/more/more_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sberbank_acquiring/sberbank_acquiring_core.dart';

import '../../features/presentation/cart/widgets/checkout/widgets/modal_menu_in_cart/view/menu_bottomsheet.dart';
import '../../features/presentation/profile/edit_order/widgets/payment_order_bottomsheet.dart';
import '../../features/presentation/profile/edit_order/widgets/return_order_bottomsheet.dart';
import '../../features/presentation/profile/history/widgets/time_accept/time_accept_bottomsheet.dart';

class Functions {
  final BuildContext context;

  Functions(this.context);
  void showModalNotifications() {
    showMaterialModalBottomSheet(
      animationCurve: Curves.easeInOutQuint,
      elevation: 12,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.2),
      duration: const Duration(milliseconds: 600),
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          height: 600.h,
          decoration: BoxDecoration(
            color: ColorStyles.whiteColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.r),
              topLeft: Radius.circular(30.r),
            ),
          ),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 100.h)),
              SliverToBoxAdapter(
                child: Image.asset(
                  'assets/images/smile.png',
                  width: 80.h,
                  height: 80.h,
                ),
              ),
              SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 16.h),
                    child: CustomText(
                      title: 'Похоже, что тут еще идет разработка',
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 40.h,
                      left: 16.h,
                      right: 16.h,
                    ),
                    child: CustomText(
                      title:
                          'В скором времени мы добавим тут новый функционал, а пока можете посмотреть главную страницу и авторизацию!',
                      fontSize: 16.h,
                      fontWeight: FontWeight.w500,
                      color: ColorStyles.greyTitleColor,
                      centerTitle: true,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 24.h),
                  child: CustomButton(
                    title: 'Перейти к регистрации',
                    onTap: () {
                      Navigator.of(context).pushNamed('/');
                    },
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: CustomButton(
                    onTap: () => Navigator.of(context).pop(),
                    title: 'Вернуться назад',
                    accent: false,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showLoginBottomsheet() {
    showMaterialModalBottomSheet(
      animationCurve: Curves.easeInOutQuint,
      elevation: 12,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.2),
      duration: const Duration(milliseconds: 600),
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return const LoginBottomsheet();
      },
    );
  }

  void showCustomBottomSheet(
      SberbankAcquiring acquiring, String formUrl, OrderStatus? orderStatus, Function() susseccPaid) {
    showCupertinoModalBottomSheet(
        animationCurve: Curves.easeInOutQuint,
        elevation: 12,
        barrierColor: const Color.fromRGBO(0, 0, 0, 0.2),
        duration: const Duration(milliseconds: 600),
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return PaymentBottomsheet(
              acquiring: acquiring, formUrl: formUrl, orderStatus: orderStatus, successPaid: susseccPaid,);
        });
  }

  void showProductEntityBottomsheet(ProductEntiti productEntiti) {
    showMaterialModalBottomSheet(
      animationCurve: Curves.easeInOutQuint,
      elevation: 12,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.2),
      duration: const Duration(milliseconds: 600),
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return EntityPopup(
          productEntiti: productEntiti,
        );
      },
    );
  }

  void showCheckoutBottomsheet(
      List<CartModel> cartModel, double totalAmount, double totalWeigth) {
    showMaterialModalBottomSheet(
        animationCurve: Curves.easeInOutQuint,
        elevation: 12,
        barrierColor: const Color.fromRGBO(0, 0, 0, 0.2),
        duration: const Duration(milliseconds: 600),
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return CheckoutBottomsheet(
            cartModel: cartModel,
            totalAmount: totalAmount,
            totalWeigth: totalWeigth,
          );
        });
  }

  void showCartAddedBottomsheet() {
    showMaterialModalBottomSheet(
        animationCurve: Curves.easeInOutQuint,
        elevation: 12,
        barrierColor: const Color.fromRGBO(0, 0, 0, 0.2),
        duration: const Duration(milliseconds: 600),
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            height: 758.h,
            decoration: BoxDecoration(
              color: const Color(0xffF3F3F3),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16.r),
                topLeft: Radius.circular(16.r),
              ),
            ),
            child: const AddedCart(),
          );
        });
  }

  void showMenuBottomsheet() {
    showCupertinoModalBottomSheet(
        animationCurve: Curves.easeInOutQuint,
        elevation: 12,
        barrierColor: const Color.fromRGBO(0, 0, 0, 0.2),
        duration: const Duration(milliseconds: 600),
        backgroundColor: Colors.transparent,
        context: context,
        enableDrag: false,
        builder: (context) {
          return Container(
            height: 758.h,
            decoration: BoxDecoration(
              color: const Color(0xffF3F3F3),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16.r),
                topLeft: Radius.circular(16.r),
              ),
            ),
            child: const MenuBottomsheet(),
          );
        });
  }

  void showProfileUserBottomSheet() {
    showCupertinoModalBottomSheet(
      animationCurve: Curves.easeInOutQuint,
      elevation: 12,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.2),
      duration: const Duration(milliseconds: 600),
      backgroundColor: const Color(0xffF3F3F3),
      context: context,
      builder: (context) {
        return const ProfilePage();
      },
    );
  }

  void showUserHistoryBottomSheet() {
    showCupertinoModalBottomSheet(
      animationCurve: Curves.easeInOutQuint,
      elevation: 12,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.2),
      duration: const Duration(milliseconds: 600),
      backgroundColor: const Color(0xffF3F3F3),
      context: context,
      builder: (context) {
        return const HistoryPage();
      },
    );
  }

  void showMorePageBottomSheet() {
    showCupertinoModalBottomSheet(
      animationCurve: Curves.easeInOutQuint,
      elevation: 12,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.2),
      duration: const Duration(milliseconds: 600),
      backgroundColor: const Color(0xffF3F3F3),
      context: context,
      builder: (context) {
        return const MorePage();
      },
    );
  }

  void showComplaintPageBottomSheet() {
    showCupertinoModalBottomSheet(
      animationCurve: Curves.easeInOutQuint,
      elevation: 12,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.2),
      duration: const Duration(milliseconds: 600),
      backgroundColor: const Color(0xffF3F3F3),
      context: context,
      builder: (context) {
        return const ComplaintPage();
      },
    );
  }

  void showEditProfilePageBottomSheet() {
    showCupertinoModalBottomSheet(
      animationCurve: Curves.easeInOutQuint,
      elevation: 12,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.2),
      duration: const Duration(milliseconds: 600),
      backgroundColor: const Color(0xffF3F3F3),
      context: context,
      builder: (context) {
        return const EditProfilePage();
      },
    );
  }

  void showDeliveryBottomSheet(
      List<CartModel> cartModel, double totalAmount, double totalWeigth) {
    showCupertinoModalBottomSheet(
      animationCurve: Curves.easeInOutQuint,
      elevation: 12,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.2),
      duration: const Duration(milliseconds: 600),
      backgroundColor: const Color(0xffF3F3F3),
      context: context,
      builder: (context) {
        return DeliveryBottomsheet(
            cartModel: cartModel,
            totalAmount: totalAmount,
            totalWeigth: totalWeigth);
      },
    );
  }

  void showRestaurantBottomSheet() {
    showCupertinoModalBottomSheet(
      animationCurve: Curves.easeInOutQuint,
      elevation: 12,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.2),
      duration: const Duration(milliseconds: 600),
      backgroundColor: const Color(0xffF3F3F3),
      context: context,
      builder: (context) {
        return const RestaurantBottomsheet();
      },
    );
  }

  void showEditOrderBottomSheet() {
    showCupertinoModalBottomSheet(
      animationCurve: Curves.easeInOutQuint,
      elevation: 12,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.2),
      duration: const Duration(milliseconds: 600),
      backgroundColor: const Color(0xffF3F3F3),
      context: context,
      builder: (context) {
        return const ReturnOrderBottomSheet();
      },
    );
  }

  void showPaymentOrderBottomsheet() {
    showCupertinoModalBottomSheet(
      animationCurve: Curves.easeInOutQuint,
      elevation: 12,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.2),
      duration: const Duration(milliseconds: 600),
      backgroundColor: const Color(0xffF3F3F3),
      context: context,
      builder: (context) => const PaymentOrderBottomsheet(),
    );
  }

  void showAboutUsBottomsheet() {
    showCupertinoModalBottomSheet(
      animationCurve: Curves.easeInOutQuint,
      elevation: 12,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.2),
      duration: const Duration(milliseconds: 600),
      backgroundColor: const Color(0xffF3F3F3),
      context: context,
      builder: (context) => const AboutUsBottomsheet(),
    );
  }

  void showEditUserOrderBottomSheet() {
    showCupertinoModalBottomSheet(
      animationCurve: Curves.easeInOutQuint,
      elevation: 12,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.2),
      duration: const Duration(milliseconds: 600),
      backgroundColor: const Color(0xffF3F3F3),
      context: context,
      builder: (context) => const EditOrderBottomSheet(),
    );
  }

  void showTimeAcceptBottomsheet() {
    showCupertinoModalBottomSheet(
      animationCurve: Curves.easeInOutQuint,
      elevation: 12,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.2),
      duration: const Duration(milliseconds: 600),
      backgroundColor: const Color(0xffF3F3F3),
      context: context,
      builder: (context) => const TimeAcceptBottomsheet(),
    );
  }

  void showMapPageBottomsheet(
      List<CartModel> cartModel, double totalAmount, double totalWeigth) {
    showCupertinoModalBottomSheet(
      animationCurve: Curves.easeInOutQuint,
      elevation: 12,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.2),
      duration: const Duration(milliseconds: 600),
      backgroundColor: const Color(0xffF3F3F3),
      enableDrag: false,
      context: context,
      builder: (context) => MapPage(
        cartModel: cartModel,
        totalAmount: totalAmount,
        totalWeigth: totalWeigth,
      ),
    );
  }
}
