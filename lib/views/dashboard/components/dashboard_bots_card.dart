import 'package:flutter/material.dart';
import 'package:vba_crypto_signal/core/utils/colors.dart';
import 'package:vba_crypto_signal/core/utils/text.dart';
import 'package:vba_crypto_signal/widgets/gap.dart';

class DashboardBotsCard extends StatelessWidget {
  const DashboardBotsCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isActive,
  });
  final String title;
  final String subtitle;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 15,
        left: 20,
        right: 20,
      ),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.scaffoldBackgroundSecondary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.mont2(
                title,
                maxLines: 2,
                color: Colors.white,
              ),
              Gap.s10,
              AppText.mont3(
                subtitle,
                color: AppColors.grey,
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 7,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.activeGreen.withOpacity(0.1),
            ),
            child: Row(
              children: [
                Container(
                  height: 6,
                  width: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isActive ? AppColors.activeGreen : AppColors.grey,
                  ),
                ),
                Gap.s8,
                AppText.mont3(
                  isActive ? "Active" : "Inactive",
                  color: isActive ? AppColors.activeGreen : AppColors.grey,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
