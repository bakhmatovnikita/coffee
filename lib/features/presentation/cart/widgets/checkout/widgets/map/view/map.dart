import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/core/helpers/functions.dart';
import 'package:cofee/core/helpers/images.dart';
import 'package:cofee/custom_widgets/custom_button.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:cofee/custom_widgets/switch_button.dart';
import 'package:cofee/features/presentation/cart/widgets/checkout/widgets/map/widgets/user_comments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yandex_geocoder/yandex_geocoder.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../../../../../data/models/cart/cart_model.dart';
import '../widgets/user_data_card.dart';

class MapPage extends StatefulWidget {
  final List<CartModel> cartModel;
  final double totalAmount;
  final double totalWeigth;
  const MapPage(
      {super.key,
      required this.cartModel,
      required this.totalAmount,
      required this.totalWeigth});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  // getCurrentPosition()  async {
  //   LocationPermission permission = await Geolocator.checkPermission();
  //   bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();
  //   if(permission == LocationPermission.denied  permission == LocationPermission.deniedForever  !isLocationEnabled){
  //     permission = await Geolocator.requestPermission();
  //   }
  //   if(permission != LocationPermission.denied && permission != LocationPermission.deniedForever){
  //     if(isLocationEnabled){
  //       Position _position = await Geolocator.getCurrentPosition();

  //       yandexMapController!.moveCamera(
  //         yandexMap.CameraUpdate.newCameraPosition(
  //           yandexMap.CameraPosition(target: yandexMap.Point(latitude: _position.latitude, longitude: _position.longitude))
  //         )
  //       );
  //     }
  //   }
  // }

  final TextEditingController controllerKv = TextEditingController();
  final TextEditingController controllerPod = TextEditingController();
  final TextEditingController controllerFloor = TextEditingController();
  final TextEditingController controllerDomof = TextEditingController();
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();

  bool privateHouse = false;
  bool orderToRelatives = false;
  bool info = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffF3F3F3),
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Image.asset(
                  Img.berry,
                  alignment: Alignment.bottomLeft,
                  height: 95.h,
                  width: 115.w,
                ),
              ),
            ),
            ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 21.5.h,
                      left: 25.5.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(SvgImg.goBackk),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        title: 'Укажите адрес доставки',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorStyles.blackColor,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 207.h,
                  margin: EdgeInsets.symmetric(horizontal: 8.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17.r),
                    
                  ),
                  child: const YandexMap(
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 8.w, left: 8.w, top: 3.h),
                  decoration: BoxDecoration(
                    color: ColorStyles.whiteColor,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 16.h,
                      bottom: 16.h,
                      left: 16.w,
                      right: 32.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          title: 'Улица и дом:',
                          color: ColorStyles.greyTitleColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        CustomText(
                          title: 'Ростов-на-Дону, Батуринская улица, 157/31',
                          color: ColorStyles.greyTitleColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 19.w, top: 13.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomText(
                        title: "Частный дом",
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorStyles.greyTitleColor,
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      SwitchBtn(
                        onChange: (value) {
                          setState(() {
                            privateHouse = value;
                          });
                        },
                        value: privateHouse,
                      ),
                    ],
                  ),
                ),
                privateHouse
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 16.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            UserDataCard(
                              title: 'Кв/Офис',
                              controller: controllerKv,
                            ),
                            UserDataCard(
                              title: 'Подъезд',
                              controller: controllerPod,
                            ),
                            UserDataCard(
                              title: 'Этаж',
                              controller: controllerFloor,
                            ),
                            UserDataCard(
                              title: 'Домофон',
                              controller: controllerDomof,
                            ),
                          ],
                        ),
                      )
                    : Container(),
                UserCommentsWidget(
                  title: 'Напишите что важно учесть при доставке',
                  controller: controller1,
                  privateHouse: privateHouse,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 19.w, top: 13.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomText(
                        title: "Заказ Близким",
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorStyles.greyTitleColor,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (info) {
                              info = false;
                            } else {
                              info = true;
                            }
                          });
                        },
                        child: Container(
                          height: 27.h,
                          width: 27.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorStyles.accentColor,
                          ),
                          child: Center(
                            child: CustomText(
                              title: '?',
                              fontSize: 20,
                              color: ColorStyles.greyTitleColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      SwitchBtn(
                        onChange: (value) {
                          setState(() {
                            orderToRelatives = value;
                          });
                        },
                        value: orderToRelatives,
                      ),
                    ],
                  ),
                ),
                info
                    ? Container(
                        height: 231.h,
                        margin:
                            EdgeInsets.only(right: 16.w, left: 16.w, top: 30.h),
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: ColorStyles.whiteColor,
                        ),
                        child: Column(
                          children: [
                            CustomText(
                              title: 'Номер для связи с курьером',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            CustomText(
                              title:
                                  'Доставку примете не вы? Можете оставить другой номер:\n\nОтправим на него смс с телефоном курьера и временем доставки\n\nПередадим номер курьеру, что бы он смог уточнить детали адреса',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: ColorStyles.greyTitleColor,
                            )
                          ],
                        ),
                      )
                    : Container(),
                orderToRelatives
                    ? Padding(
                        padding: EdgeInsets.symmetric(vertical: 17.h),
                        child: Column(
                          children: [
                            UserCommentsWidget(
                              title: 'Номер телефона получателя',
                              controller: controller2,
                              privateHouse: privateHouse,
                            ),
                            SizedBox(
                              height: 11.h,
                            ),
                            UserCommentsWidget(
                              title: 'Имя получателя',
                              controller: controller3,
                              privateHouse: privateHouse,
                            ),
                          ],
                        ),
                      )
                    : Container(),
                Padding(
                  padding: EdgeInsets.only(top: 73.h, bottom: 31.h),
                  child: CustomButton(
                      title: 'Готово',
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        Functions(context).showDeliveryBottomSheet(
                          widget.cartModel,
                          widget.totalAmount,
                          widget.totalWeigth,
                        );
                      }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
