import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:masrofy/core/themes/app_colors.dart';
import 'package:masrofy/core/themes/app_sizes.dart';

class CustomExpensesRow extends StatelessWidget {
  const CustomExpensesRow({
    super.key,
    required this.isDark,
    required this.iconColor,
  });
  final bool isDark;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => context.pop(),
          icon: Icon(
            Icons.arrow_back,
            color: isDark
                ? AppColors.backgroundLight
                : AppColors.backgroundDark,
          ),
        ),
        Text(
          ' المصروفات ',
          style: Theme.of(context).textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.w900),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.add_rounded, color: iconColor, size: AppSizes.iconM),
        ),
      ],
    );
  }
}
