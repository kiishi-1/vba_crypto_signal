import 'package:flutter/material.dart';
import 'package:vba_crypto_signal/core/constants/app_constants.dart';
import 'package:vba_crypto_signal/core/constants/assets.dart';
import 'package:vba_crypto_signal/core/utils/colors.dart';
import 'package:vba_crypto_signal/core/utils/text.dart';
import 'package:vba_crypto_signal/views/dashboard/dashboard_view.dart';
import 'package:vba_crypto_signal/views/home/components/nav_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  onClick(int currentIndex) {
    setState(() {
      selectedIndex = currentIndex;
    });
  }

  List<Map<String, dynamic>> svgList = [
    {
      AppConstants.svgPath: SvgAssets.pieChart,
      AppConstants.size: 50,
    },
    {
      AppConstants.svgPath: SvgAssets.activity,
      AppConstants.size: 24,
    },
    {
      AppConstants.svgPath: SvgAssets.setting,
      AppConstants.size: 24,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: AppColors.scaffoldBackgroundColor,
        child: Container(
          width: double.infinity,
          height: 85,
          clipBehavior: Clip.hardEdge,
          padding: const EdgeInsets.symmetric(
            horizontal: 62,
          ),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(45),
              topRight: Radius.circular(45),
            ),
            gradient: LinearGradient(
              colors: [
                Colors.white,
                AppColors.scaffoldBackgroundColor,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                svgList.length,
                ((index) {
                  return GestureDetector(
                    onTap: () {
                      onClick(index);
                    },
                    child: NavIcon(
                      index: index,
                      selectedIndex: selectedIndex,
                      size: svgList[index][AppConstants.size],
                      svgPath: svgList[index][AppConstants.svgPath],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      body: selectedIndex == 0
          ? const DashboardView()
          : selectedIndex == 1
              ? Scaffold(
                  body: Center(
                    child: AppText.mont1(
                      "Coming Soon",
                      color: Colors.white,
                    ),
                  ),
                )
              : Scaffold(
                  body: Center(
                    child: AppText.mont1(
                      "Screen Unavailable",
                      color: Colors.white,
                    ),
                  ),
                ),
    );
  }
}
