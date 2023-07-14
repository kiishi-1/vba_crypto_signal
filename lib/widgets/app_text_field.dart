import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vba_crypto_signal/core/utils/colors.dart';
import 'package:vba_crypto_signal/core/utils/text.dart';
import 'package:vba_crypto_signal/core/utils/textstyles.dart';
import 'package:vba_crypto_signal/widgets/gap.dart';

class AppTextField extends StatefulWidget {
  final String? hint;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool isPassword;
  final List<TextInputFormatter> formatter;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final int? maxLines;
  final int? minLines;
  final Color? fillColor;
  final Function(String)? onSubmitted;
  final int? maxLength;
  final String? title;
  final bool istitle;
  const AppTextField({
    Key? key,
    this.hint,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.maxLines,
    this.minLines,
    this.isPassword = false,
    this.formatter = const [],
    this.onChanged,
    this.onSubmitted,
    this.fillColor,
    this.maxLength,
    this.title,
    this.istitle = true,
  }) : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool obscure;
  @override
  void initState() {
    obscure = widget.isPassword;
    super.initState();
  }

  toggleVisibility() {
    setState(() {
      obscure = !obscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.istitle
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.mont2(
                    widget.title,
                    color: Colors.white,
                  ),
                  Gap.s8,
                ],
              )
            : const SizedBox(),
        TextFormField(
          maxLength: widget.maxLength,
          maxLines: widget.maxLines ?? 1,
          minLines: widget.minLines,
          style: AppTextStyle.noto.copyWith(color: Colors.white),
          controller: widget.controller,
          inputFormatters: widget.formatter,
          onFieldSubmitted: widget.onSubmitted,
          validator: widget.validator,
          keyboardType: widget.keyboardType,
          obscureText: obscure,
          decoration: InputDecoration(
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(obscure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined),
                    onPressed: toggleVisibility,
                    color: AppColors.gold,
                  )
                : null,
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
            fillColor:
                widget.fillColor ?? const Color(0xff0E2033).withOpacity(0.7),
            hintText: widget.hint,
            hintStyle: AppTextStyle.noto.copyWith(color: AppColors.grey),
            errorStyle: AppTextStyle.noto.copyWith(color: Colors.red),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: AppColors.gold),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(color: Colors.redAccent),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(color: Colors.redAccent),
            ),
          ),
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
