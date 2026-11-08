import 'package:flutter/material.dart';
import 'package:masrofy/core/themes/app_colors.dart';
import 'package:masrofy/core/themes/app_sizes.dart';

class ExpensesListCard extends StatelessWidget {
  const ExpensesListCard({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });
  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : Colors.white,
        borderRadius: BorderRadius.circular(AppSizes.rL),
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
        ),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemCount,
        separatorBuilder: (context, index) => Divider(
          height: 1,
          thickness: 0.5,
          color: isDark ? AppColors.dividerDark : AppColors.dividerLight,
        ),
        itemBuilder: itemBuilder,
      ),
    );
  }
}
