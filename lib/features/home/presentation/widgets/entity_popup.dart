import 'package:cached_network_image/cached_network_image.dart';
import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/features/auth/presentation/domain/entiti/products/product_entiti.dart';
import 'package:cofee/features/widgets/custom_button.dart';
import 'package:cofee/features/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:octo_image/octo_image.dart';
import 'package:scale_button/scale_button.dart';

class EntityPopup extends StatelessWidget {
  final ProductEntiti productEntiti;
  const EntityPopup({super.key, required this.productEntiti});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(30.r),
        topLeft: Radius.circular(30.r),
      ),
      child: Container(
        height: 650.h,
        decoration: BoxDecoration(
          color: ColorStyles.whiteColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.r),
            topLeft: Radius.circular(30.r),
          ),
        ),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 370.h,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    if (productEntiti.imageLink.isNotEmpty)
                      SizedBox(
                        height: 350.h,
                        width: MediaQuery.of(context).size.width,
                        child: PageView.builder(
                          // shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const ClampingScrollPhysics(),
                          // padding: EdgeInsets.zero,
                          itemCount: productEntiti.imageLink.length,
                          itemBuilder: (context, index) => SizedBox(
                            height: 350.h,
                            width: MediaQuery.of(context).size.width,
                            child: OctoImage(
                              image: CachedNetworkImageProvider(
                                productEntiti.imageLink.isEmpty
                                    ? "https://www.imagetext.ru/pics_max/images_3162.gif"
                                    : productEntiti.imageLink[index],
                              ),
                              placeholderBuilder: OctoPlaceholder.blurHash(
                                'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                              ),
                              height: 350.h,
                              width: MediaQuery.of(context).size.width,
                              memCacheHeight: 0,
                              memCacheWidth: 0,
                              filterQuality: FilterQuality.low,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    else
                      Container(
                        width: 350.h,
                        height: 350.h,
                        padding: EdgeInsets.all(40.h),
                        child: Image.asset('assets/images/splash.png'),
                      ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ScaleButton(
                        bound: 0.05,
                        duration: const Duration(milliseconds: 200),
                        child: Container(
                          height: 45.h,
                          width: 140.h,
                          margin: EdgeInsets.only(right: 15.w, left: 15.w),
                          decoration: BoxDecoration(
                            color: ColorStyles.whiteColor.withOpacity(1),
                            borderRadius: BorderRadius.circular(15.r),
                            boxShadow: const [
                              BoxShadow(
                                color: ColorStyles.accentColor,
                                blurRadius: 10,
                                spreadRadius: 0.01,
                              )
                            ],
                          ),
                          alignment: Alignment.center,
                          child: CustomText(
                            title:
                                '${productEntiti.sizePrices[0].price.currentPrice} ₽'
                                    .toUpperCase(),
                            fontSize: 25.h,
                            fontWeight: FontWeight.w600,
                            color: ColorStyles.accentColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: productEntiti.name,
                        fontSize: 22.h,
                      ),
                      const SizedBox(height: 15),
                      CustomText(
                        title:
                            '${productEntiti.fatFullAmount.toStringAsFixed(2)} калл',
                        fontSize: 14.h,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(height: 4.h),
                      CustomText(
                        title: '${productEntiti.weight.toStringAsFixed(1)} гр',
                        fontSize: 14.h,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(height: 4.h),
                      CustomText(
                        title:
                            'БЖУ: ${productEntiti.proteinsFullAmount.toStringAsFixed(1)}/${productEntiti.fatFullAmount.toStringAsFixed(1)}/${productEntiti.carbohydratesFullAmount.toStringAsFixed(1)}',
                        fontSize: 14.h,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                title: 'Добавить в корзину',
                onTap: () => Navigator.pop(context),
              ),
              // const SizedBox(height: 600),
            ],
          ),
        ),
      ),
    );
  }
}
