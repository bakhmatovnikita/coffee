import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:cofee/features/domain/entiti/products/groups_entiti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCardWidget extends StatefulWidget {
  final bool isSelected;
  final GroupsEntiti groupsEntiti;
  const CategoryCardWidget(
      {super.key, required this.isSelected, required this.groupsEntiti});

  @override
  State<CategoryCardWidget> createState() => _CategoryCardWidgetState();
}

class _CategoryCardWidgetState extends State<CategoryCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color:
              widget.isSelected ? ColorStyles.accentColor : Colors.transparent,
          width: 2.h,
        ),
        color: ColorStyles.whiteColor,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: CustomText(
        title: widget.groupsEntiti.name,
        fontWeight: widget.isSelected ? FontWeight.w500 : FontWeight.w500,
        color: widget.isSelected
            ? ColorStyles.blackColor
            : ColorStyles.greyTitleColor,
        fontSize: 17,
      ),
    );
  }
}
