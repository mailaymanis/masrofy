import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrofy/core/themes/app_colors.dart';
import 'package:masrofy/core/themes/app_sizes.dart';
import 'package:masrofy/core/themes/app_text_styles.dart';

class OverviewSection extends StatelessWidget {
  const OverviewSection({super.key, required this.isDark});
  final bool isDark;
  @override
  Widget build(BuildContext context) {
    final overviewItems = [
      {
        'title': "مصاريف اليوم",
        'value': '460',
        'currency': 'ج م',
        'icon': Icons.account_balance_wallet_outlined,
        'hasFilter': true,
        'filterColor': AppColors.error,
        'color': AppColors.error,
        'valueColor': isDark ? AppColors.textPrimaryDark : AppColors.grey800,
      },
      {
        'title': "دخل الشهر الحالي",
        'value': '8,250',
        'currency': 'ج م',
        'icon': Icons.account_balance_wallet_outlined,
        'hasFilter': false,
        'color': AppColors.success,
        'valueColor': AppColors.success,
      },
      {
        'title': "إجمالي الديون",
        'value': '5,200',
        'currency': 'ج م',
        'icon': Icons.account_balance_wallet_outlined,
        'hasFilter': true,
        'filterColor': AppColors.warning,
        'color': AppColors.warning,
        'valueColor': AppColors.error,
      },
      {
        'title': "الأهداف المكتملة",
        'value': '3 / 5',
        'currency': '',
        'icon': Icons.track_changes_rounded,
        'hasFilter': false,
        'color': AppColors.saving,
        'valueColor': AppColors.saving,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            "نظرة عامة",
            style: AppTextStyles.titleMedium.copyWith(
              color: isDark
                  ? AppColors.textPrimaryDark
                  : AppColors.textPrimaryLight,
            ),
          ),
        ),
        SizedBox(height: AppSizes.s),
        Container(
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
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: overviewItems.length,
            separatorBuilder: (context, index) => Divider(
              height: 1,
              thickness: 0.5,
              color: isDark ? AppColors.dividerDark : AppColors.grey200,
            ),
            itemBuilder: (context, index) {
              final item = overviewItems[index];
              Widget iconWidget = Container(
                width: 36.w,
                height: 36.h,
                decoration: BoxDecoration(
                  color: (item['color'] as Color).withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(AppSizes.rL),
                ),
                child: Icon(
                  item['icon'] as IconData,
                  size: 20.sp,
                  color: item['color'] as Color,
                ),
              );
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.m,
                  vertical: 14.h,
                ),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 32.w,
                          height: 32.h,
                          decoration: BoxDecoration(
                            color: (item['color'] as Color).withValues(
                              alpha: 0.08,
                            ),
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: iconWidget,
                        ),
                        12.horizontalSpace,
                        Text(
                          item['title'] as String,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: isDark
                                    ? AppColors.textPrimaryDark
                                    : AppColors.grey700,
                              ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          item['value'] as String,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(color: item['valueColor'] as Color),
                        ),
                        if ((item['currency'] as String).isNotEmpty) ...[
                          4.horizontalSpace,
                          Text(
                            item['currency'] as String,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: item['valueColor'] as Color),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
