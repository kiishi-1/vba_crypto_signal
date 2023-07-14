import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vba_crypto_signal/core/constants/app_constants.dart';
import 'package:vba_crypto_signal/core/constants/assets.dart';
import 'package:vba_crypto_signal/core/utils/colors.dart';
import 'package:vba_crypto_signal/core/utils/text.dart';
import 'package:vba_crypto_signal/views/dashboard/components/dashboard_bots_card.dart';
import 'package:vba_crypto_signal/views/dashboard/components/dashboard_crypto_card.dart';
import 'package:vba_crypto_signal/views/dashboard/components/dashboard_wallet_card.dart';
import 'package:vba_crypto_signal/widgets/gap.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  late bool isTab;
  ScrollController controller = ScrollController();

  List<Map<String, dynamic>> cryptoList = [
    {
      AppConstants.svg: SvgAssets.bitcoin,
      AppConstants.coin: "BTCUSDT",
      AppConstants.percentage: "36.77 %"
    },
    {
      AppConstants.svg: SvgAssets.ethereum,
      AppConstants.coin: "ETHUSDT",
      AppConstants.percentage: "24.77 %"
    },
    {
      AppConstants.svg: SvgAssets.binance,
      AppConstants.coin: "BNBUSDT",
      AppConstants.percentage: "36.07 %"
    },
    {
      AppConstants.svg: SvgAssets.bitcoin,
      AppConstants.coin: "BTCUSDT",
      AppConstants.percentage: "36.77 %"
    },
  ];
  List<bool> activeList = [true, false, true];
  @override
  void initState() {
    isTab = true;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Gap.s32,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.gold,
                    image: const DecorationImage(
                      image: AssetImage(PngAssets.maleProfilePic),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Gap.s10,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.mont1(
                      "Hey, Jacobs",
                      color: Colors.white,
                    ),
                    AppText.mont2(
                      "Welcome back",
                      fontSize: 13,
                      color: AppColors.grey,
                    ),
                  ],
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                SvgPicture.asset(
                  SvgAssets.notification,
                  height: 24,
                  width: 24,
                ),
              ],
            ),
          ),
          Gap.s6,
          Expanded(
              child: ListView(
            children: [
              Gap.s10,
              const DashboardWalletCard(),
              Gap.s10,
              RawScrollbar(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                controller: controller,
                trackVisibility: true,
                thumbVisibility: true,
                thickness: 2,
                trackColor: AppColors.scaffoldBackgroundSecondary,
                thumbColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: SingleChildScrollView(
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Gap.s20,
                        ...List.generate(
                          cryptoList.length,
                          (index) => DashboardCryptoCard(
                            index: index,
                            svg: cryptoList[index][AppConstants.svg],
                            coin: cryptoList[index][AppConstants.coin],
                            percent: cryptoList[index][AppConstants.percentage],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Gap.s14,
              Gap.s26,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      isTab = false;
                      setState(() {});
                    },
                    child: Container(
                      width: 130,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        color: isTab
                            ? Colors.transparent
                            : AppColors.scaffoldBackgroundSecondary,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: AppText.mont2(
                        "Signal Groups",
                        color: Colors.white,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      isTab = true;
                      setState(() {});
                    },
                    child: Container(
                      width: 130,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        color: isTab
                            ? AppColors.scaffoldBackgroundSecondary
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: AppText.mont2(
                        "Bots",
                        color: Colors.white,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
              Gap.s14,
              isTab
                  ? Column(
                      children: [
                        ...List.generate(
                            activeList.length,
                            (idx) => DashboardBotsCard(
                                  isActive: activeList[idx],
                                  subtitle: 'Distribution Bot',
                                  title: 'EMA Cross 50  200 + ADX\n(Long)',
                                )),
                      ],
                    )
                  : Container(),
            ],
          ))
        ],
      )),
    );
  }
}
