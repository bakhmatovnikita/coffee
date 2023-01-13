import 'dart:async';

import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/custom_widgets/custom_button.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:cofee/features/data/models/cart/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yandex_geocoder/yandex_geocoder.dart';

import '../widgets/shipping_options.dart';

class WayOfObtaining extends StatefulWidget {
  final List<CartModel> cartModel;
  final double totalAmount;
  final double totalWeigth;
  final PageController pageController;
  const WayOfObtaining(
      {Key? key,
      required this.pageController,
      required this.cartModel,
      required this.totalAmount,
      required this.totalWeigth})
      : super(key: key);

  @override
  State<WayOfObtaining> createState() => _WayOfObtainingState();
}

class _WayOfObtainingState extends State<WayOfObtaining> {
  List<Map<String, dynamic>> wayOfObtaining = [
    {
      'isSelected': true,
      'title': "На подносе",
    },
    {
      'isSelected': true,
      'title': "В контейнере",
    },
    {
      'isSelected': true,
      'title': "Доставка",
    },
  ];
  final streamController = StreamController<int>();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      initialData: 0,
      stream: streamController.stream,
      builder: (context, snapshot) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 16.w, left: 16.w, bottom: 56.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    title: 'Шаг 2',
                    color: ColorStyles.greyTitleColor,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomText(
                    title: 'Выберите способ получения заказа',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 200.h,
              child: ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: wayOfObtaining.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => streamController.sink.add(index),
                  child: ShippingOptions(
                    title: wayOfObtaining[index]['title'],
                    isSelected: snapshot.data! == index
                        ? wayOfObtaining[index]['isSelected'] = true
                        : wayOfObtaining[index]['isSelected'] = false,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 23),
              child: CustomButton(
                  title: 'Далее',
                  onTap: () async {
                    String address = 'null';
                    String latLong = 'null';
                    setState(() {});
                    final YandexGeocoder geocoder = YandexGeocoder(
                        apiKey: '280d67e0-e9e9-428f-baee-cd11699581f7');
                    final GeocodeResponse geocodeFromPoint =
                        await geocoder.getGeocode(GeocodeRequest(
                      geocode: PointGeocode(
                          latitude: 55.771899, longitude: 37.597576),
                      lang: Lang.enEn,
                    ));
                    address =
                        geocodeFromPoint.firstAddress?.formatted ?? 'null';
                    final GeocodeResponse _latLong = await geocoder.getGeocode(
                      GeocodeRequest(
                        geocode: AddressGeocode(
                          address: 'Москва, 4-я Тверская-Ямская улица, 7',
                        ),
                      ),
                    );
                    latLong = _latLong.firstPoint?.pos ?? 'null';

                    setState(() {});
                    // if (geocodeFromPoint
                    //             .response!
                    //             .geoObjectCollection!
                    //             .metaDataProperty!
                    //             .geocoderResponseMetaData!
                    //             .found !=
                    //         '0' &&
                    //     geocodeFromPoint.firstAddress != null &&
                    //     geocodeFromPoint.firstAddress!.components != null) {
                    //   geocodeFromPoint.firstAddress!.components!
                    //       .forEach((component) {
                    //     if(component.kind == KindResponse.locality){
                    //       cityController.text = component.name!;
                    //     }
                    //     if(component.kind == KindResponse.street){
                    //       streetController.text = component.name!;
                    //     }
                    //     if(component.kind == KindResponse.house){
                    //       homeNumberController.text = component.name!;
                    //     }
                    //   });
                    // }
                    if (wayOfObtaining[2]['isSelected']) {
                      Navigator.pushNamed(context, '/MapView', arguments: {
                        'cartModel': widget.cartModel,
                        "totalWeigth": widget.totalWeigth,
                        "totalAmount": widget.totalAmount,
                      });
                    } else {
                      setState(() {
                        widget.pageController.nextPage(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeInOutQuint,
                        );
                      });
                    }
                  }),
            )
          ],
        );
      },
    );
  }
}
