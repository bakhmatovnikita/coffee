import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({super.key});

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: const Icon(
            Icons.close_rounded,
            color: ColorStyles.accentColor,
          ),
          title: CustomText(
            title: 'Статус заказа',
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
      ],
    );
  }
}
