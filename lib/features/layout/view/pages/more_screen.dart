import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:masrofy/core/routes/app_routes.dart';
import 'package:masrofy/core/themes/app_colors.dart';
import 'package:masrofy/core/themes/app_sizes.dart';
import 'package:masrofy/core/themes/app_text_styles.dart';
import 'package:masrofy/core/themes/theme_mode_provider.dart';
import 'package:masrofy/core/widgets/custom_app_scaffold.dart';

class MoreScreen extends ConsumerWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final currentThemeMode = ref.watch(themeModeProvider);

    return CustomAppScaffold(
      isDark: isDark,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: AppSizes.xxl,
            left: AppSizes.l,
            right: AppSizes.l,
          ),
          child: Column(
            children: [
              Text("المزيد", style: AppTextStyles.titleLarge),
              SizedBox(height: AppSizes.s),
              // Profile Card Header
              _buildProfileCard(context),
              SizedBox(height: AppSizes.l),

              // Settings section list
              _buildSettingsSection(
                context: context,
                title: 'تغيير المظهر',
                items: [
                  _buildThemeSelectorTile(context, ref, currentThemeMode),
                  _buildLanguageSelectorTile(context),
                ],
              ),

              SizedBox(height: AppSizes.l),

              _buildSettingsSection(
                context: context,
                title: "الملف الشخصي",
                items: [_buildLogoutTile(context)],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.all(AppSizes.m),
      decoration: BoxDecoration(
        gradient: AppColors.walletGradient,
        borderRadius: BorderRadius.circular(AppSizes.rXL),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.25),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          // User Avatar Icon / Photo placeholder
          CircleAvatar(
            radius: 30.r,
            backgroundColor: Colors.white.withValues(alpha: 0.25),
            child: Icon(Icons.person_rounded, size: AppSizes.iconXL),
          ),
          SizedBox(width: AppSizes.m),
          // User Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("ايمن محمد", style: AppTextStyles.titleMedium),
                SizedBox(height: 4.h),
                Text(
                  "aymanmohameda@gmail.com",
                  style: AppTextStyles.bodySmall.copyWith(
                    color: Colors.white.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection({
    required BuildContext context,
    required String title,
    required List<Widget> items,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.bodyMedium.copyWith(
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: AppSizes.s),
        Container(
          decoration: BoxDecoration(
            color: isDark ? AppColors.cardDark : Colors.white,
            borderRadius: BorderRadius.circular(AppSizes.rL),
            border: Border.all(
              color: isDark ? AppColors.borderDark : AppColors.borderLight,
            ),
          ),
          child: Column(children: items),
        ),
      ],
    );
  }

  Widget _buildThemeSelectorTile(
    BuildContext context,
    WidgetRef ref,
    ThemeMode currentMode,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    String modeName = "تلقائي";
    IconData modeIcon = Icons.settings_brightness_rounded;

    if (currentMode == ThemeMode.light) {
      modeName = "المظهر الفاتح";
      modeIcon = Icons.light_mode_rounded;
    } else if (currentMode == ThemeMode.dark) {
      modeName = "المظهر الداكن";
      modeIcon = Icons.dark_mode_rounded;
    }

    return ListTile(
      leading: Icon(
        Icons.arrow_back_ios_new_rounded,
        size: AppSizes.iconXS,
        color: isDark
            ? AppColors.textSecondaryDark
            : AppColors.textSecondaryLight,
      ),
      title: Row(
        children: [
          Expanded(
            child: Text(
              "تغيير المظهر",
              style: AppTextStyles.bodyLarge.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.right,
            ),
          ),
          SizedBox(height: AppSizes.m),
          Text(
            modeName,
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.primary),
          ),
        ],
      ),
      trailing: Container(
        padding: EdgeInsets.all(AppSizes.s),
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(modeIcon, color: AppColors.primary, size: AppSizes.iconS),
      ),
      onTap: () => _showThemeSelectionSheet(context, ref, currentMode),
    );
  }

  Widget _buildLanguageSelectorTile(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final currentLocale = context.locale.languageCode;
    final isArabic = currentLocale == 'ar';

    return ListTile(
      leading: Icon(
        Icons.arrow_back_ios_new_rounded,
        size: AppSizes.iconXS,
        color: isDark
            ? AppColors.textSecondaryDark
            : AppColors.textSecondaryLight,
      ),
      title: Row(
        children: [
          Expanded(
            child: Text(
              "تغيير اللغه",
              style: AppTextStyles.bodyLarge.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.right,
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            isArabic ? 'العربية' : 'English',
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.primary),
          ),
        ],
      ),
      trailing: Container(
        padding: EdgeInsets.all(AppSizes.s),
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.language_rounded,
          color: AppColors.primary,
          size: AppSizes.iconS,
        ),
      ),
      onTap: () {
        final targetLocale = isArabic ? const Locale('en') : const Locale('ar');
        context.setLocale(targetLocale);
      },
    );
  }

  Widget _buildLogoutTile(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return ListTile(
      leading: Icon(
        Icons.arrow_back_ios_new_rounded,
        size: AppSizes.iconXS,
        color: isDark
            ? AppColors.textSecondaryDark
            : AppColors.textSecondaryLight,
      ),
      title: Align(
        alignment: Alignment.centerRight,
        child: Text(
          "تسجيل الخروج",
          style: AppTextStyles.bodyLarge.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.error,
          ),
        ),
      ),
      trailing: Container(
        padding: EdgeInsets.all(AppSizes.s),
        decoration: BoxDecoration(
          color: AppColors.error.withValues(alpha: 0.1),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.logout_rounded,
          color: AppColors.error,
          size: 20,
        ),
      ),
      onTap: () {
        context.go(AppRoutes.welcomeAuth); // navigate to login
      },
    );
  }

  void _showThemeSelectionSheet(
    BuildContext context,
    WidgetRef ref,
    ThemeMode currentMode,
  ) {
    //final isDark = Theme.of(context).brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "تغيير المظهر",
                style: AppTextStyles.titleMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.h),
              _buildThemeOption(
                context: context,
                ref: ref,
                title: "تلقائي",
                mode: ThemeMode.system,
                selected: currentMode == ThemeMode.system,
              ),
              const Divider(),
              _buildThemeOption(
                context: context,
                ref: ref,
                title: "المظهر الفاتح",
                mode: ThemeMode.light,
                selected: currentMode == ThemeMode.light,
              ),
              const Divider(),
              _buildThemeOption(
                context: context,
                ref: ref,
                title: "المظهر الداكن",
                mode: ThemeMode.dark,
                selected: currentMode == ThemeMode.dark,
              ),
              SizedBox(height: 16.h),
            ],
          ),
        );
      },
    );
  }

  Widget _buildThemeOption({
    required BuildContext context,
    required WidgetRef ref,
    required String title,
    required ThemeMode mode,
    required bool selected,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: () {
        ref.read(themeModeProvider.notifier).setThemeMode(mode);
        context.pop();
      },
      borderRadius: BorderRadius.circular(12.r),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyles.bodyLarge.copyWith(
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                color: selected ? AppColors.primary : null,
              ),
            ),
            if (selected)
              const Icon(Icons.check_circle_rounded, color: AppColors.primary)
            else
              Icon(
                Icons.circle_outlined,
                color: isDark ? AppColors.borderDark : AppColors.borderLight,
              ),
          ],
        ),
      ),
    );
  }
}
