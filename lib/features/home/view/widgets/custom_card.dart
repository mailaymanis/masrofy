import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrofy/core/constants/app_assets.dart';
import 'package:masrofy/core/themes/app_colors.dart';
import 'package:masrofy/core/themes/app_sizes.dart';
import 'package:masrofy/core/themes/app_text_styles.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.isDark});
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.all(AppSizes.m),
      decoration: BoxDecoration(
        color: isDark ? AppColors.primaryLight : AppColors.primaryDark,
        borderRadius: BorderRadius.circular(AppSizes.l),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: AppSizes.s,
            children: [
              Icon(
                Icons.remove_red_eye_outlined,
                color: AppColors.textPrimaryDark,
              ),
              Text(
                " الملخص المالي",
                style: AppTextStyles.labelMedium.copyWith(
                  color: AppColors.textPrimaryDark,
                ),
              ),
            ],
          ),
          SizedBox(height: AppSizes.l),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "إجمالي الرصيد",
                    style: AppTextStyles.titleMedium.copyWith(
                      color: AppColors.textPrimaryDark,
                    ),
                  ),
                  SizedBox(height: AppSizes.s),
                  Text(
                    "جنية 12,450",
                    style: AppTextStyles.headlineSmall.copyWith(
                      color: AppColors.textPrimaryDark,
                    ),
                  ),
                ],
              ),
              Image.asset(AppAssets.summery, width: 120.w, height: 120.h),
            ],
          ),
          SizedBox(height: AppSizes.l),
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: 0.3.h,
            color: AppColors.textPrimaryDark,
          ),
          SizedBox(height: AppSizes.m),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "إجمالي المصروفات",
                    style: AppTextStyles.titleSmall.copyWith(
                      color: AppColors.textPrimaryDark,
                    ),
                  ),
                  SizedBox(height: AppSizes.s),
                  Text(
                    "جنية 12,450",
                    style: AppTextStyles.titleMedium.copyWith(
                      color: AppColors.expense,
                    ),
                  ),
                ],
              ),
              Container(
                width: 0.4.w,
                height: 80.h,
                color: AppColors.textPrimaryDark,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "إجمالي الدخل",
                    style: AppTextStyles.titleSmall.copyWith(
                      color: AppColors.textPrimaryDark,
                    ),
                  ),
                  SizedBox(height: AppSizes.s),
                  Text(
                    "جنية 27,750",
                    style: AppTextStyles.titleMedium.copyWith(
                      color: AppColors.income,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
