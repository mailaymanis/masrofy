import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:masrofy/core/routes/app_routes.dart';
import 'package:masrofy/core/themes/app_colors.dart';
import 'package:masrofy/core/themes/app_sizes.dart';
import 'package:masrofy/core/themes/app_text_styles.dart';

class QuickTools extends StatelessWidget {
  const QuickTools({super.key, required this.isDark});
  final bool isDark;
  @override
  Widget build(BuildContext context) {
    final tools = [
      {
        'label': "الأهداف",
        'icon': Icons.track_changes_rounded,
        'color': AppColors.purple,
        'route': AppRoutes.goals,
      },
      {
        'label': "الديون",
        'icon': Icons.account_balance_wallet_rounded,
        'color': AppColors.warning,
        'route': AppRoutes.debts,
      },
      {
        'label': "الدخل",
        'icon': Icons.trending_up_rounded,
        'color': AppColors.income,
        'route': AppRoutes.income,
      },
      {
        'label': "المصاريف",
        'icon': Icons.shopping_bag_rounded,
        'color': AppColors.expense,
        'route': AppRoutes.expenses,
      },
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            "أدوات سريعه",
            style: AppTextStyles.titleMedium.copyWith(
              color: isDark
                  ? AppColors.textPrimaryDark
                  : AppColors.textPrimaryLight,
            ),
          ),
        ),
        SizedBox(height: AppSizes.s),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: tools.map((tool) {
            final color = tool['color'] as Color;
            final route = tool['route'] as String;
            return Container(
              width: 76.w,
              height: 80.h,
              decoration: BoxDecoration(
                color: isDark ? AppColors.cardDark : Colors.white,
                borderRadius: BorderRadius.circular(AppSizes.rL),
                border: Border.all(
                  color: isDark ? AppColors.borderDark : AppColors.grey200,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: InkWell(
                onTap: () {
                  if (route.isNotEmpty) {
                    context.push(route);
                  }
                },
                borderRadius: BorderRadius.circular(AppSizes.rL),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 44.w,
                      height: 44.h,
                      decoration: BoxDecoration(
                        color: color.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        tool['icon'] as IconData,
                        color: color,
                        size: AppSizes.iconM,
                      ),
                    ),
                    SizedBox(height: AppSizes.xs),
                    Text(
                      tool['label'] as String,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.grey700,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
