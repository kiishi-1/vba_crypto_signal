import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vba_crypto_signal/core/constants/assets.dart';
import 'package:vba_crypto_signal/core/utils/text.dart';
import 'package:vba_crypto_signal/widgets/gap.dart';

class DashboardWalletCard extends StatelessWidget {
  const DashboardWalletCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 168,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 14,
        bottom: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage(
            PngAssets.background,
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 0.7,
          sigmaY: 0.7,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText.mont4(
                  "Wallet",
                  color: Colors.white,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 14),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.white)),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        SvgAssets.binance,
                        height: 16,
                        width: 16,
                        color: Colors.white,
                      ),
                      Gap.s6,
                      AppText.mont4(
                        "Binance",
                        color: Colors.white,
                      ),
                      Gap.s14,
                      SvgPicture.asset(
                        SvgAssets.arrowDown,
                        height: 24,
                        width: 24,
                        color: Colors.white,
                      ),
                      // const Icon(
                      //   Icons.keyboard_arrow_down_sharp,
                      //   color: Colors.white,
                      //   size: 24,
                      // )
                    ],
                  ),
                )
              ],
            ),
            Gap.s32,
            AppText.mont4(
              "Account Balance",
              color: Colors.white,
            ),
            Gap.s10,
            AppText.eUkraine1(
              "\$ 12 480.00",
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
