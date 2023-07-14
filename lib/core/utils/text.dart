// ignore_for_file: prefer_equal_for_default_values, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:vba_crypto_signal/core/utils/textstyles.dart';

class AppText extends StatelessWidget {
  final String? text;
  final TextStyle style;
  final bool multiText;
  final TextOverflow overflow;
  final Color? color;
  final bool centered;
  final int? maxLines;
  final TextAlign? textAlign;
  final double? fontSize;
  final FontWeight? fontWeight;

  /// font `mont1`
  ///  fontSize `20`
  ///  fontWeight `700`
  AppText.mont1(
    this.text, {
    this.multiText = false,
    this.overflow = TextOverflow.ellipsis,
    this.centered = false,
    this.textAlign,
    this.color,
    this.maxLines,
    this.fontSize,
    this.fontWeight,
  }) : style = AppTextStyle.mont1.copyWith(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        );

  /// font `mont2`
  ///  fontSize `14`
  ///  fontWeight `600`
  AppText.mont2(
    this.text, {
    this.multiText = false,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
    this.fontSize,
    this.fontWeight,
  }) : style = AppTextStyle.mont2.copyWith(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        );

  /// font `mont3`
  ///  fontSize `12`
  ///  fontWeight `600`
  AppText.mont3(
    this.text, {
    this.multiText = false,
    this.overflow = TextOverflow.ellipsis,
    this.centered = false,
    this.textAlign,
    this.color,
    this.maxLines,
    this.fontSize,
    this.fontWeight,
  }) : style = AppTextStyle.mont3.copyWith(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        );

  /// font `mont4`
  ///  fontSize `13`
  ///  fontWeight `400`
  AppText.mont4(
    this.text, {
    this.multiText = false,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
    this.fontSize,
    this.fontWeight,
  }) : style = AppTextStyle.mont4.copyWith(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        );

  /// font `roboto`
  ///  fontSize `14`
  ///  fontWeight `400`
  AppText.roboto(
    this.text, {
    this.multiText = false,
    this.overflow = TextOverflow.ellipsis,
    this.centered = false,
    this.textAlign,
    this.color,
    this.maxLines,
    this.fontSize,
    this.fontWeight,
  }) : style = AppTextStyle.roboto.copyWith(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        );

  /// font `nunito1`
  ///  fontSize `12`
  ///  fontWeight `500`
  AppText.nunito1(
    this.text, {
    this.multiText = false,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
    this.fontSize,
    this.fontWeight,
  }) : style = AppTextStyle.nunito1.copyWith(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        );

  /// font `nunito2`
  ///  fontSize `14`
  ///  fontWeight `400`
  AppText.nunito2(
    this.text, {
    this.multiText = false,
    this.overflow = TextOverflow.ellipsis,
    this.centered = false,
    this.textAlign,
    this.color,
    this.maxLines,
    this.fontSize,
    this.fontWeight,
  }) : style = AppTextStyle.nunito2.copyWith(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        );

  /// font `noto`
  ///  fontSize `12`
  ///  fontWeight `400`
  AppText.noto(
    this.text, {
    this.multiText = false,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
    this.fontSize,
    this.fontWeight,
  }) : style = AppTextStyle.noto.copyWith(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        );

  /// font `eUkraine1`
  ///  fontSize `32`
  ///  fontWeight `500`
  AppText.eUkraine1(
    this.text, {
    this.multiText = false,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
    this.fontSize,
    this.fontWeight,
  }) : style = AppTextStyle.eUkraine1.copyWith(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        );

  /// font `eUkraine2`
  ///  fontSize `20`
  ///  fontWeight `500`
  AppText.eUkraine2(
    this.text, {
    this.multiText = false,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
    this.fontSize,
    this.fontWeight,
  }) : style = AppTextStyle.eUkraine2.copyWith(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        );
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      maxLines: multiText || maxLines != null ? maxLines ?? 9999999999 : 1,
      overflow: overflow,
      textAlign: centered ? TextAlign.center : textAlign ?? TextAlign.left,
      style: style,
    );
  }
}
