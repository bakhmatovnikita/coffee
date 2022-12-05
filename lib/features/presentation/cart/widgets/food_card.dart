import 'package:cached_network_image/cached_network_image.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class FoodCard extends StatefulWidget {
  final String name;
  final String weight;
  final String fatFullAmount;
  final String proteinsFullAmount;
  final String carbohydratesFullAmount;
  final double sizePrices;
  final List<dynamic> imageLink;
  const FoodCard({
    super.key,
    required this.name,
    required this.weight,
    required this.fatFullAmount,
    required this.proteinsFullAmount,
    required this.carbohydratesFullAmount,
    required this.sizePrices,
    required this.imageLink,
  });

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            children: [
              // CachedNetworkImage(
              //   imageUrl: widget.imageLink[0],
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(title: widget.name),
                  CustomText(title: widget.fatFullAmount),
                  CustomText(title: widget.weight),
                  CustomText(
                    title:
                        'БЖУ: ${widget.proteinsFullAmount}/${widget.weight}/${widget.carbohydratesFullAmount}',
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [],
          )
        ],
      ),
    );
  }
}
