import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrofy/core/themes/app_colors.dart';
import 'package:masrofy/core/themes/app_sizes.dart';

import 'package:masrofy/features/expenses/view/pages/expenses_screen.dart';
import 'package:masrofy/features/goals/views/pages/goals_screen.dart';
import 'package:masrofy/features/home/view/pages/home_screen.dart';
import 'package:masrofy/features/layout/view/pages/more_screen.dart';
import 'package:masrofy/features/layout/view/pages/reports_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = const [
      HomeScreen(),
      ReportsScreen(),
      GoalsScreen(),
      ExpensesScreen(),
      MoreScreen(),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'الرئيسية',
            activeIcon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart_outlined_rounded),
            label: 'التقارير',
            activeIcon: Icon(Icons.insert_chart_outlined_rounded),
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary,
              ),
              width: 50.w,
              height: 50.h,
              child: Icon(
                Icons.add,
                color: AppColors.backgroundLight,
                size: AppSizes.iconXL,
              ),
            ),
            label: '',
            activeIcon: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary,
              ),
              width: 50.w,
              height: 50.h,
              child: Icon(
                Icons.add,
                color: AppColors.backgroundLight,
                size: AppSizes.iconXL,
              ),
            ),
            backgroundColor: AppColors.backgroundLight,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            label: 'المعاملات',
            activeIcon: Icon(Icons.receipt_long_outlined),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz_rounded),
            label: 'المزيد',
            activeIcon: Icon(Icons.more_horiz_rounded),
          ),
        ],
      ),
      body: pages.elementAt(_selectedIndex),
    );
  }
}
