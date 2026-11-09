import 'package:flutter/material.dart';
import 'package:masrofy/core/themes/app_sizes.dart';
import 'package:masrofy/core/themes/app_text_styles.dart';

class CustomReportsRow extends StatelessWidget {
  const CustomReportsRow({super.key, required this.iconColor});
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu_rounded,
            color: iconColor,
            size: AppSizes.iconL,
          ),
        ),
        Text(
          'الملخص والإحصائيات',
          style: AppTextStyles.titleLarge.copyWith(fontWeight: FontWeight.w900),
        ),
        SizedBox.shrink(),
      ],
    );
  }
}
