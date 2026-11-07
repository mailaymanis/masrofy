import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrofy/core/themes/app_colors.dart';
import 'package:masrofy/core/themes/app_sizes.dart';

class GoalsTabCard extends StatelessWidget {
  const GoalsTabCard({
    super.key,
    required this.title,
    required this.current,
    required this.target,
    required this.percentage,
    required this.progressValue,
    required this.icon,
    required this.color,
    required this.isDark,
  });
  final String title;
  final String current;
  final String target;
  final int percentage;
  final double progressValue;
  final IconData icon;
  final Color color;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.l),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : Colors.white,
        borderRadius: BorderRadius.circular(AppSizes.rL),
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 44.w,
                height: 44.h,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Icon(icon, color: color, size: AppSizes.iconM),
              ),
              SizedBox(width: AppSizes.m),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleMedium),
                  4.verticalSpace,
                  Text(
                    '$current EGP',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  2.verticalSpace,
                  Text(
                    'من $target EGP',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
                    ),
                  ),
                ],
              ),
            ],
          ),

          Row(
            children: [
              Text(
                '$percentage%',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
              ),
              8.horizontalSpace,
              SizedBox(
                width: 80.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: LinearProgressIndicator(
                    value: progressValue,
                    minHeight: 6.h,
                    backgroundColor: isDark
                        ? AppColors.borderDark
                        : AppColors.grey100,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
