import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vba_crypto_signal/core/utils/colors.dart';

class NavIcon extends StatelessWidget {
  const NavIcon(
      {super.key,
      required this.svgPath,
      required this.selectedIndex,
      required this.index,
      required this.size});
  final String svgPath;
  final int selectedIndex;
  final int index;
  final int size;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: selectedIndex == index ? AppColors.gold : Colors.transparent,
            blurRadius: 50,
            // offset: Offset(0, 0),
            // spreadRadius: 0.005,
          ),
        ],
      ),
      child: SvgPicture.asset(
        svgPath,
        height: size.toDouble(),
        width: size.toDouble(),
        color: selectedIndex == index ? AppColors.gold : Colors.white,
      ),
    );
  }
}
