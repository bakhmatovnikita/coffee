import 'dart:async';

import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/core/helpers/functions.dart';
import 'package:cofee/core/helpers/images.dart';
import 'package:cofee/core/helpers/location.dart';
import 'package:cofee/custom_widgets/custom_button.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:cofee/custom_widgets/switch_button.dart';
import 'package:cofee/features/presentation/cart/widgets/checkout/widgets/map/widgets/user_comments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../../../../../../custom_widgets/push_error.dart';
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
  final Completer<YandexMapController> _completer = Completer();
  CameraPosition? pos;
  Position? position;
  YandexMapController? mapController;
  @override
  void initState() {
    LocationGeo().checkPermission();
    super.initState();
  }

  void _jumpToPoint(Point point) async {
    if (await LocationGeo().checkPermission()) {
      if (mapController != null) {
        await mapController!.moveCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: Point(
                latitude: point.latitude,
                longitude: point.longitude,
              ),
              zoom: 17,
              tilt: 0,
            ),
          ),
        );
      }
    }
  }

  void _getPosition() async {
    if (await LocationGeo().checkPermission()) {
      var position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      _completer.complete(mapController);
      _jumpToPoint(
        Point(
          latitude: position.latitude,
          longitude: position.longitude,
        ),
      );
    }
  }

  void zoomIn() => mapController!.moveCamera(
        CameraUpdate.zoomIn(),
        animation:
            const MapAnimation(type: MapAnimationType.linear, duration: 0.4),
      );

  void zoomOut() => mapController!.moveCamera(
        CameraUpdate.zoomOut(),
        animation:
            const MapAnimation(type: MapAnimationType.linear, duration: 0.4),
      );

  final double lat = 0.0;
  final double long = 0.0;
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
  String address = '';
  String errorAddress = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(17.r),
                      child: YandexMap(
                        onMapCreated: (controller) {
                          mapController = controller;
                          _getPosition();
                        },
                        onCameraPositionChanged:
                            (cameraPosition, reason, finished) async {
                          pos = cameraPosition;

                          if (pos != null && finished) {
                            if (await LocationGeo().checkPermission()) {
                              SearchResultWithSession adress =
                                  YandexSearch.searchByPoint(
                                point: Point(
                                  latitude: pos!.target.latitude,
                                  longitude: pos!.target.longitude,
                                ),
                                searchOptions: const SearchOptions(),
                              );
                              final value = await adress.result;

                              address = value.items!.first.name;

                              final house = value
                                  .items!
                                  .first
                                  .toponymMetadata
                                  ?.address
                                  .addressComponents[SearchComponentKind.house];

                              if (house == null) {
                                errorAddress = 'Ошибка';
                              }
                            }
                          }

                          setState(() {});
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 50.h),
                        child: const Icon(
                          Icons.location_pin,
                          size: 40,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.only(top: 80.h, right: 10.w),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () => zoomIn(),
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.add),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            GestureDetector(
                              onTap: () => zoomOut(),
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.remove),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
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
                        title: address,
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
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
                          ),
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
                    onTap: () async {
                      if (address.isEmpty) {
                        SmartDialog.show(
                          animationType: SmartAnimationType.fade,
                          maskColor: Colors.transparent,
                          displayTime: const Duration(seconds: 3),
                          clickMaskDismiss: false,
                          usePenetrate: true,
                          builder: (context) => const SafeArea(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: PushError(
                                title: 'Не выбран адресс доставки',
                              ),
                            ),
                          ),
                        );
                      } else {
                        // Navigator.of(context).pop();
                        Navigator.of(context).pop();

                        Functions(context).showDeliveryBottomSheet(
                          widget.cartModel,
                          widget.totalAmount,
                          widget.totalWeigth,
                        );
                      }
                    }),
              )
            ],
          ),
        ],
      ),
    );
  }
}
