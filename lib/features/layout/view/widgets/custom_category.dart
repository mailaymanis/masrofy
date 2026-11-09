import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrofy/core/themes/app_colors.dart';
import 'package:masrofy/core/themes/app_sizes.dart';
import 'package:masrofy/core/themes/app_text_styles.dart';

class CategoryLegend extends StatelessWidget {
  const CategoryLegend({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final categories = [
      {
        'label': 'المواصلات',
        'color': AppColors.blue,
        'percentage': '25%',
        'amount': 'EGP 3,850',
      },
      {
        'label': 'الطعام',
        'color': AppColors.expense,
        'percentage': '30%',
        'amount': 'EGP 4,620',
      },
      {
        'label': 'الفواتير',
        'color': AppColors.accent,
        'percentage': '15%',
        'amount': 'EGP 2,310',
      },
      {
        'label': 'تسوق',
        'color': AppColors.purple,
        'percentage': '12%',
        'amount': 'EGP 1,848',
      },
      {
        'label': 'ترفيه',
        'color': AppColors.orange,
        'percentage': '10%',
        'amount': 'EGP 1,540',
      },
      {
        'label': 'أخرى',
        'color': AppColors.grey400,
        'percentage': '8%',
        'amount': 'EGP 1,232',
      },
    ];

    return Column(
      children: categories.map((cat) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 6.h),
          child: Row(
            children: [
              // Color dot
              Container(
                width: 10.w,
                height: 10.h,
                decoration: BoxDecoration(
                  color: cat['color'] as Color,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: AppSizes.s),
              // Category name
              Expanded(
                child: Text(
                  cat['label'] as String,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              // Percentage
              Text(
                cat['percentage'] as String,
                style: AppTextStyles.bodySmall.copyWith(
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: AppSizes.l),
              // Amount
              Text(
                cat['amount'] as String,
                style: AppTextStyles.bodySmall.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
