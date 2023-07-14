import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vba_crypto_signal/core/utils/colors.dart';
import 'package:vba_crypto_signal/core/utils/text.dart';
import 'package:vba_crypto_signal/widgets/gap.dart';

class DashboardCryptoCard extends StatelessWidget {
  const DashboardCryptoCard(
      {super.key,
      required this.index,
      required this.svg,
      required this.coin,
      required this.percent});
  final int index;
  final String svg;
  final String coin;
  final String percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 14),
      padding: const EdgeInsets.only(left: 12, right: 22, top: 12, bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.scaffoldBackgroundSecondary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 42,
            width: 42,
            padding: EdgeInsets.all(index == 2 ? 11 : 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: index == 2
                  ? AppColors.gold.withOpacity(0.2)
                  : Colors.transparent,
            ),
            child: SvgPicture.asset(
              svg,
              color: index == 2 ? AppColors.gold : null,
            ),
          ),
          Gap.s20,
          AppText.mont4(
            coin,
            color: Colors.white,
          ),
          Gap.s4,
          AppText.eUkraine2(
            percent,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
